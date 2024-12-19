# Notes

## Lua refined grammar

```
<statement> ::= <var_list> = <expr_list>
            |   <fn_call>
            |   <do_block>
            |   while <expr> <do_block>
            |   repeat <block> until <expr>
            |   if <expr> then <block> {elseif <expr> then <block>} [else <block>] end
            |   for <identifier> = <expr>, <expr>[, <expr>] <do_block>
            |   for <name_list> in <expr_list> <do_block>
            |   [local] function <fn_name> <fn_body>
            |   local <var_list> [= <expr_list>]

<expr_list> ::= <expr> {, <expr>}
<expr>      ::= nil
            |   false 
            |   true
            |   <NUMBER>
            |   <STRING>
            |   ...
            |   <closure>
            |   <table_constructor>
            |   <expr> <binary_op> <expr>
            |   <unary_op> <expr>

<var_list>  ::= <var> {, <var>}
<var>       ::= <IDENTIFIER>
            |   <var_expr>'['<expr>']'
            |   <var_expr>.<IDENTIFIER>

<do_block>  ::= do <block> end

<fn_name>   ::= <IDENTIFIER> { . <IDENTIFIER> } [ : <IDENTIFIER> ]
<closure>   ::= function <fn_body>
<fn_body>   ::= ( [<fn_args>] ) <block> end
<fn_args>   ::= <var_list> [, ...]
            |   ...

<table_constructor> ::= { [<table_fields>] }
<table_fields>      ::= <field> {<table_sep> <field>} [<table_sep>]
<table_sep>         ::= , | ;
<field>             ::= '['<expr>']' = expr
                    |   <IDENTIFIER> = expr
                    |   expr

<binary_op> ::= +
            |   -  
            |   *  
            |   /  
            |   ^  
            |   %  
            |   ..  
            |   <  
            |   <=  
            |   >  
            |   >=  
            |   ==  
            |   ~=  
            |   and  
            |   or

<unary_op>  ::= -
            |   not
            |   #

```
