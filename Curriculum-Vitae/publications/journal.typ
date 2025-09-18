#import "@preview/fontawesome:0.5.0": *
#import "../functions.typ": metric, pt, gs, ar

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
      LSHSS Impact Factor: 2.2 (2023); 2.7 (5-Year)
    ]
  ],
  [2020], [$dagger$\*J3.], [
    #cite(<Pyarelal:2020higgsino>, form: "full")\
    #metric[#gs _h5-index of Science China Physics, Mechanics \& Astronomy: 46 (as of 2024-02)_]
  ],
  [2019], [$dagger$J2.], [
    #cite(<Kling2019>, form: "full")\
    #pt[#emph[#gs JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ],
  [2015], [$dagger$\*J1.], [
    #cite(<Kling:2015uba>, form: "full")\
    #pt[#emph[#gs JHEP ranked \#2 in High Energy and Nuclear Physics as of 2024-02: (h5: 158)]]
  ]
)

