with import <nixpkgs> {};

mkShell {
  name = "ruby-env";
  packages = [
    ruby
    bundix
  ];
}
