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
#To try the app

The app can be tested using the postman addon in chrome,
You have to register a user with a post to http://to_do_list.dev.com/api/register_user with the email and password params
To try the other functionality you must use your email and password to access the api
 I.E  http://to_do_list.dev.com/api/user_tasks?email=pablor@gmail.com&password=123qwe (to get the user_tasks from the pablor@gmail user)

# Some thoughts

in a bigger app call to methods might come from other controllers, the authentication now is a joke and it will
definitely will be using at least a token in a real case. The api assumes when something go wrong it will return the object with nil values, error messages must be added. Finally we could add tests for the api responses but for time restrains i didn't do it (anyway it is just calling a method tested).
