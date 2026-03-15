; Keywords
"let" @keyword
"fn" @keyword
"match" @keyword
"continue" @keyword
"return" @keyword

; Literals
(true) @constant.builtin
(false) @constant.builtin
(nil) @constant.builtin
(integer) @number
(float) @number
(string) @string
(tag) @string.special.symbol

; Comments
(comment) @comment

; Identifiers
(identifier) @variable

; Function definitions — parameter names
(function_definition
  parameters: (parameter_list
    (identifier) @variable.parameter))

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

; Match arm patterns
(match_arm
  pattern: (identifier) @variable.parameter)
(match_arm
  pattern: (tag) @string.special.symbol)

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

