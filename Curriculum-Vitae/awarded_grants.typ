#import "functions.typ": pt, promotion_and_tenure

= Awarded Grants and Contracts

#line(length: 100%)

#if promotion_and_tenure [
- _List of awarded grants below is limited to the period in rank._
]
#emph[
- The funding amount, period of performance, effort level,
  and list of co-PIs are based on the original awarded
  contract. In practice, these can vary over the course of the
  project.
- Grants are ordered in reverse chronological order based on
  the date of receipt of the notice of award.
- For federal grants, total, direct, and indirect funding
  amounts have been provided. The indirect funding amount is
  obtained by subtracting the direct funding amount from the
  full funding amount.
]

#let awarded_grant(
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
  table.hline(),
    figure(
      align(center)[#table(
        columns: 2,
        stroke: none,
        align: (right,left,),
        [#emph[Title];], [#title],
        [#emph[Source];], [#source],
        [_Amount #pt[(Total | Direct | Indirect)]_], pt(alternative: [\$#total])[
          \$#total | \$#direct | \$#indirect
        ],
        [#emph[Role];], [#role],
        [#emph[Effort];], [#effort],
        [#emph[Period of Performance];], [#period_of_performance],
        [#emph[Co-PIs];], [#co_pis],
      )]
      , kind: table
      )
)


#let past_grants = {
  if not promotion_and_tenure {
    (
      [G10],
    ..awarded_grant(
    [#link("https://skema.sista.arizona.edu")[SKEMA: Scientific Knowledge Extraction and Model Analysis];],
    [Defense Advanced Research Projects Agency],
        [3,253,997],
        [2,175,514],
        [1,078,483],
    [PI on UArizona subaward],
    [50% until 2024-04, then 100% for the remainder of
    the project.],
    [2023-12--2025-11],
    [PI on prime award (Lum.AI): Clayton Morrison PI
    on SIFT subaward: Daniel Bryce co-PIs on UArizona subaward: Enrique
    Noriega, Mihai Surdeanu, Katherine Isaacs],
  ),
[G9],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [Development of an open-source dashboard for team
    communication experiments],
    [#emph[Source];], [#link("https://sensorlab.arizona.edu")[UArizona SensorLab];],
    [#emph[Amount];], [\$27,288],
    [#emph[Role];], [PI],
    [#emph[Effort];], [N/A (PI salary was not allowed on this intramural
    seed grant.)],
    [#emph[Period of Performance];], [2021-01--2022-06],
    [], [],
  )],
  table.hline(),
[G8],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [#link("https://adarsh.cc/research/clc.html")[Automated real-time detection of closed-loop communication in spoken dialogue];],
    [#emph[Source];], [#link("https://sensorlab.arizona.edu")[UArizona SensorLab];],
    [#emph[Amount];], [\$13,540],
    [#emph[Role];], [PI],
    [#emph[Effort];], [N/A (PI salary was not allowed on this intramural
    seed grant.)],
    [#emph[Period of Performance];], [2021-01--2022-06],
    [], [],
  )],
  table.hline(),
[G7],
    ..awarded_grant(
    [#link("https://ml4ai.github.io/tomcat")[ToMCAT: Theory of Mind-based Cognitive Architecture for Teams];],
    [Defense Advanced Research Projects Agency],
    [7,497,548],
    [5,301,783],
    [2,195,765],
    [PI],
    [100%],
    [2019-11--2023-10],
    [Clayton Morrison, Kobus Barnard, Mihai Surdeanu, Rebecca Sharp, Marco Valenzuela-Escárcega],
  ),
[G6],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [#link("https://ml4ai.github.io/automates/")[AutoMATES: Automated Model Assembly from Text, Equations, and Software];],
    [#emph[Source];], [Defense Advanced Research Projects Agency],
    [#emph[Amount];], [\$961,959],
    [#emph[Role];], [Co-PI],
    [#emph[Effort];], [65%],
    [#emph[Period of Performance];], [2018-11--2020-05],
    [#emph[Co-PIs];], [PI: Clayton Morrison Other Co-PIs: Saumya Debray,
    Rebecca Sharp, Marco Valenzuela-Escárcega],
  )],
  table.hline(),
[G5],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [American Physical Society 4CS Student Travel
    Grant],
    [#emph[Source];], [American Physical Society],
    [#emph[Amount];], [Not available (awarded a long time ago, could not
    find the amount in my email inbox)],
    [#emph[Year];], [2016],
  )],
  table.hline(),
[G4],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [American Physical Society 4CS Student Travel
    Grant],
    [#emph[Source];], [American Physical Society],
    [#emph[Amount];], [\$105],
    [#emph[Year];], [2015],
  )],
  table.hline(),
[G3],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [GPSC Travel Award],
    [#emph[Source];], [Graduate and Professional Student Council
    (GPSC)],
    [#emph[Amount];], [\$750],
    [#emph[Year];], [2015],
  )],
  table.hline(),
[G2],
[
  #table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [Professor C. Y. Fan 'FanFare' Travel Award],
    [#emph[Source];], [UArizona Department of Physics],
    [#emph[Amount];], [\$500],
    [#emph[Year];], [2015],
  )],
  table.hline(),
[G1],
  [#table(
    columns: 2,
    stroke: none,
    align: (right,left,),
    [#emph[Title];], [American Physical Society 4CS Student Travel
    Grant],
    [#emph[Source];], [American Physical Society],
    [#emph[Amount];], [Not available (awarded a long time ago, could not
    find the amount in my email inbox)],
    [#emph[Year];], [2014],
  )]
)}
}


#table(
  columns: 2,
  [ID] , [Title, Funding source and amounts, Role, Effort, co-PIs, and Dates],
  [G12],
    ..awarded_grant(
      [Defining a digital phenotype for labor in at-risk pregnancies],
      [ABRC],
      [746,731],
      [678,846],
      [67,885],
      [Co-PI],
      [1.75 summer months in 2025],
      [2025-07-01 -- 2028-06-30],
      [PI: Elise Erickson\ Other Co-PIs: Shravan Aras, Sarah Kellerhals],
    ),
  [G11] ,
  ..awarded_grant(
      [Next-Generation Teams],
      [United States Army Contracting Command],
      [882,546],
      [592,852],
      [289,654],
      [PI],
      [35% during the academic year & 1 summer month],
      [2023-12--2025-11],
      [Kobus Barnard, Clayton Morrison, Winslow Burleson],
    ),
    ..past_grants
)
