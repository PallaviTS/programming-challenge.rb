# ADIB Xpress Finance

This project follows the rules of [12factor.net][1]. Adjust any configuration in its corresponding .env-file, (e.g. `.env.development`).


## Installation

### Prerequisites

The installation process assumes that you are running on macOS with [homebrew][2] installed.


### Project Setup

```sh
# install system dependencies via Homebrew
$ brew install mysql
$ brew install ruby-build rbenv rbenv-readline rbenv-ctags
$ rbenv install `cat .ruby-version`

# install the local ruby version and do the setup
$ bundle install --with mysql # We only use MySQL in development (MS SQL in production)
$ bin/setup

# start the project
$ bin/foreman start
```


### Git Hooks (powered by [`overcommit`][3])

In case you bootstrap the project via `bin/setup`, you can skip this. Otherwise, you have the run the following command after cloning this repository to activate the Git Hooks.

There is also a custom commit hook, called `commit-msg`. This will aid the developer with the commit message format. When working on a feature branch (e.g. `feature/ADIB-870-something-awesome`), this hook will add the ticket ID before the actual commit message.

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

This project follows the [gitflow][4] branching model. Also, we broadly follow the [Github Flow][5] with regard to pull-requests and code reviews.

```sh
$ brew install git-flow
$ git flow init -d
```

### Static Code Analysis

The project features [RubyCritic][6]. If you want to run a codeclimate-esque report, the execute the following:

```sh
$ bundle exec rubycritic
```

**TODO**: This may be included when running CI


[1]: https://12factor.net
[2]: http://brew.sh/
[3]: https://github.com/brigade/overcommit
[4]: https://github.com/nvie/gitflow
[5]: https://guides.github.com/introduction/flow/
[6]: https://github.com/whitesmith/rubycritic

Made with :heart: by Fidor
