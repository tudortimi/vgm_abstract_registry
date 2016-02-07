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


class vgm_abstract_object_registry #(type T=uvm_object,
  string Tname="<unknown>") extends uvm_object_wrapper;

  typedef vgm_abstract_object_registry #(T, Tname) this_type;


  //----------------------------------------------------------------------------
  // Factory method
  //----------------------------------------------------------------------------

  virtual function uvm_object create_object(string name="");
    `uvm_fatal("INTERR", $sformatf("Trying to create an instance of class %s",
      Tname))
    return null;
  endfunction


  //----------------------------------------------------------------------------
  // Singleton infrastructure
  //----------------------------------------------------------------------------

  local static this_type me = get();

  static function this_type get();
    if (me == null) begin
      uvm_factory f = uvm_factory::get();
      me = new();
      f.register(me);
    end
    return me;
  endfunction


  //----------------------------------------------------------------------------
  // Generic code that could have been encapsulated in sub-class
  //----------------------------------------------------------------------------

  const static string type_name = Tname;

  virtual function string get_type_name();
    return type_name;
  endfunction


  static function T create (string name="", uvm_component parent=null,
                            string contxt="");
    uvm_object obj;
    uvm_factory f = uvm_factory::get();
    if (contxt == "" && parent != null)
      contxt = parent.get_full_name();
    obj = f.create_object_by_type(get(),contxt,name);
    if (!$cast(create, obj)) begin
      string msg;
      msg = {"Factory did not return an object of type '",type_name,
        "'. A component of type '",obj == null ? "null" : obj.get_type_name(),
        "' was returned instead. Name=",name," Parent=",
        parent==null?"null":parent.get_type_name()," contxt=",contxt};
      uvm_report_fatal("FCTTYP", msg, UVM_NONE);
    end
  endfunction

  static function void set_type_override (uvm_object_wrapper override_type,
                                          bit replace=1);
    factory.set_type_override_by_type(get(),override_type,replace);
  endfunction


  static function void set_inst_override(uvm_object_wrapper override_type,
                                         string inst_path,
                                         uvm_component parent=null);
    string full_inst_path;
    if (parent != null) begin
      if (inst_path == "")
        inst_path = parent.get_full_name();
      else
        inst_path = {parent.get_full_name(),".",inst_path};
    end
    factory.set_inst_override_by_type(get(),override_type,inst_path);
  endfunction
endclass
