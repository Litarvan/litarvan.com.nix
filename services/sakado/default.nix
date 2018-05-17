{ pkgs, java ? pkgs.zulu }: {
    description = "Sakado Server";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "litarvan";
        Environment = "JAVA_HOME=${java}:PATH=/bin:${java}/bin";
        ExecStart = "${pkgs.callPackage ./sakado.nix {}}/bin/sakado-server";
        Restart = "on-failure";
    };

    wantedBy = [ "multi-user.target" ];
}
