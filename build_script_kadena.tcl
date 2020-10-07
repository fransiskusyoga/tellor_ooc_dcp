#route_design -unroute -nets [get_nets -regexp -hier algoShell/CORES....algoCore.*]
#unplace_cell [get_cells -regexp -hier algoShell/CORES....algoCore.* -filter {IS_PRIMITIVE}]
#lock_design -level routing
#write_checkpoint testku.dcp

open_checkpoint initial_design.dcp 
#makesure the block can be replaced
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[0].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[1].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[2].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[3].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[4].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[5].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[6].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[7].algoCore}]
set_property HD.PARTITION 1 [get_cells {algoShell/CORES[8].algoCore}]
#unroute
route_design -unroute -nets [get_nets -regexp -hier algoShell/CORES....algoCore.*]
unplace_cell [get_cells -regexp -hier algoShell/CORES....algoCore.* -filter {IS_PRIMITIVE}]
lock_design -level routing
lock_design -unlock -level logical [get_cells algoShell/CORES[0].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[1].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[2].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[3].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[4].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[5].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[6].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[7].algoCore]
lock_design -unlock -level logical [get_cells algoShell/CORES[8].algoCore]



if {$IMPL_STRATEGY == "Performance_Explore"} {
   opt_design -directive Explore
   write_checkpoint rerun_opt.dcp
   place_design -directive Explore
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_ExploreWithRemap"} {
   opt_design -directive ExploreWithRemap
   write_checkpoint rerun_opt.dcp
   place_design -directive Explore
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive NoTimingRelaxation 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_WLBlockPlacement"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive WLDrivenBlockPlacement
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_WLBlockPlacementFanoutOpt"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive WLDrivenBlockPlacement
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AggressiveFanoutOpt
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_EarlyBlockPlacement"} {
   opt_design -directive Explore
   write_checkpoint rerun_opt.dcp
   place_design -directive EarlyBlockPlacement
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_NetDelay_high"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive ExtraNetDelay_high
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AggressiveExplore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive NoTimingRelaxation 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_NetDelay_low"} {
   opt_design -directive Explore
   write_checkpoint rerun_opt.dcp
   place_design -directive ExtraNetDelay_low
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AggressiveExplore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive NoTimingRelaxation 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_Retiming"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive ExtraPostPlacementOpt
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AlternateFlowWithRetiming
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_ExtraTimingOpt"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive ExtraTimingOpt
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive NoTimingRelaxation 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_RefinePlacement"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive ExtraPostPlacementOpt
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Default
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive NoTimingRelaxation 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_SpreadSLLs"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_SpreadSLLs
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_BalanceSLLs"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_BalanceSLLs
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_BalanceSLRs"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_BalanceSLRs
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_HighUtilSLRs"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_HighUtilSLRs
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Congestion_SpreadLogic_high"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive AltSpreadLogic_high
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AggressiveExplore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive AlternateCLBRouting 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Congestion_SpreadLogic_medium"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive AltSpreadLogic_medium
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive AlternateCLBRouting 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Congestion_SpreadLogic_low"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive AltSpreadLogic_low
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive AlternateCLBRouting 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Congestion_SSI_SpreadLogic_high"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_SpreadLogic_high
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive AggressiveExplore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive AlternateCLBRouting 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Congestion_SSI_SpreadLogic_low"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive SSI_SpreadLogic_low
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive AlternateCLBRouting 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Area_Explore"} {
   opt_design -directive ExploreArea
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Area_ExploreSequential"} {
   opt_design -directive ExploreSequentialArea
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Area_ExploreWithRemap"} {
   opt_design -directive ExploreWithRemap
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Power_DefaultOpts"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Power_ExploreArea"} {
   opt_design -directive ExploreSequentialArea
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Flow_RunPhysOpt"} {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Flow_RuntimeOptimized"} {
   opt_design -directive RuntimeOptimized
   write_checkpoint rerun_opt.dcp
   place_design -directive RuntimeOptimized
   write_checkpoint rerun_place.dcp
   route_design -directive RuntimeOptimized 
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Flow_Quick"} {
   opt_design -directive RuntimeOptimized
   write_checkpoint rerun_opt.dcp
   place_design -directive Quick
   write_checkpoint rerun_place.dcp
   route_design -directive Quick
   write_checkpoint rerun_route.dcp
} elseif {$IMPL_STRATEGY == "Performance_ExplorePostRoutePhysOpt"} {
   opt_design -directive Explore
   write_checkpoint rerun_opt.dcp
   place_design -directive Explore
   write_checkpoint rerun_place.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt.dcp
   route_design -directive Explore 
   write_checkpoint rerun_route.dcp
   phys_opt_design -directive Explore
   write_checkpoint rerun_phys_opt_post_route.dcp
} else {
   opt_design -directive Default
   write_checkpoint rerun_opt.dcp
   place_design -directive Default
   write_checkpoint rerun_place.dcp
   route_design -directive Default 
   write_checkpoint rerun_route.dcp
}

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[0].algoCore] -name timing_core_0 -file timing_core_0.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[1].algoCore] -name timing_core_1 -file timing_core_1.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[2].algoCore] -name timing_core_2 -file timing_core_2.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[3].algoCore] -name timing_core_3 -file timing_core_3.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[4].algoCore] -name timing_core_0 -file timing_core_4.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[5].algoCore] -name timing_core_1 -file timing_core_5.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[6].algoCore] -name timing_core_2 -file timing_core_6.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[7].algoCore] -name timing_core_3 -file timing_core_7.txt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 100 -input_pins -routable_nets -cells [get_cells algoShell/CORES[8].algoCore] -name timing_core_0 -file timing_core_8.txt



























 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




























































