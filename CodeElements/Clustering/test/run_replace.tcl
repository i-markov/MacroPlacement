set design "ariane"
set top_design "ariane"
set netlist "./design/ariane.v"
# def file generated by iSpatial flow
# where all the instances have been placed
set def_file "./design/ariane.def"


set ALL_LEFS "
    ./lefs/NangateOpenCellLibrary.tech.lef 
    ./lefs/NangateOpenCellLibrary.macro.mod.lef 
    ./lefs/fakeram45_256x16.lef
    "

set LIB_BC "
    ./libs/NangateOpenCellLibrary_typical.lib 
    ./libs/fakeram45_256x16.lib
    "

set site "FreePDK45_38x28_10R_NP_162NW_34O"

foreach lef_file ${ALL_LEFS} {
	read_lef $lef_file
}

foreach lib_file ${LIB_BC} {
	read_liberty $lib_file
}

read_lef ./results/OpenROAD/clusters.lef
read_def ./results/OpenROAD/clustered_netlist.def
set global_place_density 0.7
set global_place_density_penalty 8e-5
global_placement -disable_routability_driven  -density $global_place_density -init_density_penalty $global_place_density_penalty
write_def ./results/OpenROAD/blob.def
exit