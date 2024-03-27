# README

An implementation of the Todo API spec for [Todo Backend](https://www.todobackend.com/). This toy application is meant to demonstrate how to write unit tests in "real world" cases. This means:
- "Core logic" is extracted to a service class instead of the controller
- Todo creation adds a random Guid to the todo
- Todo creation calls a stub class that stands in for "enterprisey" side effects

The test for `TodosService.create` then demonstrates how to test this "hidden" code.

## Setup

This application uses Ruby 3.2. If you use Nix OS or Nix shell, it will install the required dependencies for you. Once Ruby 3.2 is set up, run:

```
bundle install
bin/rake test
bin/rails s
```

The tests should pass and the server should run on `localhost:3000`. Go to https://www.todobackend.com/specs/index.html?http://localhost:3000/todos to run the API spec tests.

## What's interesting?

All of the interesting parts of this code can be found in `app/services/todos_service.rb` and the associated tests in `test/services/todos_service_test.rb`. It is otherwise a pretty standard out-of-the-box pre-generated Rails application.
