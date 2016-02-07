irun \
  -uvm \
  -define UVM_NO_DEPRECATED \
  -ncerror CNIABE \
  -incdir ../../sv \
  ../../sv/vgm_abstract_registry_pkg.sv \
  top.sv
