# dotenv ➡️ ci 

[![Twitter: @joshdholtz](https://img.shields.io/badge/contact-@joshdholtz-blue.svg?style=flat)](https://twitter.com/joshdholtz)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/fastlane/fastlane/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/dotenv_to_ci.svg?style=flat)](https://rubygems.org/gems/dotenv_to_ci)

The laziest way to transfer a environment variables from a `.env` file to a CI provider 💪

## Example 🤯
Runs `circleci` to upload the contents of `.env.test` to the `joshdholtz/fastlane-circleci-test` GitHub project on [CircleCI](http://circleci.com/) 🚀

```sh
$ dotenv_to_ci circleci -V github -u joshdholtz -p "fastlane-circleci-test" -d ".env.test" --verbose
Setting key=DISABLE_HOOKS} value=true
Setting key=FASTLANE_TEAM_ID} value=12345321234
Setting key=AWS_SNS_ACCESS_KEY} value=less secrety but you kow
Setting key=AWS_SNS_SECRET_ACCESS_KEY} value=sshhhhhh
Setting key=AWS_SNS_REGION} value=us-east-1
Setting key=AWS_SNS_PLATFORM_GCM_API_KEY} value=a key you dont need to see
Setting key=SIGH_APP_IDENTIFIER} value=com.app.ios
Setting key=SIGH_USERNAME} value=dontenable2fa@email.com
Setting key=SIGH_TEAM_ID} value=324324324
Setting key=CORDOVA_IOS_TEAM_ID} value=324324324
Setting key=FASTLANE_PASSWORD} value=fastlaneisthebest
Setting key=FL_HOCKEY_API_TOKEN} value=riphockeyiwillmissyou
Setting key=FL_HOCKEY_NOTES_TYPE} value=1
Successfully added: DISABLE_HOOKS, FASTLANE_TEAM_ID, AWS_SNS_ACCESS_KEY, AWS_SNS_SECRET_ACCESS_KEY, AWS_SNS_REGION, AWS_SNS_PLATFORM_GCM_API_KEY, SIGH_APP_IDENTIFIER, SIGH_USERNAME, SIGH_TEAM_ID, CORDOVA_IOS_TEAM_ID, FASTLANE_PASSWORD, FL_HOCKEY_API_TOKEN, FL_HOCKEY_NOTES_TYPE
```

And the results on [CircleCI](http://circleci.com/)! 🎊🎉

![CircleCI Screenshot](https://raw.githubusercontent.com/joshdholtz/dotenv_to_ci/screenshots/dotenv_to_ci_circleci.png)

## Installation 🔨 

```sh
$ gem install dotenv_to_ci
```

or with [Bundler](https://bundler.io/)

```rb
source "https://rubygems.org"
gem "dotenv_to_ci"
```

## Options 🤔 

```sh
$ dotenv_to_ci --help
  NAME:
    dotenv_to_ci
  DESCRIPTION:
    Set environment variables on your CI provider
  COMMANDS:
    circleci Set environment variables on CircleCI
    help     Display global or [command] help documentation
  GLOBAL OPTIONS:
    --verbose
    -h, --help
        Display help documentation
    -v, --version
        Display version information
    -t, --trace
        Display backtrace when an error occurs
```

### CircleCI
```sh
$ dotenv_to_ci circleci --help
  NAME:
    circleci
  SYNOPSIS:
    dotenv_to_ci circleci
  DESCRIPTION:
    Set environment variables on CircleCI
  OPTIONS:
    -d, --dotenvs STRING
        Dotenv file name(s) (ex: .env, .env.secret)
    -T, --token STRING
        API token
    -V, --vcs STRING
        VCS (allowed: github, bitbucket)
    -u, --username STRING
        Username
    -p, --project STRING
        Project
```
