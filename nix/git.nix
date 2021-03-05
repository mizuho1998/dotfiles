{ config, pkgs, lib, ... }:

let
  name = "mizuho1998";
  email = "moc.liam0000@gmail.com";
  configDir = ".config/git";
  config = ''
    [user]
      name = ${name}
      email = ${email}
    [url "github.com:"]
      InsteadOf = https://github.com/
      InsteadOf = git@github.com:
    [core]
      editor = vim -c \"set fenc=utf-8\"
    [alias]
      alias = !git config --get-regexp '^alias\\.' | sed 's/alias\\.\\([^ ]*\\) \\(.*\\)/\\1\\\t => \\2/' | sort
      co = checkout
      cb = checkout -b
      a = add
      aa = add *
      ad = add .
      cm = commit -m
      s = status
      ss = status -s
      br = branch
      hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
      type = cat-file -t
      dump = cat-file -p
      l = log --decorate --oneline
      ls = log --decorate --oneline --stat
      lg = log --decorate --oneline --graph
      llg = log --graph --branches --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(green)- %an, %cr%Creset'
      ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat
      d  = diff
      df = diff --name-only
      d1 = diff HEAD~
      d2 = diff HEAD~2
      d3 = diff HEAD~3
  '';
  ignore = ''
    *~
    .DS_Store
    Thumbs.db
    Thumbs.db:encryptable
    .idea
    .vscode/*
    !.vscode/settings.json
    !.vscode/tasks.json
    !.vscode/launch.json
    !.vscode/extensions.json
    *.code-workspace
    .ionide
    .vs
  '';
in {
  home = {
    packages = with pkgs; [ git ghq gitAndTools.gh ];
    file = {
      "${configDir}/config".text = config;
      "${configDir}/ignore".text = ignore;
    };
  };
}
