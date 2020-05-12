%set_param('main', 'SimulationCommand', 'start');
function [] = auto_mode()
    clear;

    set_param('main','SimulationCommand','pause');    
    [broj_crv, broj_pla, cm_crvene, cm_plave] = konacna_slika1();
    set_param('main','SimulationCommand','continue');

    find_objects(broj_crv, broj_pla, cm_crvene, cm_plave);
end

