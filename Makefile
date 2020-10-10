TCL_VARS = set IMPL_STRATEGY $(IMPL_STRATEGY)\;

ifeq ($(ALGO),0xbitcoin)
	TCL_FILE = build_script_0xbitcoin.tcl
	ifeq ($(DOWNLOAD_URL),0)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_square.dcp
	endif
	ifeq ($(DOWNLOAD_URL),1)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_vert.dcp
	endif
	ifeq ($(DOWNLOAD_URL),2)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_1_square.dcp
	endif
	ifeq ($(DOWNLOAD_URL),3)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/top_0xbitcoin_routed_1_vert.dcp
	endif
endif

ifeq ($(ALGO),kadena)
	TCL_FILE = build_script_kadena.tcl
	ifeq ($(DOWNLOAD_URL),0)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/kadenaTop_routed_1_wire.dcp
	endif
	ifeq ($(DOWNLOAD_URL),1)
		LINK = https://github.com/fransiskusyoga/tellor_ooc_dcp/releases/download/v3/kadenaTop_routed_m_wire.dcp
	endif
endif

main:
	curl -L -o initial_design.dcp $(LINK)
	@echo $(TCL_VARS) >run.tcl
	@cat  $(TCL_FILE) >>run.tcl
	vivado -mode tcl -stack 2000 -source run.tcl
