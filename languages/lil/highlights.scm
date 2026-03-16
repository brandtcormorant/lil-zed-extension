; Keywords
"let" @keyword
"fn" @keyword
"match" @keyword
"continue" @keyword
"return" @keyword
"enum" @keyword
"type" @keyword

; Literals
(true) @constant.builtin
(false) @constant.builtin
(nil) @constant.builtin
(integer) @number
(float) @number
(string) @string

; Comments
(comment) @comment

; Labels
(label
  (identifier) @label)

; Identifiers
(identifier) @variable

; Function definitions — parameter names
(parameter
  name: (identifier) @variable.parameter)

; Let binding name
(let_declaration
  name: (identifier) @variable)

; Assignment target
(assignment
  name: (identifier) @variable)

; Function calls — callee
(call_expression
  function: (identifier) @function)

; Method-style calls: obj.method(...)
(call_expression
  function: (field_expression
    field: (identifier) @function.method))

; Field access
(field_expression
  field: (identifier) @property)

; Table field keys
(table_field
  key: (identifier) @property)

; Enum definition name: let Color = enum { ... }
(let_declaration
  name: (identifier) @type
  value: (enum_definition))

; Enum variant names
(enum_variant
  name: (identifier) @variant)

; Type declaration name: type Point = ...
(type_declaration
  name: (identifier) @type)

; Type identifiers in annotations
(type_identifier
  (identifier) @type)

; Type field names in struct types: { x: number, y: number }
(type_field
  name: (identifier) @property)

; Match arm patterns — binding identifiers
(match_arm
  pattern: (identifier) @variable.parameter)

; Match arm patterns — enum variant: Color.red
(enum_variant_pattern
  enum: (identifier) @type)
(enum_variant_pattern
  variant: (identifier) @variant)
(enum_variant_pattern
  binding: (identifier) @variable.parameter)

; Match arm patterns — direct variant: Value(v)
(variant_pattern
  variant: (identifier) @variant)
(variant_pattern
  binding: (identifier) @variable.parameter)

; Operators
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"==" @operator
"!=" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"=" @operator
"!" @operator
"=>" @operator
"->" @operator
"?" @operator

; Delimiters
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"," @punctuation.delimiter
"." @punctuation.delimiter
":" @punctuation.delimiter
