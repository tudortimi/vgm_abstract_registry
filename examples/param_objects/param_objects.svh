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


virtual class some_abstract_param_object #(type T = int) extends uvm_object;
  function new(string name = "some_abstract_param_object");
    super.new(name);
  endfunction

  pure virtual function void do_stuff();

  `vgm_abstract_object_param_utils(some_abstract_param_object #(T))
endclass


class some_concrete_param_object #(type T = int) extends
  some_abstract_param_object #(T);

  function new(string name = "some_concrete_param_object");
    super.new(name);
  endfunction

  virtual function void do_stuff();
    $display("I'm doing %s stuff", $typename(T));
  endfunction

  `uvm_object_param_utils(some_concrete_param_object #(T))
endclass


class some_other_concrete_param_object #(type T = int) extends
  some_abstract_param_object #(T);

  function new(string name = "some_other_concrete_param_object");
    super.new(name);
  endfunction

  virtual function void do_stuff();
    $display("I'm doing other %s stuff", $typename(T));
  endfunction

  `uvm_object_param_utils(some_other_concrete_param_object #(T))
endclass
