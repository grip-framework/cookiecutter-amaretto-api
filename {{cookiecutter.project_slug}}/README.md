# {{cookiecutter.project_name}}

TODO: Write a description here

## Installation

Create two database instances and name it after `{{cookiecutter.project_slug}}_dev`, `{{cookiecutter.project_slug}}_test`.

```bash
cp .envrc.example .envrc
direnv allow
shards install
ENVIRONMENT=development crystal run src/cli.cr -- up
```

## Usage

```bash
ENVIRONMENT=development crystal run src/process_manager.cr
```

## Testing

```bash
ENVIRONMENT=test crystal spec
```

If you come across any database related errors make sure to execute the migrations.

```bash
ENVIRONMENT=test crystal run src/cli.cr -- up
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/{{cookiecutter.project_slug}}/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [{{cookiecutter.full_name}}](https://github.com/your-github-user) - creator and maintainer
