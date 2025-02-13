#import "@preview/fontawesome:0.5.0": *
#import "functions.typ": mentee_names, pt, nonpt
#show regex(mentee_names.join("|")): it => [#it$degree$]

= Publications/Creative Activity (Published or Accepted)
#line(length: 100%)

#emph[
  - Co-authors who are student advisees or postdoctoral mentees have a $degree$ next to their names.
  - Publications substantially based on work done as a graduate student have a \*  to their left.
  #pt[
  - For theoretical particle physics papers (marked with a $dagger$), the
    convention is to order authors alphabetically by last name.
  - In my primary fields of machine learning, artificial intelligence, and
    computational linguistics, conference publications are generally ranked
    higher than journal articles.  These are full papers that go through the
    normal peer review process, as in a journal. In general, work that is
    published as a conference paper may not be submitted for publication
    elsewhere.
  - Google Scholar rankings and h5-indices are provided where
    available, with the icon #fa-icon("google-scholar"). Impact factors are
    also provided where available. Note that the
    metrics are generally provided for the venue at the time of
    publication---thus, you may see different rankings and h5-indices for the
    same venue for different years.
  ]
]

== Chapters in scholarly books and monographs

#table(
  columns: (auto, auto, auto),
  align: (right, right, left),
  stroke: none,
  table.vline(x: 1, start: 0, end: 2, stroke: .7pt),
  [2022], [B2.], cite(<Zhang.ea:2022c>, form: "full"),
  [], [B1.], cite(<Pyarelal.ea:2022>, form: "full")
)

#let metric(content) = [
  #pt[
    //#line(length: 100%, stroke: .5pt)
    #content
  ]
]

== Refereed Journal Articles

#table(
  columns: (auto, auto, auto),
  align: (right, right, left),
  stroke: none,
  table.vline(x: 1, start: 0, end: 1, stroke: .7pt),
  table.vline(x: 1, start: 1, end: 2, stroke: .7pt),
  table.vline(x: 1, start: 2, end: 3, stroke: .7pt),
  table.vline(x: 1, start: 3, end: 4, stroke: .7pt),
  row-gutter: 1em,
  [2024], [J4.], [
    #cite(<Erikson.ea:2024>, form: "full")\
    #metric[
      Impact Factor: 2.2 (2023); 2.7 (5-Year)
    ]
  ],
  [2020], [$dagger$\*J3.], [
    #cite(<Pyarelal:2020higgsino>, form: "full")\
    #metric[#fa-icon("google-scholar") _h5-index of Science China Physics, Mechanics \& Astronomy: 46 (as of 2024-02)_]
  ],
  [2019], [$dagger$J2.], [
    #cite(<Kling2019>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ],
  [2015], [$dagger$\*J1.], [
    #cite(<Kling:2015uba>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ]
)

#nonpt[#pagebreak()]

== Refereed Conference Articles

#table(
  columns: (auto,auto, auto),
  stroke: none,
  align: (right, right, left),
  row-gutter: 1em,
  table.vline(x: 1, start: 0, end: 1, stroke: .7pt),
  table.vline(x: 1, start: 1, end: 3, stroke: .7pt),
  table.vline(x: 1, start: 3, end: 5, stroke: .7pt),
  table.vline(x: 1, start: 5, end: 6, stroke: .7pt),
  table.vline(x: 1, start: 6, end: 7, stroke: .7pt),
  table.vline(x: 1, start: 7, end: 8, stroke: .7pt),
  [2025], [C8.], [
    #cite(<Pyarelal.ea:2025>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") NAACL ranked \#3 in Computational Linguistics (h5: 132) as of 2025-01-23]]
  ],
  // MultiCAT accepted to NAACL 2025 Findings
  // Rejected from ACL 2023, ACL 2024, EMNLP 2024
  [2024], [C7.], [
    #cite(<Noriega.ea:2024>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") EMNLP ranked \#2 in Computational Linguistics (h5: 193)]]
  ],
  [], [C6.], [
    #cite(<Soares.ea:2024>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") ICML ranked \#3 in Artificial Intelligence (h5: 254)]]
  ],
  [2023], [C5.], [
    #cite(<Pyarelal.ea:2023>, form: "full")
    #pt[\#emph[Acceptance rate for the Datasets and Benchmarks Track of NeurIPS 2023: 32.7\%]]\
    #pt[#emph[#fa-icon("google-scholar") NeurIPS ranked \#1 in Artificial Intelligence (h5: 309)]]
  ],
  [], [C4.], [
    #cite(<qamar-etal-2023-speaking>, form: "full")
    #pt[\#emph[Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%]]\
    #pt[#emph[#fa-icon("google-scholar") EMNLP ranked \#2 in Computational Linguistics (h5: 176)]]
  ],
  [], [C3.], [
    #cite(<miah-etal-2023-hierarchical>, form: "full")
    #pt[\#emph[Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%]]\
    #pt[#emph[#fa-icon("google-scholar") EMNLP ranked \#2 in Computational Linguistics (h5: 176)]]
  ],
  [2020], [C2.], [
    #cite(<alexeeva-etal-2020-mathalign>, form: "full")
    #pt[\#emph[Acceptance rate for LREC 2020: 60\%]]\
    #pt[#emph[#fa-icon("google-scholar") LREC ranked \#6 in Computational Linguistics as of 2024-11 (h5: 59)]]
  ],
  [2019], [C1.], [
    #cite(<sharp-etal-2019-eidos>, form: "full")\
    #pt[#emph[#fa-icon("google-scholar") NAACL-HLT ranked \#3 in Computational Linguistics as of 2024-02: (h5: 133)]]
  ],
)


#nonpt[#pagebreak()]

== Refereed Workshop Articles

#emph[
    Workshop publications are peer-reviewed publications, but less competitive
    than conference articles. They are meant for authors to get early feedback
    on their manuscripts prior to submitting them to competitive conferences.
    In general, workshops are 'non-archival' venues, i.e., the research
    presented in a workshop paper can be submitted later to another venue
    (e.g., an 'archival' venue such as a conference).
]

#table(
  columns: (auto, auto, auto),
  stroke: none,
  align: (right, right, left),
  row-gutter: 1em,
  table.vline(x: 1, start: 0, end: 1, stroke: .7pt),
  table.vline(x: 1, start: 1, end: 3, stroke: .7pt),
  table.vline(x: 1, start: 3, end: 6, stroke: .7pt),
  table.vline(x: 1, start: 6, end: 9, stroke: .7pt),
  [2024], [W9.], [
    #cite(<Zhang.ea:2024>, form: "full")
  ],
  [2022], [W8.], [
    #cite(<nitschke-etal-2022-rule>, form: "full")
    #pt[\#emph[Acceptance rate for PAN-DL 2022: 77\%]]\
    #pt[#emph[#fa-icon("google-scholar") COLING ranked \#5 in Computational Linguistics as of 2024-02: (h5: 73)]]
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
