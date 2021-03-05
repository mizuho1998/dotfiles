{ config, pkgs, ... }:

{
  imports = [
    ./vim.nix
    ./tmux.nix
    ./git.nix
    ./virtualization.nix
  ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "21.05";
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";
    packages = with pkgs; [
      htop
      jq
      tree
      zip
      unzip
      wget
    ];
  };
}
