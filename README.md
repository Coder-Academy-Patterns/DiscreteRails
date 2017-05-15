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

### Google Cloud / Bitname

#### [Instructions](https://docs.bitnami.com/google/infrastructure/ruby/#access_application)

#### Clone project from GitHub
```
cd /opt/bitnami
git clone https://github.com/coder-factory-academy/DiscreteRails.git
```

#### Edit Nginx config

```sh
sudo nano /opt/bitnami/nginx/conf/nginx.conf
```

Add:
```
  server {
    listen 80;
    root /opt/bitnami/DiscreteRails/public;
    passenger_enabled on;
    rails_env production;
    passenger_env_var SECRET_KEY_BASE replace_me_with_secret;
  }
```

#### Disable Apache

```
sudo /opt/bitnami/ctlscript.sh stop apache
sudo mv /opt/bitnami/apache2/scripts/ctl.sh /opt/bitnami/apache2/scripts/ctl.sh.disabled
sudo mv /opt/bitnami/config/monit/conf.d/apache.conf /opt/bitnami/config/monit/apache.conf.disabled
```

#### Compile assets

```
sudo NODE_ENV=production RAILS_ENV=production bundle exec rails assets:precompile
```

#### Compile Webpack assets (optional)

```
sudo NODE_ENV=production RAILS_ENV=production bundle exec rails webpacker:compile
```

#### Restart Nginx

```
sudo /opt/bitnami/ctlscript.sh restart nginx
```

#### Pull changes from GitHub
```
cd /opt/bitnami/DiscreteRails
sudo git pull
sudo NODE_ENV=production RAILS_ENV=production bundle exec rails assets:precompile
sudo /opt/bitnami/ctlscript.sh restart nginx
```