{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cargo
      clippy
      gcc
      rust-analyzer
      rustc
      rustfmt
    ];
  };
}
