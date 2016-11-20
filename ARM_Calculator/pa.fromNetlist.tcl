
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ARM_Calculator -dir "C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator/TopModule.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Giovanni/Documents/GitHub/ARM_Calculator/ARM_Calculator} }
set_property target_constrs_file "TopConstraints.ucf" [current_fileset -constrset]
add_files [list {TopConstraints.ucf}] -fileset [get_property constrset [current_run]]
link_design
