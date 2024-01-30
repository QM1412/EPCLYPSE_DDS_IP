# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_BIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_BIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SYS_CLK" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_BIT { PARAM_VALUE.ADDR_BIT } {
	# Procedure called to update ADDR_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_BIT { PARAM_VALUE.ADDR_BIT } {
	# Procedure called to validate ADDR_BIT
	return true
}

proc update_PARAM_VALUE.DATA_BIT { PARAM_VALUE.DATA_BIT } {
	# Procedure called to update DATA_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_BIT { PARAM_VALUE.DATA_BIT } {
	# Procedure called to validate DATA_BIT
	return true
}

proc update_PARAM_VALUE.M { PARAM_VALUE.M } {
	# Procedure called to update M when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M { PARAM_VALUE.M } {
	# Procedure called to validate M
	return true
}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}

proc update_PARAM_VALUE.SYS_CLK { PARAM_VALUE.SYS_CLK } {
	# Procedure called to update SYS_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYS_CLK { PARAM_VALUE.SYS_CLK } {
	# Procedure called to validate SYS_CLK
	return true
}


proc update_MODELPARAM_VALUE.SYS_CLK { MODELPARAM_VALUE.SYS_CLK PARAM_VALUE.SYS_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYS_CLK}] ${MODELPARAM_VALUE.SYS_CLK}
}

proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

proc update_MODELPARAM_VALUE.M { MODELPARAM_VALUE.M PARAM_VALUE.M } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M}] ${MODELPARAM_VALUE.M}
}

proc update_MODELPARAM_VALUE.DATA_BIT { MODELPARAM_VALUE.DATA_BIT PARAM_VALUE.DATA_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_BIT}] ${MODELPARAM_VALUE.DATA_BIT}
}

proc update_MODELPARAM_VALUE.ADDR_BIT { MODELPARAM_VALUE.ADDR_BIT PARAM_VALUE.ADDR_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_BIT}] ${MODELPARAM_VALUE.ADDR_BIT}
}

