#import "@preview/fontawesome:0.5.0": *
#import "../functions.typ": *

== Refereed Conference Articles

#show table.cell.where(x: 1): it => smallcaps(lower(it))

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
    #cite(<Pyarelal.ea:2025>, form: "full")
    #pt[\
      #emph[#gs NAACL ranked \#3 in Computational Linguistics (h5: 132) as of
      2025-01-23]\
      #emph[#ar Combined acceptance rate (Main + Findings) for papers at NAACL 2025: 38.5\%]
    ]
  ],
  // MultiCAT accepted to NAACL 2025 Findings
  // Rejected from ACL 2023, ACL 2024, EMNLP 2024
  [2024], [C7.], [
    #cite(<Noriega.ea:2024>, form: "full")
    #pt[\
      #emph[#gs EMNLP ranked \#2 in Computational Linguistics (h5: 193)]\
      #emph[#ar Combined acceptance rate (Main + Findings) for papers at EMNLP 2024: 37.7\%]
      // Acceptance rate computed as (1271 + 1029)/6105 = 0.3767, based on
      // https://aclanthology.org/2024.emnlp-main.0.pdf
    ]
  ],
  [], [C6.], [
    #cite(<Soares.ea:2024>, form: "full")
    #pt[\
      #emph[#gs ICML ranked \#3 in Artificial Intelligence (h5: 254)]\
      #emph[#ar Acceptance rate for ICML 2024: 27.5\%]\ 
      // Acceptance rate taken from https://media.icml.cc/Conferences/ICML2024/ICML2024_Fact_Sheet.pdf
    ]
  ],
  [2023], [C5.], [
    #cite(<Pyarelal.ea:2023>, form: "full")
    #pt[\
    #emph[#gs NeurIPS ranked \#1 in Artificial Intelligence (h5: 309)]\
    #emph[#ar Acceptance rate for NeurIPS 2023 Datasets and Benchmarks Track: 32.7\%]
  ]
  ],
  [], [C4.], [
    #cite(<qamar-etal-2023-speaking>, form: "full")
    #pt[\
    #emph[#ar Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%]]\
    #pt[#emph[#gs EMNLP ranked \#2 in Computational Linguistics (h5: 176)]]
  ],
  [], [C3.], [
    #cite(<miah-etal-2023-hierarchical>, form: "full")
    #pt[\
    #emph[
      #gs EMNLP ranked \#2 in Computational Linguistics (h5: 176)\
      #ar Combined acceptance rate (Main + Findings) for long papers at EMNLP 2023: 46.2\%
    ]
  ]\
  ],
  [2020], [C2.], [
    #cite(<alexeeva-etal-2020-mathalign>, form: "full")
    #pt[\
      #emph[
        #gs LREC ranked \#6 in Computational Linguistics as of 2024-11 (h5: 59)]\
        #ar Acceptance rate for LREC 2020: 60\%
    ]
  ],
  [2019], [C1.], [
    #cite(<sharp-etal-2019-eidos>, form: "full")\
    #pt[#emph[#gs NAACL-HLT ranked \#3 in Computational Linguistics as of 2024-02: (h5: 133)]]
  ],
)

