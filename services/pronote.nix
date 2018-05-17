{ pkgs }: {
    description = "Pronote API";
    after = [ "network.target" ];

    serviceConfig = {
        Type = "simple";
        User = "litarvan";
        ExecStart = "${pkgs.nodejs-8_x}/bin/node /home/litarvan/pronote-api/index.js";
        Restart = "on-failure";
    };

    wantedBy = [ "multi-user.target" ];
}
