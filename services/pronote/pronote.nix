{ pkgs }: with pkgs; stdenv.mkDerivation rec {
    name = "pronote-api-170518";
    src = /home/litarvan/pronote-api/pronote-api-170518.tar.gz;
    builder = ./build.sh;
    inherit coreutils gnutar gzip;
}