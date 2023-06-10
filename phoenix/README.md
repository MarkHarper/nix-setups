# Phoenix

## Setup

- replace OTP_VERSION, ELIXIR_VERSION, and POSTGRES_VERSION with valid nix packages

## shellHook functions

- initializes a db if one does not exist
  - the db is initialized with the postgres role
- starts postgres service if it has not been started
- creates a script to run on closing the nix shell
  - shuts down postgres service
