; Indent inside blocks, match bodies, tables, arrays, argument lists
[
  (block)
  (match_expression)
  (table_literal)
  (array_literal)
  (argument_list)
] @indent

; Dedent on closing brackets
[
  "}"
  "]"
  ")"
] @outdent
