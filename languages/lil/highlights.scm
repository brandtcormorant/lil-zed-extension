; Keywords
"let" @keyword
"function" @keyword
"match" @keyword
"continue" @keyword
"return" @keyword
"enum" @keyword
"struct" @keyword
"type" @keyword
"string" @keyword
"for" @keyword
"try" @keyword
"while" @keyword
"if" @keyword
"else" @keyword
"and" @keyword.operator
"or" @keyword.operator

; Literals
(true) @constant.builtin
(false) @constant.builtin
(nil) @constant.builtin
(integer) @number
(float) @number
(string) @string

; Template string content
(template_content) @string
(template_interpolation
  "|" @punctuation.special)

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

; Struct definition name: let Point = struct { ... }
(let_declaration
  name: (identifier) @type
  value: (struct_definition))

; Struct construction type name: Point { x: 1 }
(struct_construction
  type: (identifier) @type)

; Type alias name: let Handler = type function(String) Number
(let_declaration
  name: (identifier) @type
  value: (type_alias))

; Struct member names
(struct_member
  name: (identifier) @property)

; Enum variant names
(enum_variant
  name: (identifier) @variant)

; Type identifiers in annotations
(type_identifier
  (identifier) @type)

; Type field names in struct types: { x: number, y: number }
(type_field
  name: (identifier) @property)

; For loop bindings
(for_binding_list
  (identifier) @variable.parameter)

; Range operators
".." @operator
"..." @operator

; Match arm patterns — binding identifiers
(match_arm
  pattern: (identifier) @variable.parameter)

; Match arm binding capture: pattern |name| { body }
(match_arm
  binding: (identifier) @variable.parameter)

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
"?" @operator
"|" @punctuation.special

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
