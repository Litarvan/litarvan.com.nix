{ pkgs }: let service = file: import file { inherit pkgs; }; in {
    #shenron = service ./shenron;
    pronote = service ./pronote;
    sakado = service ./sakado;
}                                                             
