#import "@preview/fontawesome:0.5.0": *
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

#let metric(content) = [
  #pt[
    //#line(length: 100%, stroke: .5pt)
    #content
  ]
]


// UA colors
#let azred = rgb(171, 5, 32)
#let azblue = rgb(12, 35, 75)
#let azurite = rgb(30, 82, 136)
#let oasis = rgb("378DBD")
#let coolgray = rgb("E2E9EB")
#let warmgray = rgb("F4EDE5")
#let chili = rgb("8B0015")
#let leaf = rgb("70B865")
#let river = rgb("007D84")
#let mesa = rgb("A95C42")

#let gs = [#fa-icon("google-scholar", fill: chili)]
#let ar = [#fa-icon("percent", fill: chili)]


#let refs(content) = [
  #lower(smallcaps(text([#content])))
]
