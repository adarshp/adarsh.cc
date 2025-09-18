#import "@preview/fontawesome:0.5.0": *
#import "functions.typ": *
#show regex(mentee_names.join("|")): it => [#it$degree$]

#pagebreak()

= Publications/Creative Activity (Published or Accepted)
#line(length: 100%)

#emph[
  - In my primary fields of machine learning, artificial intelligence, and
    computational linguistics, conference publications are generally ranked
    higher than journal articles.  These are full papers that go through the
    normal peer review process, as in a journal. In general, work that is
    published as a conference paper may not be submitted for publication
    elsewhere.
  - For theoretical particle physics papers (marked with a $dagger$), the
    convention is to order authors alphabetically by last name.
  - Co-authors who are student advisees or postdoctoral mentees have a $degree$ next to their names.
  - Publications substantially based on work done as a graduate student have a \*  to their left.
  #pt[
  - Google Scholar rankings and h5-indices are provided where
    available, with the icon #gs. Acceptance rates (icon:
    #ar) and impact factors are also provided where available. Note that the
    metrics are generally provided for the venue at the time of
    publication---thus, you may see different rankings and h5-indices for the
    same venue for different years.
  ]
]


#include "publications/conference.typ"
#include "publications/journal.typ"
#include "publications/workshop.typ"
#include "publications/chapters.typ"
//#nonpt[#pagebreak()]


