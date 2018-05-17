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
        sha256 = "1zfvavfxxf7j0q1sj20qsw2rc2j8m5hj49dx10gjggzwav2qnw1p";
    };
    builder = ./build.sh;
    inherit unzip gradle coreutils;
})
