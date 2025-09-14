{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emmet-language-server
      nodePackages.nodejs
      prettier
      typescript-language-server
      vscode-langservers-extracted
    ];

    sessionPath = [
      "$HOME/.local/share/node/bin"
    ];
  };
}
