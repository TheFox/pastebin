# Pastebin

Command line interface for [Pastebin.com](https://pastebin.com/).

Just another Pastebin.com CLI script, but you can even login with your user account.

## Usage

Unless you are using `-f` the default input is [STDIN](https://en.wikipedia.org/wiki/Standard_streams).

### Help

	pastebin -h

### Skel example

	pastebin --skel

The default settings file is under `~/.pastebinrc`. You need to create it by yourself.

You can create a settings file with

	pastebin --skel > ~/.pastebinrc

### Print default settings

	pastebin -D

### Use a different settings file

	pastebin -c ~/.pastebinrc_user2

### Set a name for a paste

	pastebin -n 'hello world'

### Set an expiration date for a paste (10 minutes)

	pastebin -e 10m

### Set a format/language for a paste (PHP)

	pastebin -l php

### Paste a specific file

	pastebin -f file.txt

### Create an unlisted paste

	pastebin -u

### Create a private paste

	pastebin -p

### Get the raw contents of a paste

	pastebin -r <ID>

### Examples

- `pastebin -n hello_world -e 10m -f hello_world.txt`
- `pastebin -n 'PHP Script' -l php -f login.php`
- `pastebin -u -e 1m -l php -f test.php`
- `pastebin -n 'Collect Script' -p -e 10m -l awk -f collect.awk`
- `pastebin -r UJwPUmKp`
- `cat /tmp/hello_world.txt | pastebin`

## License
Copyright (C) 2015 Christian Mayer <http://fox21.at>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
