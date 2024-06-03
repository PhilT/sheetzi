with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "gemss-for-sheetzi";
    ruby = ruby_3_2;
    gemdir = ./.;
  };
in mkShell {
  buildInputs = [
    gems
    gems.wrappedRuby
  ];
}
