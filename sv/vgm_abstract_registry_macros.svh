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


`define vgm_abstract_object_utils(T) \
  `vgm_abstract_object_utils_begin(T) \
  `vgm_abstract_object_utils_end

`define vgm_abstract_object_param_utils(T) \
  `vgm_abstract_object_param_utils_begin(T) \
  `vgm_abstract_object_utils_end

`define vgm_abstract_object_utils_begin(T) \
   `m_vgm_abstract_object_registry_internal(T,T)  \
   `m_vgm_abstract_object_create_func(T) \
   `m_uvm_get_type_name_func(T) \
   `uvm_field_utils_begin(T)

`define vgm_abstract_object_param_utils_begin(T) \
   `m_vgm_abstract_object_registry_param(T)  \
   `m_vgm_abstract_object_create_func(T) \
   `uvm_field_utils_begin(T)

`define vgm_abstract_object_utils_end \
     end \
   endfunction

`define vgm_abstract_object_registry(T,S) \
   typedef vgm_abstract_object_registry #(T,S) type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction



`define vgm_abstract_component_utils(T) \
   `m_vgm_abstract_component_registry_internal(T,T) \
   `m_uvm_get_type_name_func(T)

`define vgm_abstract_component_param_utils(T) \
   `m_vgm_abstract_component_registry_param(T)


`define vgm_abstract_component_utils_begin(T) \
   `vgm_abstract_component_utils(T) \
   `uvm_field_utils_begin(T)

`define vgm_abstract_component_param_utils_begin(T) \
   `vgm_abstract_component_param_utils(T) \
   `uvm_field_utils_begin(T)

`define vgm_abstract_component_utils_end \
     end \
   endfunction

`define vgm_abstract_component_registry(T,S) \
   typedef vgm_abstract_component_registry #(T,S) type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction


//------------------------------------------------------------------------------
// INTERNAL MACROS - in support of *_utils macros -- do not use directly
//------------------------------------------------------------------------------


`define m_vgm_abstract_object_registry_internal(T,S) \
   typedef vgm_abstract_object_registry#(T,`"S`") type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction

`define m_vgm_abstract_object_registry_param(T) \
   typedef vgm_abstract_object_registry #(T) type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction

`define m_vgm_abstract_object_create_func(T) \
   function uvm_object create (string name=""); \
     `uvm_fatal("NEWERR", "Trying to create abstract object") \
     return null; \
   endfunction



`define m_vgm_abstract_component_registry_internal(T,S) \
   typedef vgm_abstract_component_registry #(T,`"S`") type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction

`define m_vgm_abstract_component_registry_param(T) \
   typedef vgm_abstract_component_registry #(T) type_id; \
   static function type_id get_type(); \
     return type_id::get(); \
   endfunction \
   virtual function uvm_object_wrapper get_object_type(); \
     return type_id::get(); \
   endfunction
