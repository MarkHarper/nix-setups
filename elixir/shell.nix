# node.nix
with (import <nixpkgs> {});

let otp = pkgs.beam.packages.erlangR[OTP_VERSION];

in mkShell {
  buildInputs = [
    otp.elixir[ELIXIR_VERSION]
  ];
}
