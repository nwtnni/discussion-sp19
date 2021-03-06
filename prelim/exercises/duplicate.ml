module type Compare = sig
  type t

  type ord =
  | Lt
  | Eq
  | Gt

  val compare: t -> t -> ord
end

module type Tree = sig

  type 'a t

  type key

  val insert: key -> 'a -> 'a t -> 'a t

  val size: 'a t -> int

  val fold_left: ('a -> 'b -> 'a) -> 'a -> 'b t -> 'a

  val to_list: 'a t -> 'a list

end

module Make (K: Compare) : Tree with type key = K.t = struct

  type key = K.t

  type 'a t =
  | Leaf
  | Node of
    { (* Key at this node *)
      k: key;
      (* Value at this node *)
      v: 'a;
      (* Count of value at this node. Must be >= 1. *)
      n: int;
      (* Left subtree. *)
      l: 'a t;
      (* Right subtree. *)
      r: 'a t; }

  let rec insert k v tree =
    failwith "Unimplemented"

  let rec size tree =
    failwith "Unimplemented"

  (* Hint: there are two cases per Node, depending on the count *)
  let rec fold_left f acc tree =
    failwith "Unimplemented"

  (* Implement with fold_left! *)
  let to_list tree =
    failwith "Unimplemented"

end
