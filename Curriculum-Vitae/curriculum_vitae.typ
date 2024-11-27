#import "@preview/fontawesome:0.5.0": *
#import "@preview/blinky:0.1.0": link-bib-urls
#import "functions.typ": pt, promotion_and_tenure, nonpt

#set page(
  paper: "us-letter",
  numbering: "1",
)

#set text(
  font: "Arno Pro",
  size: 10pt,
)

#show link: set text(fill: blue)

#set table(
  stroke: (x, y) => if y == 0 {
    (
      top: 1pt + black,
      bottom: 0.7pt + black,
    )
  }
)

#align(center)[
#smallcaps[#text(size: 20pt, fill: maroon)[#lower[Adarsh Pyarelal]]]\
_Last updated: #datetime.today().display()_

College of Information Science~$dot.op$~University of
Arizona~$dot.op$~Tucson~$dot.op$~Arizona~$dot.op$~USA~$dot.op$~85719\
~~
#fa-icon("envelope", solid: true) #link("mailto:adarsh@arizona.edu")[`adarsh@arizona.edu`];
~~~~#fa-icon("globe") #link("https://adarsh.cc")[`adarsh.cc`]
~~~~#fa-icon("github") #link("https://github.com/adarshp")[`adarshp`]
]
#v(0.2in)

#show heading.where(level: 1): it => [
  #set align(left)
  #set text(14pt)
  #block(
    lower(
      smallcaps(
        text(
          weight: "regular",
          tracking: 1pt
        )[
          #it.body
        ]
      )
    )
  )
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: 11pt, font: "Myriad Pro", weight: "semibold")
  #it.body
]

#show heading.where(level: 3): it => [
  #set align(left)
  #set text(size: 11pt, weight: "regular")
  #emph(it.body)
]

#show bibliography: none
//#let bibsrc = read("bibliography.bib")
//#link-bib-urls(bibsrc)[
  //#bibliography("bibliography.bib", style: "./association-for-computational-linguistics.csl")
//]
//#bibliography("bibliography.bib", style: "association-for-computational-linguistics.csl")
#bibliography("bibliography.bib", style:
"association-for-computational-linguistics.csl", full: true)


#show "Adarsh Pyarelal": name => strong(name)

= Chronology of Education

#figure(
  align(center)[#table(
    columns: 6,
    align: (left,left,left,left,left,left,),
    table.header([#emph[Duration];], [#emph[Degree];], [#emph[Major];], [#emph[Institution];], [#emph[Dissertation/Thesis
    Title];], [#emph[Advisor];]),
    [2011-08 – 2017-05], [Ph.D.], [Physics], [University of
    Arizona], [#link("https://github.com/adarshp/dissertation")[#emph[Hidden Higgses and Dark Matter at Current and Future Colliders];];], [Shufang
    Su],
    [2007-08 – 2011-05], [B.A.], [Physics], [Reed
    College], [#link("https://www.researchgate.net/profile/Adarsh_Pyarelal/publication/287216785_A_Reggeized_model_for_eta_meson_production_in_high_energy_protonproton_collisions/links/56744cfe08aebcdda0de225e.pdf")[#emph[Contribution of the neutral pion Regge trajectory to the exclusive central production of $eta$(548) mesons in high energy proton/proton collisions];];], [Nelia
    Mann],
  )]
  , kind: table
  )

= Chronology of Employment

#figure(
  align(center)[#table(
    columns: (auto, 1fr, auto, auto),
    align: (left,left,left,left,),
    [#emph[Duration];], [#emph[Title];], [#emph[Department];], [#emph[Institution];],
    [2023-08 –], [Assistant Professor], [College of Information
    Science], [University of Arizona],
    [2020-09 –], [Affiliate Faculty], [Cognitive Science
    GIDP], [University of Arizona],
    [2022-08 – 2023-08], [Assistant Research Professor], [School of
    Information], [University of Arizona],
    [2018-12 – 2022-08], [Research Scientist], [School of
    Information], [University of Arizona],
    [2017-10 – 2018-12], [Postdoctoral Research Associate], [School of
    Information], [University of Arizona],
  )]
  , kind: table
  )


#include "honors_and_awards.typ"

#pagebreak()

#include "service_and_outreach.typ"
#include "publications.typ"
#include "other_scholarship.typ"
#include "works_in_progress.typ"
#include "media.typ"

#pagebreak()

#nonpt[#include "talks.typ"]
#include "awarded_grants.typ"
#pt[#include "submitted_grants.typ"]
#nonpt[#include "teaching.typ"]
