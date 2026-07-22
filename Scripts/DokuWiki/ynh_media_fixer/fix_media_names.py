#!/usr/bin/env python3
import os
import sys
import argparse
import subprocess
import re

def main():
    parser = argparse.ArgumentParser(description="Fix truncated DokuWiki media file names.")
    parser.add_argument("dokuwiki_root", help="Path to the DokuWiki root directory (e.g., /home/nethouse/web/wiki.nethouse.inf.br/public_html)")
    parser.add_argument("--dry-run", action="store_true", help="Only show what would be renamed, without actually renaming.")

    args = parser.parse_args()

    media_dir = os.path.join(args.dokuwiki_root, 'data', 'media')
    pages_dir = os.path.join(args.dokuwiki_root, 'data', 'pages')

    if not os.path.isdir(media_dir):
        print(f"Error: Media directory not found at {media_dir}")
        sys.exit(1)

    if not os.path.isdir(pages_dir):
        print(f"Error: Pages directory not found at {pages_dir}")
        sys.exit(1)

    print(f"Scanning {media_dir} for truncated files...")
    if args.dry_run:
        print("Running in DRY-RUN mode. No files will be modified.")

    renamed_count = 0
    not_found_count = 0

    for root, dirs, files in os.walk(media_dir):
        # Calculate the expected namespace for files in this directory
        rel_dir = os.path.relpath(root, media_dir)
        if rel_dir == '.' or rel_dir == '':
            expected_ns = ''
        else:
            expected_ns = rel_dir.replace(os.sep, ':')

        for filename in files:
            # We want files with no extension or an extension less than 4 chars (including dot, e.g. .jp)
            _, ext = os.path.splitext(filename)

            if len(ext) < 4:
                old_path = os.path.join(root, filename)

                try:
                    # Use grep to find the truncated filename in pages.
                    # -r: recursive, -F: fixed string, -H: print filename, -I: ignore binary
                    result = subprocess.run(
                        ['grep', '-rFHI', filename, pages_dir],
                        capture_output=True, text=True
                    )

                    if result.stdout:
                        # Extract the full name from the lines
                        # The full name starts with an optional namespace and the truncated filename
                        # and goes until a pipe '|', curly brace '}', or whitespace.
                        pattern = re.compile(r'([^\s|{}]*' + re.escape(filename) + r'[^|\s}?]+)')

                        full_name = None
                        for line in result.stdout.splitlines():
                            # grep -H output format: filepath:content
                            if ':' not in line:
                                continue

                            page_path, content = line.split(':', 1)

                            match = pattern.search(content)
                            if match:
                                media_link = match.group(1).lstrip(':')
                                link_parts = media_link.split(':')
                                link_filename = link_parts[-1]
                                link_ns = ':'.join(link_parts[:-1])

                                # Validate Namespace
                                if link_ns:
                                    if link_ns != expected_ns:
                                        continue  # Namespace mismatch
                                else:
                                    # Relative link, assume namespace of the page
                                    page_rel_path = os.path.relpath(page_path, pages_dir)
                                    page_ns_dir = os.path.dirname(page_rel_path)
                                    if page_ns_dir == '.' or page_ns_dir == '':
                                        page_ns = ''
                                    else:
                                        page_ns = page_ns_dir.replace(os.sep, ':')

                                    if page_ns != expected_ns:
                                        continue  # Page namespace mismatch

                                # Validate if this potential name ends with a valid-looking extension
                                _, p_ext = os.path.splitext(link_filename)
                                if len(p_ext) >= 4:  # .jpg, .png, .jpeg, etc.
                                    full_name = link_filename
                                    break

                        if full_name:
                            new_path = os.path.join(root, full_name)
                            if args.dry_run:
                                print(f"[DRY-RUN] Would rename:\n  From: {old_path}\n  To:   {new_path}\n")
                                renamed_count += 1
                            else:
                                print(f"Renaming:\n  From: {old_path}\n  To:   {new_path}\n")
                                try:
                                    os.rename(old_path, new_path)
                                    renamed_count += 1
                                except Exception as e:
                                    print(f"  [!] Error renaming: {e}")
                        else:
                            # We found the truncated string but couldn't parse the full extension / namespace didn't match.
                            pass

                except Exception as e:
                    print(f"Error searching for {filename}: {e}")

    print("-" * 40)
    if not args.dry_run:
        print(f"Done! Successfully renamed {renamed_count} files.")
    else:
        print(f"Dry-run complete. Would have renamed {renamed_count} files.")

if __name__ == "__main__":
    main()
