{ pkgs, lib, config. ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    exemplar_modular_module.enable =
  	  lib.mkEnableOption "enables exemplar_modular_module";
  };
  config = lib.mkIf config.exemplar_modular_module.enable {
    option1 =5;
  	option2 = true;
  };
}
