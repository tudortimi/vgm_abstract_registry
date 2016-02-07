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


class test_components extends uvm_test;
  some_abstract_component comp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    some_abstract_component::type_id::set_type_override(
      some_concrete_component::get_type());
    //some_abstract_component::type_id::set_type_override(
    //  some_other_concrete_component::get_type());

    comp = some_abstract_component::type_id::create("comp", this);
  endfunction

  `uvm_component_utils(test_components)
endclass
