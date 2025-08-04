(fenced_code_block 
  (info_string (language) @js_block
    (#eq? @js_block "js"))
  (code_fence_content) @injection.content
  (#set! injection.language "javascript"))

(((minus_metadata) @yaml
    (#offset! @yaml 1 0 -1 0)) @injection.content
 (#set! injection.language "yaml"))
