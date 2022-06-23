# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
    2.6.6

## Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server