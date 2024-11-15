#let promotion_and_tenure = true

#let pt(content, alternative: "") = {
  if promotion_and_tenure == true [
    #content
  ] else [#alternative]
}

#let nonpt(content, alternative: "") = {
  if not promotion_and_tenure [
    #content
  ] else [#alternative]
}
