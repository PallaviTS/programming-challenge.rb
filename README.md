# ADIB Xpress Finance

## Installation

### Prerequisites

The installation process assumes that you are running on macOS with [homebrew][1] installed.


### Project Setup

```sh
# install system dependencies via Homebrew
$ brew install mysql
$ brew install ruby-build rbenv rbenv-readline rbenv-ctags

# install the local ruby version and do the setup
$ bundle install --with mysql # We only use MySQL in development (MS SQL in production)
$ bin/setup

# start the project
$ bin/foreman start
```


### Git Hooks (powered by [`overcommit`][2])

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


## Development

This project follows the [gitflow][3] branching model. Also, we broadly follow the [Github Flow][4] with regard to pull-requests and code reviews.

```sh
$ brew install git-flow
$ git flow init -d
```

### Static Code Analysis

The project features [RubyCritic][5]. If you want to run a codeclimate-esque report, the execute the following:

```sh
$ bundle exec rubycritic
```

**TODO**: This may be included when running CI


[1]: http://brew.sh/
[2]: https://github.com/brigade/overcommit
[3]: https://github.com/nvie/gitflow
[4]: https://guides.github.com/introduction/flow/
[5]: https://github.com/whitesmith/rubycritic

Made with :heart: by Fidor
