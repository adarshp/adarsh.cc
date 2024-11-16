#import "@preview/fontawesome:0.5.0": *
#import "functions.typ": mentee_names
#show regex(mentee_names.join("|")): it => [#it$degree$]

= Publications/Creative Activity (Published or Accepted)
#line(length: 100%)

#emph[
  - Co-authors who are student advisees or postdoctoral mentees have a $degree$ next to their names.
  - Publications substantially based on work done as a graduate student have a \*  to their left.
  - For theoretical particle physics papers (marked with a $dagger$), the
    convention is to order authors alphabetically by last name.
  - In my primary fields of machine learning, artificial intelligence, and
    computational linguistics, conference publications are generally ranked
    higher than journal articles.  These are full papers that go through the
    normal peer review process, as in a journal. In general, work that is
    published as a conference paper may not be submitted for publication
    elsewhere.  Google Scholar Rankings and h5-indices are provided where
    available. Note that the acceptance rates, rankings and h5-indices are
    provided for the venue at the time of publication---thus, you may see
    different rankings and h5-indices for the same publication venue for
    different years.
]

== Chapters in scholarly books and monographs

#table(
  columns: (auto, auto),
  align: (right, left),
  stroke: none,
  [B2.], cite(<Zhang.ea:2022c>, form: "full"),
  [B1.], cite(<Pyarelal.ea:2022>, form: "full")
)

== Refereed Journal Articles

#table(
  columns: (auto, auto),
  align: (right, left),
  stroke: none,
  [J4.], cite(<Erikson.ea:2024>, form: "full"),
  [$dagger$\*J3.], [
    #cite(<Pyarelal:2020higgsino>, form: "full")\
    [_h5-index of Science China Physics, Mechanics \& Astronomy: 46 (as of 2024-02)_]
  ],
  [$dagger$J2.], [
    #cite(<Kling2019>, form: "full")\
    [#emph[Google Scholar Ranking: JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ],
  [$dagger$\*J1.], [
    #cite(<Kling:2015uba>, form: "full")\
    [#emph[Google Scholar Ranking: JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ]
)

== Refereed Conference Articles

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [C7.], [
    #cite(<Noriega.ea:2024>, form: "full")\
    [#emph[Google Scholar Ranking: EMNLP ranked \#2 in Computational Linguistics (h5: 193)]]
  ],
  [C6.], [
    #cite(<Soares.ea:2024>, form: "full")\
    [#emph[Google Scholar Ranking: ICML ranked \#3 in Artificial Intelligence (h5: 254)]]
  ],
  [C5.], [
    #cite(<Pyarelal.ea:2023>, form: "full")\
    [#emph[Acceptance rate for the Datasets and Benchmarks Track of NeurIPS 2023: 32.7\%]]\
    [#emph[Google Scholar Ranking: NeurIPS ranked \#1 in Artificial Intelligence (h5: 309)]]
  ],
  [C4.], [
    #cite(<qamar-etal-2023-speaking>, form: "full")\
    [#emph[Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%]]\
    [#emph[Google Scholar Ranking: EMNLP ranked \#2 in Computational Linguistics (h5: 176)]]
  ],
  [C3.], [
    #cite(<miah-etal-2023-hierarchical>, form: "full")\
    [#emph[Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%]]\
    [#emph[Google Scholar Ranking: EMNLP ranked \#2 in Computational Linguistics (h5: 176)]]
  ],
  [C2.], [
    #cite(<alexeeva-etal-2020-mathalign>, form: "full")\
    [#emph[Acceptance rate for LREC 2020: 60\%]]\
    [#emph[LREC ranked \#4 (by h5-index) in Computational Linguistics as of 2019]]
  ],
  [C1.], [
    #cite(<sharp-etal-2019-eidos>, form: "full")\
    [#emph[Google Scholar Ranking: NAACL-HLT ranked \#3 in Computational Linguistics as of 2024-02: (h5: 133)]]
  ],
)


== Refereed Workshop Articles

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [W9.], [
    #cite(<Zhang.ea:2024>, form: "full")
  ],
  [W8.], [
    #cite(<nitschke-etal-2022-rule>, form: "full")\
    [#emph[Acceptance rate for PAN-DL 2022: 77\%]]\
    [#emph[Google Scholar Ranking: COLING ranked \#5 in Computational Linguistics as of 2024-02: (h5: 73)]]
  ],
  [$dagger$\*W7.], [
    #cite(<Kling:2022jcd>, form: "full")
  ],
  [W6.], [#cite(<Zhang.ea:2021>, form: "full")],
  [W5.], [#cite(<Soares.ea:2021>, form: "full")],
  [W4.], [#cite(<Pyarelal.ea:2021>, form: "full")],
  [W3.], [#cite(<Pyarelal.ea:2019>, form: "full")],
  [W2.], [#cite(<Pyarelal.ea:2019b>, form: "full")],
  [W1.], [#cite(<Sharp.ea:2019b>, form: "full")],
)
