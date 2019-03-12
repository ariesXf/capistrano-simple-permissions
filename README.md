# Capistrano::SimplePermissions

[![Gem Version](https://badge.fury.io/rb/capistrano-simple-permissions.svg)](https://badge.fury.io/rb/capistrano-simple-permissions)

Capistrano task for ensuring specific permissions (including owner and group) on files and folders on deploy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-simple-permissions'
```

Then add it to your `Capfile`:

```ruby
require 'capistrano/simple_permissions'
```

And then:

```sh
$ bundle install
```

Then Either in your server config or general `deploy.rb`, you must set the `:permissions_folders` variable to an array
of at least one directory; otherwise this gem won't do anything.

## How it works

This gem hooks into Capistrano's deploy process by executing several `chmod` and `chown` commands after the
`deploy:log_revision` portion of Capistrano's [flow](https://capistranorb.com/documentation/getting-started/flow/). See
the source for more details.

## Options

- ```ruby
    set :permissions_folders, []
  ```

  - Sets the folders that should be recursively affected by both `chmod` and `chown`. A sensible setting to use would be
    `set :permissions_folders, [fetch(:deploy_to)]` in your `deploy.rb`

- ```ruby
  set :chmod_folder_permissions, "775"
  ```

  - Sets the permissions for folders that `chmod` will affect

- ```ruby
  set :chmod_file_permissions, "664"
  ```

  - Sets the permissions for files that `chmod` will affect

- ```ruby
  set :chown_owner, ""
  ```

  - Sets the owner of the files for `chown`. Note that the command isn't run as root so changing this to anything other
    than the default of `""` might cause errors unless your deploy user has the correct permissions.

- ```ruby
  set :chown_group, "web"
  ```

  - Sets the group of the files for `chown`.

## Contributing

Bug reports and pull requests are welcome!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
