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


class test_param_objects extends uvm_test;
  some_abstract_param_object #(real) obj;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    some_abstract_param_object #(real)::type_id::set_type_override(
      some_concrete_param_object #(real)::get_type());
    //some_abstract_param_object #(real)::type_id::set_type_override(
    //  some_other_concrete_param_object #(real)::get_type());
  endfunction

  virtual task run_phase(uvm_phase phase);
    obj = some_abstract_param_object #(real)::type_id::create("obj");
    obj.do_stuff();
  endtask

  `uvm_component_utils(test_param_objects)
endclass
