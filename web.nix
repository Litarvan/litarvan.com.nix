{ ... }: {
    services.nginx = {
        enable = true;

        virtualHosts = let vhost = config: (config // {
            enableACME = true;
            forceSSL = true;
        }); in {

            "litarvan.com" = vhost { root = "/var/www/root"; };
            "sakado.litarvan.com" = vhost { root = "/var/www/sakado"; };
            "api.sakado.litarvan.com" = vhost {
                locations."/" = {
                    proxyPass = "http://localhost:17334/";
                };
            };

        };
    };
}
