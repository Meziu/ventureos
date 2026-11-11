{ config, pkgs, ... }:

{
  imports = [
    ./tex.nix
    ./games.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    kdePackages.kate
    kdePackages.filelight
    vlc
    audacity
    cheese
    gimp
    spotify
    telegram-desktop
    deluge
    obsidian
    chromium
    libreoffice
    thunderbird
    ente-auth
    eog # gnome image viewer
    papers # gnome document viewer
    gnome-system-monitor
    gnome-clocks
    gparted
    gnome-disk-utility
    file-roller # gnome unarchiver
    popsicle
    deja-dup
    obs-studio
    rclone
    openssh
    gnupg
    pavucontrol
    inkscape
    pinta
    shotcut
    rawtherapee
  ];

  programs.bash.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = 0.6;
      remember_window_size = false;
    };
  };
  programs.discord.enable = true;

  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "git-firefly"
      "toml"
      "html1"
      "make"
      "xml"
      "qml"
      "haskell"
      "prolog"
    ];

    userSettings = {
      "cli_default_open_behavior" = "existing_window";
      "project_panel" = {
        "dock" = "left";
      };
      "outline_panel" = {
        "dock" = "left";
      };
      "collaboration_panel" = {
        "dock" = "left";
      };
      "git_panel" = {
        "dock" = "left";
      };
      "calls" = {
        "mute_on_join" = true;
      };
      "show_edit_predictions" = false;
      "ui_font_size" = 16;
      "buffer_font_size" = 16;
      "theme" = {
        "mode" = "system";
        "light" = "One Light";
        "dark" = "Ayu Dark";
      };
      "disable_ai" = true;
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };

        qml = {
          formatter = {
            external = {
              command = "qmlformat";
              arguments = [
                "-i"
                "{buffer_path}"
              ];
            };
          };
          binary = {
            arguments = [
              "-E"
            ];
          };
        };
      };
    };
  };

  fonts.fontconfig = {
    enable = true;

    configFile = {
      song-title-fallback = {
        enable = true;
        priority = 50;
        text = ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
          <fontconfig>
            <match target="pattern">
              <test name="family" compare="eq" qual="any">
                <string>ITC Serif Gothic Extra</string>
              </test>
              <edit name="family" mode="append" binding="strong">
                <string>Noto Sans Malayalam</string>
              </edit>
              <edit name="family" mode="append" binding="strong">
                <string>Symbols Nerd Font</string>
              </edit>
              <edit name="family" mode="append" binding="strong">
                <string>Noto Color Emoji</string>
              </edit>
            </match>
          </fontconfig>
        '';
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      browser  = "firefox.desktop";
      files    = "org.gnome.Nautilus.desktop";   # swap for your file manager, e.g. org.kde.dolphin.desktop
      editor   = "org.kde.kate.desktop";
      image    = "org.gnome.eog.desktop";
      pdf      = "org.gnome.Papers.desktop";
      video    = "vlc.desktop";
      audio    = "vlc.desktop";
      archive  = "org.gnome.FileRoller.desktop";
      mail     = "thunderbird.desktop";
    in {
      "inode/directory" = files;

      "x-scheme-handler/http"  = browser;
      "x-scheme-handler/https" = browser;
      "text/html"              = browser;
      "x-scheme-handler/about" = browser;

      "x-scheme-handler/mailto" = mail;

      "text/plain"      = editor;
      "text/markdown"   = editor;
      "application/json" = editor;
      "text/x-tex"      = editor;

      "application/pdf" = pdf;
      "application/vnd.oasis.opendocument.text"        = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"       = "libreoffice-calc.desktop";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";

      "image/png"  = image;
      "image/jpeg" = image;
      "image/gif"  = image;
      "image/webp" = image;
      "image/svg+xml" = "org.inkscape.Inkscape.desktop";
      "video/mp4"  = video;
      "video/x-matroska" = video;
      "audio/mpeg" = audio;
      "audio/flac" = audio;

      "application/zip"              = archive;
      "application/x-tar"            = archive;
      "application/x-7z-compressed"  = archive;

      "x-scheme-handler/tg"       = "org.telegram.desktop.desktop";
      "x-scheme-handler/discord"  = "discord.desktop";
      "x-scheme-handler/magnet"   = "deluge.desktop";
      "application/x-bittorrent"  = "deluge.desktop";
    };
  };
}
