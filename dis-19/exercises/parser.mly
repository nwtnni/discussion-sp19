%{
  open Ast
%}

(* Token Declarations *)

%token <int> INT
%token <string> VAR
%token LPAREN RPAREN
%token IF ELSE LBRACE RBRACE
%token LET EQ
%token ADD SUB MUL DIV
%token PRINT
%token EOF

(* Precedence and Associativity *)

%left ADD SUB
%left MUL DIV

%type <Ast.stm> prog

%start prog

%%
prog: stms EOF { $1 }

stms:
  | stm stms { Seq($1, $2) }
  | stm      { $1 }

stm:
  | LET VAR EQ exp               { Let($2, $4) }
  | PRINT exp                    { Print($2) }
  | IF exp LBRACE stm RBRACE els { If($2, $4, $6) }

els:
  | ELSE LBRACE stm RBRACE { Some($3) }
  |                        { None }

exp:
  | exp bin exp       { Bin($2, $1, $3) }
  | INT               { Int($1) }
  | VAR               { Var($1) }
  | LPAREN exp RPAREN { $2 }

%inline bin:
  | ADD { Add }
  | SUB { Sub }
  | MUL { Mul }
  | DIV { Div }
