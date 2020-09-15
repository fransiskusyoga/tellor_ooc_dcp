TCL_VARS = set IMPL_STRATEGY $(IMPL_STRATEGY)\;

main:
	curl -L -o initial_design.dcp $DOWNLOAD_URL
	@echo $(TCL_VARS) >run.tcl
	@cat vivado_build_script.tcl >>run.tcl
	vivado -mode tcl -stack 2000 -source run.tcl