{ config, pkgs, mkDerivation, ... }:

let
  blog = pkgs.stdenv.mkDerivation {
    name = "alexeydubovskoy-com";
    src = ./.;
    buildInputs = with pkgs; [ hugo ];
    buildPhase = ''
      HUGO_ENV=production hugo -v -d public --minify
    '';
    installPhase = "mkdir -p $out && cp -r public/* $out";
  };


in {

  services.nginx.virtualHosts."alexeydubovskoy.com" = {
      enableACME = true;
      forceSSL = true;
      root = "${blog}";
  };

}
