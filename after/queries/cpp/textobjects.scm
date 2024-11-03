; inherits: cpp

(preproc_if condition:
  (identifier) @_cond
  (#any-of? @_cond "FERAL_MOBILE_UI" "FERAL_PORT")
) @feral

