#import "functions.typ": mentee_names, nonpt

#show regex(mentee_names.join("|")): it => [#it$degree$]

#pagebreak()

= Works in Progress
#line(length: 100%)

#emph[
Preprints are non-refereed papers that have been made public.
They are also technically 'manuscripts in preparation',
since they are earlier versions of manuscripts that are in the
process of being revised and resubmitted.
Manuscripts in preparation that have an associated preprint have
names in blue, indicating they are clickable links that link to
their corresponding arXiv page. For preprints, the listed year is
the year that the preprint was uploaded. However, these papers are
typically currently under preparation for resubmission.
]

== Manuscripts under review

#show table.cell.where(x: 0): it => smallcaps(lower(it))

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [MR1.], cite(<Zhang.ea:2025>, form: "full")
  // Submitted to NeurIPS 2025
  // Rejected from ICML 2025
)

== Manuscripts in preparation and preprints

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [MP3.], cite(<Lieffers.ea:2025>, form: "full"),
  [MP2.], cite(<KC.ea:2024>, form: "full"),
  [MP1.], cite(<Basavaraj.ea:2022>, form: "full"),
)
