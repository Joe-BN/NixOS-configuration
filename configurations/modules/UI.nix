{config, pkgs, ... }:
{ 
  environment.systemPackages = [
    pkgs.polybar          # status bar
    pkgs.rofi             # menu
    pkgs.feh              # wallpaper and image viewer
    pkgs.picom            # window styling

  ];


  # WM/DM
  services.xserver.enable = true;
  services.displayManager.ly.enable = true; 
  services.xserver.desktopManager.xfce.enable = false;
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # Font
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [
	"Arimo"
	"Inconsolata"
        "Iosevka"	
	"IosevkaTermSlab"
	"JetBrainsMono"
	"ComicShannsMono"
      ]; })
  ];

}
