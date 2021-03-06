{ pkgs, node ? pkgs.nodejs-8_x }: {
    description = "Pronote API";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "litarvan";
        ExecStart = "${node}/bin/node ${pkgs.callPackage ./pronote.nix {}}/index.js";
        Restart = "on-failure";
    };

    wantedBy = [ "multi-user.target" ];
}
