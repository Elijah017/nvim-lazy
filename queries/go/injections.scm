(selector_expression
  operand: (call_expression
    function: (selector_expression
      field: (field_identifier) @fname)
      (#match? @fname "^Query(Row)?$")
    arguments: (argument_list
      (raw_string_literal
        (raw_string_literal_content) @injection.content
        (#set! injection.language "sql")))))
