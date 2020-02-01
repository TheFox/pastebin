# Pastebin

Command line interface for [Pastebin.com](https://pastebin.com/).

Just another Pastebin.com CLI script, but you can even login with your user account.

## Project Outlines

The project outlines as described in my blog post about [Open Source Software Collaboration](https://blog.fox21.at/2019/02/21/open-source-software-collaboration.html).

- The main purpose of this software is to provide a command-line interface to pastebin.com.
- The features should not go beyond pastebin.com's features and functions. So the features of this software are limited to those of pastebin.com.
- This list is open. Feel free to request features.

## Installation

The preferred method of installation is via RubyGems.org:  
<https://rubygems.org/gems/thefox-pastebin>

```bash
gem install thefox-pastebin
```

or via `Gemfile`:

```ruby
gem 'thefox-pastebin', '~>1.2'
```

Use it in your sources:

```ruby
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
