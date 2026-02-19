{ inputs, config, pkgs, ... }:

{ 
  home.username = "zarinetta";
  home.homeDirectory = "/home/zarinetta";
  
  imports = [ inputs.nixcord.homeModules.nixcord ];
  
  home.packages = with pkgs; [ 
  fastfetch 
  nnn
  p7zip
  eza
  mtr
  btop
  sysstat
  lm_sensors
  unzip
  ayugram-desktop
  vscodium
  nil
  direnv
  manix
  lsd
];

 programs.fish = {
 enable = true;
 };
 
 programs.vscode = {
 enable = true;
 package = pkgs.vscodium;
 profiles.default.extensions = with pkgs.vscode-extensions; [
 jnoortheen.nix-ide
 mkhl.direnv
 arrterian.nix-env-selector
 leonardssh.vscord
 ms-python.python
 ms-python.debugpy
 ms-python.pylint
 ];
 };
 
 programs.nixcord = {
 enable = true;
 vesktop.enable = true;
 config = {
 plugins = {
 showHiddenChannels.enable = true;
 };
 };
 };

 programs.git = {
 enable = true;
};
 
 home.stateVersion = "25.11";

}
