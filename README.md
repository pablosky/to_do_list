# Requirements

- Docker 1.12+
- Docker Compose 1.8+

# Setup


Add `to_do_list.dev.com` to your `/etc/hosts` file.

## Building the application

```
docker-compose build
```

## Running the application

start the app
```
docker-compose up -d
```
make sure to not be using the port 80

# Testing

First, create the test database:

```
$ docker-compose exec to_do_list /bin/bash -c "RAILS_ENV=test rake db:create"
```

Then you can run the specs with:

```
$ docker-compose exec to_do_list /bin/bash -c "RAILS_ENV=test bundle exec rspec"
```

# Running migrations

```
$ docker-compose exec to_do_list /bin/bash -c "bundle exec rake db:migrate"
```
# Some thoughts

in a bigger app call to methods might come from other controllers, the authentication now is a joke and it will
definitely will be using at least a token in a real case
