with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "ruby-env";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "ruby-env";
  buildInputs = [bundix gems ruby];
}
