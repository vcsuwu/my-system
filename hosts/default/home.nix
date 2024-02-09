{ config, pkgs, inputs, ... }:

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
        PS1 = "%~ ❯ ";
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
        window_padding_width = 10;
      };
    };

    firefox = {
      enable = true;
      profiles.main = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
        ];
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
          };

        };
        settings = {
          "browser.uidensity" = 1;
          "browser.fullscreen.autohide" = false;
        };
      };
    };

    home-manager.enable = true;
  };

  xdg = {
    enable = true;
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
