(* Abstract Syntax Tree and functions for printing it *)
type typ = Int | Bool | Void | String

type bind = typ * string

type expr =
    Literal of int
  | Call of string * expr list
  | Id of string
  | String_Lit of string
  | Assign of string * expr
  | Noexpr
  
type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list