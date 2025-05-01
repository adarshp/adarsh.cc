// Boolean switch to control whether CV is formatted according to promotion and
// tenure guidelines.
#let promotion_and_tenure = false

#if sys.inputs.at("promotion_and_tenure", default: none) == "true" {
  promotion_and_tenure = true
}


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

#let mentee_names = (
  "Aditya Banerjee",
  "Salena Torres Ashton",
  "Paulo Soares",
  "Eric Duong",
  "Caleb Shibu Jones",
  "Liang Zhang",
  "Siena Schoelen",
  "Justin Lieffers",
  "Deepsana Shahi",
  "John Culnan",
  "Yuwei Wang",
  "Chen Chen",
  "Shahriar Hormozi",
  "Meghavarshini Krishnaswamy",
  "Chinmai Basavaraj"
)
