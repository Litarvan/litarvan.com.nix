# TODO: REAL CONFIGS
{ pkgs }: with pkgs; stdenv.mkDerivation (let
    appConfig = pkgs.writeText "app.json" ''
        {
            "port": 17334
        }
    '';
    dataConfig = pkgs.writeText "data.json" ''
        {
            "refresh-rate": 900000,
            "servers": [
                {
                  "name": "pronote",
                  "host": "127.0.0.1",
                  "port": 13556
                }
            ],

            "establishments": [
                {
                  "name": "Lycee Joffre (Montpellier)",
                  "method": {
                    "server": "pronote",
                    "url": "http://notes.lyc-joffre-montpellier.ac-montpellier.fr/",
                    "cas": "ac-montpellier"
                  }
                }
            ]
        }
    '';
    firebaseConfig = pkgs.writeText "fcm.json" ''
        {
            "server-key": "${import ./key.nix}"
        }
    '';
    holidaysConfig = pkgs.writeText "holidays.json" ''
        {
            "days": [],
            "periods": [
                {
                    "name": "Grandes vacances",
                    "from": {
                        "day": 7,
                        "month": 7
                    },
                    "to": {
                        "day": 3,
                        "month": 9
                    }
                }
            ]
        }
    '';
    # TODO: DELETE THIS
    proxyConfig = pkgs.writeText "proxy.json" ''
        {
            "enabled": false,
            "address": "",
            "token": ""
        }
    '';
    # TODO: MAKE IT WRITABLE
    saveConfig = pkgs.writeText "save.json" ''
        {
            "classes": {
            }
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
    inherit unzip gradle coreutils gnugrep appConfig dataConfig firebaseConfig holidaysConfig proxyConfig saveConfig;
})
