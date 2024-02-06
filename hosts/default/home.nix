{ config, pkgs, ... }:

{
  home.username = "vocus";
  home.homeDirectory = "/home/vocus";
  home.packages = with pkgs; [
    neofetch
    nnn

    zip
    xz
    unzip
    p7zip

    brave
    rofi-wayland
    foot
    grim
    slurp
    wl-clipboard
    cliphist
    vesktop
    keepassxc
    telegram-desktop
    vscode
    hyprpaper
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    zathura
  ];

  programs = {
    git = {
    enable = true;
    userName = "vocus";
    userEmail = "zenyabtw@gmail.com";
    };

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
    };

    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
