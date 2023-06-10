# Rails 7

## Setup

- replace RUBY_VERSION and POSTGRES_VERSION with valid nix packages

## shellHook functions

- initializes a db if one does not exist
- starts postgres service if it has not been started
- creates a script to run on closing the nix shell
  - shuts down postgres service

## Code Workspace

- used for integration with vsCode
- supports rubocop and solargraph
- requires Nix Environment Selector vsCode extension
