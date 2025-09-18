#import "functions.typ": pt, promotion_and_tenure, refs

#pagebreak()


= Submitted Grants and Contracts

#line(length: 100%)

#if promotion_and_tenure [
- _List of submitted grants below is limited to the period in rank._
]
#emph[
- Grants are ordered in reverse chronological order based on
  the date of submission.
- Total, direct, and indirect funding
  amounts have been provided. The indirect funding amount is
  obtained by subtracting the direct funding amount from the
  full funding amount.
]
#let past_grants = {
  if not promotion_and_tenure {
    (
    refs[SG2], [#figure(
      align(center)[#table(
        columns: 3,
        stroke: none,
        align: (right,left,left,),
        [#emph[Title];], [Multi-player Video Gaming, Sleep, & Cognition
        Among Individuals with Developmental Disabilities], [],
        [#emph[Source];], [#link("https://sensorlab.arizona.edu")[UArizona SensorLab];], [],
        [#emph[Amount];], [\$49,055], [],
        [#emph[Role];], [Co-PI], [],
        [#emph[Effort];], [N/A (Faculty salary was not allowed on this
        intramural seed grant.)], [],
        [#emph[Period of Performance];], [2023-07 – 2024-06], [],
        [#emph[Co-PIs];], [PI: Payal Khosla. Other Co-PIs: Kobus
        Barnard], [],
      )]
      , kind: table
      )

    ], [Unawarded],
    refs[SG1], [#figure(
      align(center)[#table(
        columns: 3,
        stroke: none,
        align: (right,left,left,),
        [#emph[Title];], [Exploring Semantic Clustering in the Human
        Brain during Video Game Tasks using EEG Signals], [],
        [#emph[Source];], [#link("https://sensorlab.arizona.edu")[UArizona SensorLab];], [],
        [#emph[Amount];], [\$47,728], [],
        [#emph[Role];], [Co-PI], [],
        [#emph[Effort];], [N/A (Faculty salary was not allowed on this
        intramural seed grant.)], [],
        [#emph[Period of Performance];], [2023-07 – 2024-06], [],
        [#emph[Co-PIs];], [PI: Liang Zhang], [],
      )]
      , kind: table
      )

    ], [Unawarded],
    [], [], [],

    )
}
}

#let submitted_grant(
  title,
  source,
  total,
  direct,
  indirect,
  role,
  effort,
  period_of_performance,
  co_pis
) = (
    figure(
      align(center)[#table(
        columns: 2,
        stroke: none,
        align: (right,left,),
        [#emph[Title];], [#title],
        [#emph[Source];], [#source],
        [#emph[Amount (Total | Direct | Indirect)];], [
          \$#total | \$#direct | \$#indirect
          //#table(
            //columns: 2,
            //stroke: none,
            //align: (left,right,),
            //[Total], [\$#total],
            //[Direct], [\$#direct],
            //[Indirect], [\$#indirect],
          //)
        ],
        [#emph[Role];], [#role],
        [#emph[Effort];], [#effort],
        [#emph[Period of Performance];], [#period_of_performance],
        [#emph[Co-PIs];], [#co_pis],
      )]
      , kind: table
      )
)


== Federal

#table(
    columns: 3,
    align: (left,left,left,),
    table.header([ID], [Title, Funding source and amounts, Role, Effort,
      & co-PIs], [Status],),
    refs[SG9],
    submitted_grant(
      [Context-Aware and Robust Event Flow Generation from Natural Language Commands],
      [Air Force Research Laboratory],
      [544,640],
      [361,976],
      [182,664],
      [Co-I],
      [1 summer month/year],
      [2026-01-01 -- 2027-12-31],
      [PI: Liang Zhang]
    ),
    [Pending],
    refs[SG8],
    submitted_grant(
      [Multimodal Causal Discovery and Temporal Prediction for Human-AI Teaming],
      [United States Army Contracting Command],
      [124,876],
      [83,291],
      [41,585],
      [Co-I],
      [1 summer month/year],
      [2025-08-01 -- 2028-07-31],
      [PI: Liang Zhang]
    ),
    [Unawarded],
    refs[SG7],
    submitted_grant(
      [Adaptive AI Planning and Rapid Response for Command and Control in Dynamic Environments],
      [Naval Surface Warfare Center],
      [124,876],
      [83,291],
      [41,585],
      [Co-I],
      [0.5 summer months/year],
      [2025-07-01 -- 2027-06-30],
      [PI: Liang Zhang]
    ),
    [Unawarded],
    refs[SG6],
    submitted_grant(
      [RI: Small: Enhancing Robustness in Deep Reinforcement Learning Through
      Semantic Clustering],
      [NSF],
      [251,034],
      [173,120],
      [77,914],
      [Co-I],
      [0.5 summer months/year],
      [2025-07-01 -- 2027-06-30],
      [PI: Liang Zhang]
    ),
    [Unawarded],
    refs[SG5],
    submitted_grant(
      [Validating NewDate: promoting maternal health equity with personalized labor prediction],
      [NIH],
      [3,639,222],
      [2,583,450],
      [1,055,772],
      [Co-I],
      [1 summer month/year],
      [2025-07-01--2030-06-30],
      [PI: Elise Erickson\
        Other Co-PIs: Shravan Aras, Bonnie LaFleur, Steven Calvin
        ]
    ),
    [Unawarded],
    refs[SG4], [#figure(
      align(center)[#table(
        columns: 3,
        stroke: none,
        align: (right,left,left,),
        [#emph[Title];], [COMPASS: Computational Assessment of
        Scientific Feasibility], [],
        [#emph[Source];], [Defense Advanced Research Projects
        Agency], [],
        [#emph[Amount];], [
          #table(
            columns: 2,
            stroke: none,
            align: (left,right,),
            [Total], [\$9,160,836],
            [UArizona subaward], [\$3,705,362],
            [], [\$2,513,514],
            [UArizona indirect funding amount], [\$1,191,848],
          )
        ], [],
        [#emph[Role];], [PI on UArizona subaward], [],
        [#emph[Effort];], [1 summer month in 2025, 2 summer months in
        2026, 10% effort in AY 2026-27], [],
        [#emph[Period of Performance];], [2024-08 – 2027-03], [],
        [#emph[Co-PIs];], [PI on prime award (Lum.AI): Clayton Morrison
        PI on SIFT subaward: Daniel Bryce co-PIs on UArizona subaward:
        Enrique Noriega, Mihai Surdeanu], [],
      )]
      , kind: table
      )

    ], [Unawarded],
    refs[SG3], 
    submitted_grant(
     [STRONG: Hierarchical Knowledge Integration for
        Swift Command and Control in Dynamic Environments],
        [Army Research Lab],
        [99,409],
        [64,762],
        [34,647],
        [Co-PI],
        [0.5 summer months],
        [2024-06 – 2025-05],
        [PI: Liang Zhang],
    )
    , [Withdrawn],
    table.hline()
  )
