{ config, pkgs, ... }:

{
  home.username = "vocus";
  home.homeDirectory = "/home/vocus";
  home.packages = with pkgs; [
    neofetch
    ranger

    zip
    xz
    unzip
    p7zip

    firefox
    rofi-wayland
    kitty
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
      localVariables = {
      	PS1 = "[%n@%m %/] ❯ ";
      };
    };

    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      font.name = "JetBrainsMono Nerd Font Mono";
      settings = {
      	placement_strategy = "top-left";
	foreground = "#ffffff";
	background = "#000000";
	background_opacity = "0.7";
      };
    };

    home-manager.enable = true;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "other/desktop";
      documents = "docs";
      download = "installs";
      music = "media/music";
      pictures = "media/pictures";
      publicShare = "other/public";
      templates = "other/templates";
      videos = "media/vids";
    };
  };

  home.stateVersion = "23.11";
}
