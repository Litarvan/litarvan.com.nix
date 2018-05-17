{ pkgs, java ? pkgs.zulu }: {
    description = "Sakado Server";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "litarvan";
        ExecStart = "${pkgs.bash} -c 'JAVA_HOME=${java} ${pkgs.callPackage ./sakado.nix {}}/bin/sakado-server";
        Restart = "on-failure";
    };

    wantedBy = [ "multi-user.target" ];
}
