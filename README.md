Vulnerability Management System (VMS)
====================================

# Introduction

Database of products and associated vulnerabilities, including full penetration test reports.

# System Dependencies

* Ruby 2.2.0
* SQLite 1.3.10

# Project Setup

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
  $ bundle exec rake import:products [filename]
```
N.B filename is optional with default filepath located at /resources/portofolio.csv

# Running Tests

Feature tests are run using the command:

```shell
  $ bundle exec rspec
```