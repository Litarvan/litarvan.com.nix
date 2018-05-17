{ pkgs }: with pkgs; stdenv.mkDerivation (let
    firebaseConfig = pkgs.writeText "config/fcm.json" ''
        {
            "server-key": "${import ./key.nix}"
        }
    '';
in {
    name = "sakado-server-1.3.2-BETA";
    src = fetchgit {
        url = "https://github.com/sakado-app/sakado-server.git";
        rev = "ae72e6dbd0955b311a0090dc933a01ff8689a688";
        sha256 = "0njx9rxxjl2p02vf6dpkp0bhzk6fn34gwjnwm0r7rgvibnld74y1";
    };
    builder = ./build.sh;
    inherit unzip gradle coreutils;
})
