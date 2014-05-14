(*
 * Copyright (c) 2014 Jeremy Yallop.
 *
 * This file is distributed under the terms of the MIT License.
 * See the file LICENSE for details.
 *)

(* Foreign function bindings for the OCaml-value-passing tests. *)

open Ctypes

module Stubs (F: Cstubs.FOREIGN) =
struct
  open F

  let memcpy_string_string = foreign "memcpy"
    (ocaml_string @-> ocaml_string @-> size_t @-> returning (ptr void))

  let memcpy_string_ptr = foreign "memcpy"
    (ocaml_string @-> ptr void @-> size_t @-> returning (ptr void))

  let strdup = foreign "strdup"
    (ocaml_string @-> returning string)
end
