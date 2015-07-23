Vulnerability Management System (VMS)
====================================

## Introduction

Database of products and associated vulnerabilities, including full penetration test reports.

## System Dependencies

* Ruby 2.2.0
* SQLite 1.3.10

## Project Setup

Install the application dependencies by running the following

```shell
  $ gem install bundler && bundle install
```

Now proceed to set up the database using:

```shell
  $ bundle exec rake db:setup
```

And start the application with:

```shell
  $ bundle exec rails s
```

A simple rake task is provided to load in a set of product names from a CSV file:

```shell
  $ bundle exec rake import:products[filename]
```
N.B filename is optional with default filepath located at /resources/portofolio.csv

## Integration with Nessus

A rake task is provided to import vulnerabilities from a Nessus scan csv export (either for an existing or new product). Simply run the task and follow the instructions on screen.

```shell
  $ bundle exec rake import:nessus[filepath]
```

## Running Tests

Feature tests are run using the command:

```shell
  $ bundle exec rspec
```

## Environment variables

Please set the APP_USER and APP_PASS variables in production (required for http basic auth)
