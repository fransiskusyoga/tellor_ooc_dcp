TCL_VARS = set IMPL_STRATEGY $(IMPL_STRATEGY)\;

ifeq ($(DOWNLOAD_URL),0)
	#LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v1/top_0xbitcoin_routed_square_unplaced.dcp
	LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_square.dcp
endif
ifeq ($(DOWNLOAD_URL),1)
	#LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v1/top_0xbitcoin_routed_vert_unplaced.dcp
	LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_vert.dcp
endif
ifeq ($(DOWNLOAD_URL),2)
	LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_1_wire_square.dcp
endif

main:
	curl -L -o initial_design.dcp $(LINK)
	@echo $(TCL_VARS) >run.tcl
	@cat build_script.tcl >>run.tcl
	vivado -mode tcl -stack 2000 -source run.tcl
