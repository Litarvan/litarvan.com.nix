{ ... }: {
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  networking = {
    hostName = "litarvan-vps";

    firewall.allowPing = true;
    firewall.allowedTCPPorts = [ 443 80 21727 17334 ];

    nameservers = [
      "213.186.33.99"
    ];

    defaultGateway = "91.134.132.1";
    defaultGateway6 = "";

    interfaces = {
      ens3 = {
        ipv4.addresses = [
          { address="91.134.132.235"; prefixLength=32; }
        ];

        ipv6.addresses = [
          { address="fe80::f816:3eff:fe18:381d"; prefixLength=64; }
        ];
      };      
    };
  };

  services.udev.extraRules = ''
    ATTR{address}=="fa:16:3e:18:38:1d", NAME="eth0"
    
  '';
}
