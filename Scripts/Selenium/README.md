# Python Selenium

## Dependencies

You may need to install the following dependencies to run it on macOS:

```
brew install chromedriver selenium-server
/usr/bin/python3 -m pip install selenium
```

## F5 VPN HTML Login Automation

I created this Python code to be able to automate F5 VPN Web login through [Royal TSX](https://www.royalapps.com/ts/mac/features) (Command Task).

```
/usr/bin/python3 F5VPN.py
```

## Axis Security Login Automation

I created this Python code to be able to automate Axis Security login through [Royal TSX](https://www.royalapps.com/ts/mac/features) (Command Task).

```
/bin/bash AxisSecurity-Inline.sh
```

## Troubleshooting

You can redirect stderr to stdout using the following command:

```
/usr/bin/python3 F5VPN.py > ~/Desktop/debug.log 2>&1
```

A ``debug.log`` file will be created on Desktop containing stdout and stderr information.

## Known issues

If password has ``!`` (exclamation mark) on it, the "Run in Terminal" option in Command Task can break the command. The solution would be uncheck it or add a backslash before the exclamation mark ``\!`` in the Credential to make it work as expected when "Run in Terminal" is checked.
