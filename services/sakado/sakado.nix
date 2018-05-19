{ pkgs }: with pkgs; stdenv.mkDerivation (let
    firebaseConfig = pkgs.writeText "fcm.json" ''
        {
            "server-key": "${import ./key.nix}"
        }
    '';
in {
    name = "sakado-server-1.3.2-BETA";
    src = fetchgit {
        url = "https://github.com/sakado-app/sakado-server.git";
        rev = "852a38ccef9d3ec286c1d0bb2a772fcca604876d";
        sha256 = "1gsjm7ki71ha88pjnc2ak0xvwpqaf32dk360cac1bmm59cq3iz21";
    };
    builder = ./build.sh;
    inherit unzip gradle coreutils gnugrep firebaseConfig;
})
