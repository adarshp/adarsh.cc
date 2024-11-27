#import "functions.typ": pt, promotion_and_tenure, nonpt

= Service/Outreach #pt[(limited to period in current rank)]
#line(length: 100%)

== National/International Service

#if not promotion_and_tenure [
  === Journal Reviewing
  #table(
      columns: 2,
      align: (left,left,),
      stroke: none,
      [2021], [Physics (MDPI) (1 paper)],
    )
]

=== Conference Reviewing

#emph[
  Note: The Association for Computational Linguistics Rolling Review (ARR) is
  the new unified peer-review system for most top-tier venues published by the
  Association for Computational Linguistics.
]

#table(
    columns: 3,
    align: (left,left,right),
    //stroke: none,
    table.header([Year], [Conference/ARR Cycle], [\# of papers reviewed]),
    [2024],
    [ARR October 2024 Cycle],  [4],
    [], [NeurIPS Datasets and Benchmarks Track], [5],
    [], [ARR June 2024 Cycle], [4],
    [], [ARR February 2024 Cycle], [5],
    [2023], [NeurIPS Datasets and Benchmarks Track], [3],
  )


#if not promotion_and_tenure [
== National/International Outreach

#table(
    columns: (auto, auto, 1fr, auto, auto),
    align: (left,left,left,left,left,),
    table.header([Date], [Venue], [Talk Title], [City], [Type]),
    [2022-03-11], [SXSW], [#emph[#link("https://www.youtube.com/watch?v=vygzeHrC13Q&t=40s&themeRefresh=1")[Building machines that understand humans];];], [Austin,
    TX], [Invited],
  )
== Local/State Outreach

  #table(
    columns: (auto, auto, 1fr, auto, auto),
    align: (left,left,left,left,left,),
    table.header([Date], [Venue], [Talk Title], [City], [Type]),
    [2016-11-29], [Tucson Data Science Meetup], [#emph[Machine Learning
    and Particle Physics];], [Tucson, AZ], [Invited],
  )
]

#nonpt[
== University-level Service

  #table(
    columns: (auto, 1fr, auto),
    align: (left,left,left,),
    table.header([Dates], [Role], [University]),
    [2022], [SensorLab Seed Grant Reviewer], [University of Arizona],
    [2015], [Graduate and Professional Student Council (GPSC) Travel
    Grant Judge], [University of Arizona],
    [2012–13], [Arizona Assurance Mentor], [University of Arizona],
  )
]


#let past_service = {
  if not promotion_and_tenure {
    (
      [2012--13], [Physics Grad Council], [Physics], [University of
      Arizona],
      [2012--13], [Associated Graduate Council for the College of
      Science], [Physics], [University of Arizona],
      [2012--13], [Organizer, weekly departmental graduate student seminar
      series], [Physics], [University of Arizona],
    )
  }
}

== Unit-level Service

#table(
    columns: (auto, auto, auto, auto),
    align: (left,left,left,left,),
    table.header([Dates], [Role], [Unit], [University]),
    [2024-08 -- present], [Faculty Search Committee], [Department of Psychology], [University of Arizona],
    [2024-08 -- present], [Faculty Search Committee], [College of Information Science], [University of Arizona],
    [2024-08 -- present], [Faculty Awards Committee], [College of Information Science], [University of Arizona],
    [2023-08 -- 2024-05], [Faculty Peer Review
    Committee], [School of Information], [University of Arizona],
    ..past_service,
  )
