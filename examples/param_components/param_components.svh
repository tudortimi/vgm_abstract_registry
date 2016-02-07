// Copyright 2016 Tudor Timisescu (verificationgentleman.com)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


virtual class some_abstract_param_component #(type T = int) extends
  uvm_component;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  pure virtual function void do_stuff();

  virtual task run_phase(uvm_phase phase);
    do_stuff();
  endtask

  `vgm_abstract_component_param_utils(some_abstract_param_component #(T))
endclass


class some_concrete_param_component #(type T = int) extends
  some_abstract_param_component #(T);

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void do_stuff();
    $display("I'm doing %s stuff", $typename(T));
  endfunction

  `uvm_component_param_utils(some_concrete_param_component #(T))
endclass


class some_other_concrete_param_component #(type T = int) extends
  some_abstract_param_component #(T);

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void do_stuff();
    $display("I'm doing other %s stuff", $typename(T));
  endfunction

  `uvm_component_param_utils(some_other_concrete_param_component #(T))
endclass
