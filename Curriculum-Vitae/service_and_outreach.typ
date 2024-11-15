#import "functions.typ": pt, promotion_and_tenure, nonpt

= Service/Outreach

== National/International Service

#nonpt[
=== Journal Reviewing

#table(
    columns: 2,
    align: (left,left,),
    stroke: none,
    [2021], [Physics (MDPI) (1 paper)],
  )
]

=== Conference Reviewing

#table(
    columns: 2,
    align: (left,left,),
    stroke: none,
    [2024],
    [ACL ARR October 2024 Cycle (4 papers)],
    [], [NeurIPS Datasets and Benchmarks Track (5 papers)],
    [], [ACL ARR June 2024 Cycle (4 papers)],
    [], [ACL ARR February 2024 Cycle (5 papers)],
    [2023], [NeurIPS Datasets and Benchmarks Track (3 papers)],
    [], [],
  )


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
      [2012--13], [Member, Physics Grad Council], [Physics], [University of
      Arizona],
      [2012--13], [Member, Associated Graduate Council for the College of
      Science], [Physics], [University of Arizona],
      [2012--13], [Organizer, weekly departmental graduate student seminar
      series], [Physics], [University of Arizona],
    )
  }
}

== Unit-level Service

#table(
    columns: (auto, 1fr, auto, auto),
    align: (left,left,left,left,),
    table.header([Dates], [Role], [Unit], [University]),
    [2023-08 – 2024-05], [Member, Faculty Peer Review
    Committee], [School of Information], [University of Arizona],
    ..past_service,
    [], [], [], [],
  )
