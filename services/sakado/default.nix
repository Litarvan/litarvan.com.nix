{ pkgs, java ? pkgs.zulu }: {
    description = "Sakado Server";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "litarvan";
        ExecStart = "${pkgs.bash}/bin/bash ${pkgs.callPackage ./sakado.nix {}}/bin/sakado-server";
        Restart = "on-failure";
    };

    environment = {
        JAVA_HOME = java;
    };

    wantedBy = [ "multi-user.target" ];
}
