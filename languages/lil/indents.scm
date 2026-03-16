; Indent inside blocks, match bodies, tables, arrays, argument lists, enums
[
  (block)
  (match_expression)
  (table_literal)
  (array_literal)
  (argument_list)
  (enum_definition)
] @indent

; Dedent on closing brackets
[
  "}"
  "]"
  ")"
] @outdent
