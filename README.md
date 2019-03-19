# Pastebin

Command line interface for [Pastebin.com](https://pastebin.com/).

Just another Pastebin.com CLI script, but you can even login with your user account.

## Install

The preferred method of installation is via RubyGems.org:  
<https://rubygems.org/gems/thefox-pastebin>

```bash
gem install thefox-pastebin
```

or via `Gemfile`:

```bash
gem 'thefox-pastebin', '~>1.2'
```

Use it in your sources:

```bash
require 'thefox-pastebin'
```

## Usage

Unless you are using `-f` the default input is [STDIN](https://en.wikipedia.org/wiki/Standard_streams).

### Help

```bash
pastebin -h
```

### Skel example

```bash
pastebin --skel
```

The default settings file is under `~/.pastebinrc`. You need to create it by yourself.

### Create a settings file

```bash
pastebin --skel > ~/.pastebinrc
```

### Print default settings

```bash
pastebin -D
```

### Use a different settings file

```bash
pastebin -c ~/.pastebinrc_user2
```

### Set a name for a paste

```bash
pastebin -n 'hello world'
```

### Set an expiration date for a paste (10 minutes)

```bash
pastebin -e 10m
```

### Set a format/language for a paste (PHP)

```bash
pastebin -l php
```

### Paste a specific file

```bash
pastebin -f file.txt
```

### Create an unlisted paste

```bash
pastebin -u
```

### Create a private paste

```bash
pastebin -p
```

### Get the raw contents of a paste

```bash
pastebin -r <ID>
```

### Login

As a registered pastebin.com user you can login and let `pastebin` create pastes on behalf of you. You need to enter your username and password. The login credentials are not stored to any configuration file or anywhere else.

```bash
pastebin --login
```

After a successfull login you need to add the `API_USER_KEY=` line to your settings file (`~/.pastebinrc`). This user key is associated to your pastebin.com user.

You can also use your own Developer API Key. See [pastebin.com API documentation](https://pastebin.com/api) for more details.

### Examples

- `pastebin -n hello_world -e 10m -f hello_world.txt`
- `pastebin -n 'PHP Script' -l php -f login.php`
- `pastebin -u -e 1m -l php -f test.php`
- `pastebin -n 'Collect Script' -p -e 10m -l awk -f collect.awk`
- `pastebin -r UJwPUmKp`
- `cat /tmp/hello_world.txt | pastebin`

## Project Links

- [Gem](https://rubygems.org/gems/thefox-pastebin)
- [Travis CI Repository](https://travis-ci.org/TheFox/pastebin)

## License

Copyright (C) 2015 Christian Mayer <https://fox21.at>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
