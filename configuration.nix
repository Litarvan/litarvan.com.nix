{ pkgs, ... }: {
    imports = [
        ./hardware-configuration.nix
        ./networking.nix
        ./users.nix
        ./web.nix
    ];

    environment.systemPackages = with pkgs; [ gcc ];

    programs.fish.enable = true;
    boot.cleanTmpDir = true;

    i18n.defaultLocale = "fr_FR.UTF-8";

    systemd.services = import ./services { inherit pkgs; };
}
