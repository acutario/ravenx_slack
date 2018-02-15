# ravenx_slack

[![Current Version](https://img.shields.io/hexpm/v/ravenx_slack.svg)](https://hex.pm/packages/ravenx_slack)
[![Build Status](https://travis-ci.org/acutario/ravenx_slack.svg?branch=master)](https://travis-ci.org/acutario/ravenx_slack)

Ravenx strategy to send Slack notifications

## Installation

The package can be installed as simply as adding `ravenx` and `ravenx_slack` to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [
      {:ravenx, "~> 2.0"},
      {:ravenx_slack, "~> 0.1"}
    ]
  end
```

## Configuration

To enable this strategy, just specify it in your `ravenx` configuration:

```elixir
config :ravenx,
  strategies: [
    slack: Ravenx.Strategy.Slack
  ]
```

### Available configuration

The module can be configured as mentioned on the
[Ravenx's README](https://github.com/acutario/ravenx/blob/master/README.md),
been able to configure the following variables:

- **url**: the URL of the webhook you have isntalled in your Slack.
- **channel**: channel to post the message. If not specified, will use default's one specified in the webhook configuration.
- **username**: User name to show in the notification. If not specified, will use default's one specified in the webhook configuration.
- **icon_emoji**: Emoji to use in the notification as avatar. If not specified, will use default's one specified in the webhook configuration.

### Payload

Any field specified
[in the official documentation](https://api.slack.com/incoming-webhooks) can be
send in a `map` as the payload.

## Contribute

All contributions are welcome, and we really hope this repo will serve for beginners as well for more advanced developers.

If you have any doubt, feel free to ask, but always respecting our [Code of Conduct](https://github.com/acutario/ravenx_slack/blob/master/CODE_OF_CONDUCT.md).

To contribute, create a fork of the repository, make your changes and create a PR. And remember, talking on PRs/issues is a must!
