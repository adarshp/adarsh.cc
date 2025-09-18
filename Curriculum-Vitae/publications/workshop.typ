#import "@preview/fontawesome:0.5.0": *
#import "../functions.typ": *

== Refereed Workshop Articles

#emph[
    Workshop publications are peer-reviewed publications, but less competitive
    than conference articles. They are meant for authors to get early feedback
    on their manuscripts prior to submitting them to competitive conferences.
    In general, workshops are 'non-archival' venues, i.e., the research
    presented in a workshop paper can be submitted later to another venue
    (e.g., an 'archival' venue such as a conference).
]

#show table.cell.where(x: 1): it => smallcaps(lower(it))

#table(
  columns: (auto, auto, auto),
  stroke: none,
  align: (right, right, left),
  row-gutter: 1em,
  table.vline(x: 1, start: 0, end: 1, stroke: .7pt),
  table.vline(x: 1, start: 1, end: 2, stroke: .7pt),
  table.vline(x: 1, start: 2, end: 4, stroke: .7pt),
  table.vline(x: 1, start: 4, end: 7, stroke: .7pt),
  table.vline(x: 1, start: 7, end: 10, stroke: .7pt),
  [2025], [W10.], [
    #cite(<Liu.ea:2025>, form: "full"),
  // Rejected from AAAI 2025
  ],
  [2024], [W9.], [
    #cite(<Zhang.ea:2024>, form: "full")
  ],
  [2022], [W8.], [
    #cite(<nitschke-etal-2022-rule>, form: "full")
    #pt[\ #emph[Acceptance rate for PAN-DL 2022: 77\%]]\
    #pt[#emph[#gs COLING ranked \#5 in Computational Linguistics as of 2024-02: (h5: 73)]]
  ],
  [], [$dagger$\*W7.], [
    #cite(<Kling:2022jcd>, form: "full")
  ],
  [2021], [W6.], [#cite(<Zhang.ea:2021>, form: "full")],
  [], [W5.], [#cite(<Soares.ea:2021>, form: "full")],
  [], [W4.], [#cite(<Pyarelal.ea:2021>, form: "full")],
  [2019], [W3.], [#cite(<Pyarelal.ea:2019>, form: "full")],
  [], [W2.], [#cite(<Pyarelal.ea:2019b>, form: "full")],
  [], [W1.], [#cite(<Sharp.ea:2019b>, form: "full")],
)
