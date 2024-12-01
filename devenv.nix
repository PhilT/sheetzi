{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [ 
    ruby_3_3
  ];

  enterShell = ''
    bundle check || bundle
  '';

  languages.ruby = {
    enable = true;
    versionFile = ./.ruby-version; 
  };
}
