# Discrete Maths

## Installation

```
bundle install
yarn install
```

## Development

You must run Webpack’s server as well as Rails’ server:

(Tab 1)
```
rails s
```

(Tab 2)
```
./bin/webpack-dev-server
```

## Deployment

### Now
```
now --docker -e SECRET_KEY_BASE=$(rails secret)
```

### [Google Cloud / Bitname](https://docs.bitnami.com/google/infrastructure/ruby/#access_application)
