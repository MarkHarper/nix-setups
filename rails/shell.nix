# node.nix
with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    ruby_[RUBY_VERSION]
    rubyPackages_[RUBY_VERSION].rails
    rubyPackages_[RUBY_VERSION].rubocop
    rubyPackages_[RUBY_VERSION].solargraph
    postgresql_[POSTGRES_VERSION]
  ];
  shellHook = ''
    export PGHOST=$HOME/postgres
    export PGDATA=$PGHOST/data
    export PGDATABASE=postgres
    export PGLOG=$PGHOST/postgres.log

    mkdir -p $PGHOST

    if [ ! -d $PGDATA ]; then
      initdb --auth=trust --no-locale --encoding=UTF8
    fi

    if ! pg_ctl status
    then
      pg_ctl start -l $PGLOG -o "--unix_socket_directories='$PGHOST'"
    fi

    PS0=$PS1 bash --rcfile ${writeText "rcfile" "export PS1=$PS0"} -i; 
    pg_ctl stop -l $PGLOG -o "--unix_socket_directories='$PGHOST'"
    exit
  '';
}
