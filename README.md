# Discrete Maths

## Development

```
bundle install
yarn install
rails s
```

## Deployment

```
now --docker -e SECRET_KEY_BASE=$(rails secret)
```
