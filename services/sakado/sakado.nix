{ pkgs }: with pkgs; stdenv.mkDerivation rec {
    name = "sakado-server-1.3.2-BETA";
    src = fetchgit {
        url = "https://github.com/sakado-app/sakado-server.git";
        rev = "4d4c2f1ea37be93d1cd418d7126c0f982f1d476c";
    };
    builder = ./build.sh;
    inherit coreutils gnutar gzip;
}