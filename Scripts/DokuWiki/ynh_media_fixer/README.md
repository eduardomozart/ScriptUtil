# YunoHost DokuWiki Truncated Media Fixer

## Motivation

When exporting a DokuWiki backup from YunoHost (or migrating across certain file systems), media file names can sometimes be truncated. This typically happens because the total length of the file path, name, and extension exceeds the file system's maximum allowed character limit (usually 255 characters). 

As a result, media files (like images, PDFs, etc.) in the `data/media` directory may lose their file extensions entirely or have them cut short (e.g., `.jp` instead of `.jpg`). This breaks the media links across the wiki since the actual file names on disk no longer match the references inside the `.txt` page files.

## How It Works

This script automatically restores the original file names by doing the following:
1. **Scanning**: It recursively scans the `data/media` directory for any files that have no extension or an incomplete extension (less than 4 characters including the dot).
2. **Matching**: For each truncated file, it searches through the `data/pages` directory (using `grep`) to find where that file was referenced in the wiki's `.txt` pages.
3. **Namespace Validation**: To ensure accuracy, the script parses the DokuWiki media link found in the text file and validates that the namespace (e.g., `:o365:bill:`) strictly matches the actual subfolder structure where the truncated file is located.
4. **Renaming**: Once the exact, original full file name is extracted from the page text, the script renames the truncated file on disk to restore its full name and extension.

## Usage

### Prerequisites
- Python 3.x
- A standard Linux/Unix environment with `grep` available (the script uses `grep` under the hood for fast text searching).

### Command

Run the script by passing the root directory of your DokuWiki installation. 

```bash
python3 fix_media_names.py /path/to/dokuwiki_root
```

### Options

- `--dry-run`: **Highly Recommended for the first run.** This flag will simulate the process and print out what *would* be renamed, without actually modifying any files on the disk.

```bash
python3 fix_media_names.py /home/user/web/wiki.domain.com/public_html --dry-run
```

## Example Output

```text
Scanning /home/user/web/wiki.domain.com/public_html/data/media for truncated files...
Running in DRY-RUN mode. No files will be modified.
[DRY-RUN] Would rename:
  From: /home/user/.../data/media/o365/bill/vs--courseab-900copilotagentadministratio
  To:   /home/user/.../data/media/o365/bill/vs--courseab-900copilotagentadministrationfundamentalscourseudemy-7_45_.jpg

----------------------------------------
Dry-run complete. Would have renamed 1 files.
```
