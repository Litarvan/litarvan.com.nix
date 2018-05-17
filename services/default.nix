{ pkgs }: let apply = file: import file { inherit pkgs; }; in {
    #shenron = apply ./shenron.nix;                           
    pronote = apply ./pronote.nix;                            
    #sakado = apply ./sakado.nix;                             
}                                                             
