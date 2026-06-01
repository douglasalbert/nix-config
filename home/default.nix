{ pkgs, lib, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./vim.nix
    ./nvim.nix
    ./ghostty.nix
  ];

  home.username = "da";
  home.homeDirectory = "/Users/da";
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks."studio".hostname = "100.72.99.15";
  };

  home.packages = with pkgs; [
    actionlint
    ast-grep
    docker-compose
    fd
    gh
    go
    gst_all_1.gstreamer
    jq
    just
    libdvdcss
    markdownlint-cli2
    mediainfo
    mosh
    nil
    nodejs_22
    pnpm
    ripgrep
    shellcheck
    shfmt
    television
    tree
    uv
    wget
    zizmor
    zsh-completions
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];

  home.file.".config/aerospace/aerospace.toml".source = ../files/aerospace.toml;

  home.activation.piTools = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD mkdir -p $HOME/.pi/agent/bin
    $DRY_RUN_CMD ln -sf ${pkgs.fd}/bin/fd $HOME/.pi/agent/bin/fd
    $DRY_RUN_CMD ln -sf ${pkgs.ripgrep}/bin/rg $HOME/.pi/agent/bin/rg
  '';
}
