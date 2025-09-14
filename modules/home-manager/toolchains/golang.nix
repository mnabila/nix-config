{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      delve
      go
      golangci-lint
      gomodifytags
      gopls
      gopls
      gotools
    ];

    sessionPath = [
      "$HOME/go/bin"
    ];
  };
}
