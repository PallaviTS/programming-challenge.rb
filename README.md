# ADIB Xpress Finance

## Installation

### Project Setup

```sh
# install system dependencies via Homebrew
$ brew install mysql
$ brew install ruby-build rbenv rbenv-readline rbenv-ctags

# install the local ruby version and do the setup
$ bin/setup

# start the project
$ bin/foreman start
```

### Git Hooks (powered by [overcommit](https://github.com/brigade/overcommit))

You have the run the following command after cloning this repository to activate the Git Hooks:

```sh
$ bundle exec overcommit --install

# We are using a custom pre-commit hook for overcommit: It has to be "signed"
# before overcommit executes it...
$ bundle exec overcommit --sign commit-msg
```

This project uses two hooks:

1. `pre-push` -- it runs `rspec` before you push. Your push is rejected if one or more tests fail. Please fix all failing tests and try again.
2. `pre-commit` -- it runs `rubocop` to lint and style-check the entire codebase. Your commit is rejected if `rubocop` detected any offenses. Please fix all offenses and try again.
