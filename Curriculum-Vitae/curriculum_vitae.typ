#set page(
  paper: "us-letter",
  numbering: "1",
)

#set text(
  font: "Arno Pro",
  size: 11pt,
)

#set table(
  stroke: (x, y) => if y == 0 {
    (
      top: 1pt + black,
      bottom: 0.7pt + black,
    )
  }
)

#align(center)[
#smallcaps[#text(size: 20pt, fill: maroon)[#lower[Adarsh Pyarelal]]]\

#emph[Last updated: #datetime.today().display()]

College of Information Science~$dot.op$~University of
Arizona~$dot.op$~Tucson~$dot.op$~Arizona~$dot.op$~USA~$dot.op$~85719
~~#link("mailto:adarsh@arizona.edu")[`adarsh@arizona.edu`];~~#link("adarsh.cc")[`adarsh.cc`]
]

#show heading.where(level: 1): it => [
  #set align(left)
  #set text(14pt)
  #block(
    lower(
      smallcaps(
        text(
          weight: "regular",
          tracking: 1pt
        )[
          #it.body
        ]
      )
    )
  )
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: 11pt, font: "Myriad Pro", weight: "semibold")
  #it.body
]

#show heading.where(level: 3): it => [
  #set align(left)
  #set text(size: 11pt, weight: "regular")
  #emph(it.body)
]

#show bibliography: none
#bibliography("bibliography.bib", style: "apa")

#show "L. Zhang": name => [#name$degree$]
#show "J. Lieffers": name => [#name$degree$]
#show "D. Shahi": name => [#name$degree$]
#show "A. Pyarelal": name => strong(name)



= Chronology of Education

#figure(
  align(center)[#table(
    columns: 6,
    align: (left,left,left,left,left,left,),
    table.header([#emph[Duration];], [#emph[Degree];], [#emph[Major];], [#emph[Institution];], [#emph[Dissertation/Thesis
    Title];], [#emph[Advisor];]),
    [2011-08 – 2017-05], [Ph.D.], [Physics], [University of
    Arizona], [#link("https://github.com/adarshp/dissertation")[#emph[Hidden Higgses and Dark Matter at Current and Future Colliders];];], [Shufang
    Su],
    [2007-08 – 2011-05], [B.A.], [Physics], [Reed
    College], [#link("https://www.researchgate.net/profile/Adarsh_Pyarelal/publication/287216785_A_Reggeized_model_for_eta_meson_production_in_high_energy_protonproton_collisions/links/56744cfe08aebcdda0de225e.pdf")[#emph[Contribution of the neutral pion Regge trajectory to the exclusive central production of $eta$(548) mesons in high energy proton/proton collisions];];], [Nelia
    Mann],
  )]
  , kind: table
  )

= Chronology of Employment

#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    [#emph[Duration];], [#emph[Title];], [#emph[Department];], [#emph[Institution];],
    [2023-08 –], [Assistant Professor], [College of Information
    Science], [University of Arizona],
    [2020-09 –], [Affiliate Faculty], [Cognitive Science
    GIDP], [University of Arizona],
    [2022-08 – 2023-08], [Assistant Research Professor], [School of
    Information], [University of Arizona],
    [2018-12 – 2022-08], [Research Scientist], [School of
    Information], [University of Arizona],
    [2017-10 – 2018-12], [Postdoctoral Research Associate], [School of
    Information], [University of Arizona],
  )]
  , kind: table
  )

= Honors and Awards

#table(
  columns: (auto, 1fr),
  align: (left,left),
  [#emph[Year];], [#emph[Title & Amount (when available)];],
  [2017], [Dept. of Physics Publications/Presentations Award],
  [], [Outstanding Graduate Student Colloquium Presentation],
  [2016], [Dept. of Physics Publications/Presentations Award],
  [], [Galileo Circle Scholarship (\$1000)],
  [2014], [Outstanding Graduate Student Colloquium Presentation],
  [], [Graduate College Fellowship in Physics (\$1500)],
)

= Service/Outreach

== National/International Service

=== Journal Reviewing

#table(
    columns: 2,
    align: (left,left,),
    [Year], [Journal],
    [2021], [Physics (MDPI) (1 paper)],
  )

=== Conference Reviewing

#table(
    columns: 2,
    align: (left,left,),
    [Year], [Conference],
    [2024], [NeurIPS Datasets and Benchmarks Track (5 papers)],
    [], [ACL ARR June 2024 Cycle (4 papers)],
    [], [ACL ARR February 2024 Cycle (5 papers)],
    [2023], [NeurIPS Datasets and Benchmarks Track (3 papers)],
    [], [],
  )


== National/International Outreach

#table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([Date], [Venue], [Talk Title], [City], [Type]),
    [2022-03-11], [SXSW], [#emph[#link("https://www.youtube.com/watch?v=vygzeHrC13Q&t=40s&themeRefresh=1")[Building machines that understand humans];];], [Austin,
    TX], [Invited],
  )

== Local/State Outreach

  #table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([Date], [Venue], [Talk Title], [City], [Type]),
    [2016-11-29], [Tucson Data Science Meetup], [#emph[Machine Learning
    and Particle Physics];], [Tucson, AZ], [Invited],
  )

== University-level Service

  #table(
    columns: 3,
    align: (left,left,left,),
    table.header([Dates], [Role], [University]),
    [2022], [SensorLab Seed Grant Reviewer], [University of Arizona],
    [2015], [Graduate and Professional Student Council (GPSC) Travel
    Grant Judge], [University of Arizona],
    [2012–13], [Arizona Assurance Mentor], [University of Arizona],
  )


== Unit-level Service

#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([Dates], [Role], [Unit], [University]),
    [2023-08 – 2024-05], [Member, Faculty Peer Review
    Committee], [School of Information], [University of Arizona],
    [], [Member, Physics Grad Council], [Physics], [University of
    Arizona],
    [2012–13], [Member, Associated Graduate Council for the College of
    Science], [Physics], [University of Arizona],
    [2012–13], [Organizer, weekly departmental graduate student seminar
    series], [Physics], [University of Arizona],
    [], [], [], [],
  )

= Publications/Creative Activity (Published or Accepted)

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
  [\*J3.], cite(<Pyarelal:2020higgsino>, form: "full"),
  [J2.], cite(<Kling2019>, form: "full"),
  [\*J1.], cite(<Kling:2015uba>, form: "full")
)

== Refereed Conference Articles

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [C7.], cite(<Noriega.ea:2024>, form: "full"),
  [C6.], cite(<Soares.ea:2024>, form: "full"),
  [C5.], cite(<Pyarelal.ea:2023>, form: "full"),
  [C4.], cite(<qamar-etal-2023-speaking>, form: "full"),
  [C3.], cite(<miah-etal-2023-hierarchical>, form: "full"),
  [C2.], cite(<alexeeva-etal-2020-mathalign>, form: "full"),
  [C1.], cite(<sharp-etal-2019-eidos>, form: "full"),
)


== Refereed Workshop Articles

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [W9.], cite(<Zhang.ea:2024>, form: "full"),
  [W8.], cite(<nitschke-etal-2022-rule>, form: "full"),
  [\*W7.], cite(<Kling:2022jcd>, form: "full"),
  [W6.], cite(<Zhang.ea:2021>, form: "full"),
  [W5.], cite(<Soares.ea:2021>, form: "full"),
  [W4.], cite(<Pyarelal.ea:2021>, form: "full"),
  [W3.], cite(<Pyarelal.ea:2019>, form: "full"),
  [W2.], cite(<Pyarelal.ea:2019b>, form: "full"),
  [W1.], cite(<Sharp.ea:2019b>, form: "full"),
)

= Other Scholarship

_Open-source software repositories which I have spearheaded or made
significant contributions to. The entries in the 'Name' column are
clickable links to the repositories._

#table(
    columns: 3,
    align: (left,left,left,),
    table.header([ID], [Name], [Description]),
    [S10], [#link("https://gitlab.com/artificialsocialintelligence/study4")[ASIST Study 4 Testbed];], [The
    testbed used for ASIST Study 4. My contribution to the testbed was
    an updated version of the ASIST Study 3 Testbed’s event extraction
    component that included a spellchecking system to meet the unique
    requirements of analyzing natural language in Study 4
    (reproducibility, real-time output, high precision, and the ability
    to deal with domain-specific terms and new types of errors arising
    from the informal nature of text chat) that were not met by existing
    systems.],
    [S9], [#link("https://gitlab.com/artificialsocialintelligence/study3")[ASIST Study 3 Testbed];], [The
    testbed used for ASIST Study 3. My contributions to the testbed were
    components that performed real-time analysis (real-time
    transcription, event extraction, and labeling of sentiment/emotion)
    of multi-party spoken dialog in remote experiments.],
    [S8], [#link("https://github.com/ml4ai/skema")[SKEMA];], [Main
    repository for the SKEMA project, containing documentation and
    software for the text reading, structural alignment, and model role
    efforts.],
    [S7], [#link("https://github.com/ml4ai/tomcat")[ToMCAT];], [Main
    repository containing documentation and software for physio
    experiments.],
    [S6], [#link("https://github.com/ml4ai/tomcat-text")[ToMCAT DialogAgent];], [Real-time
    rule-based extraction of events from natural language.],
    [S5], [#link("https://github.com/ml4ai/tomcat-planrec")[ToMCAT plan recognition];], [Multi-agent
    plan recognition],
    [S4], [#link("https://github.com/ml4ai/tomcat-ASR_Agent")[ToMCAT ASR Agent];], [Real-time
    automatic speech recognition for multiple participants],
    [S3], [#link("https://github.com/ml4ai/tomcat-speechAnalyzer")[ToMCAT SpeechAnalyzer];], [Real-time
    extraction of vocalic features, sentiment and emotion detection, and
    personality trait labeling.],
    [S2], [#link("https://github.com/ml4ai/automates")[AutoMATES];], [Automated
    Model Assembly from Text, Equations, and Software],
    [S1], [#link("https://github.com/ml4ai/delphi")[Delphi];], [Assembling
    causal, dynamic, probabilistic models from textual evidence and time
    series data.],
  )


== Works in Progress

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [MR2.], cite(<Pyarelal.ea:2024>, form: "full"),
  [MR1.], cite(<Zhang.ea:2024b>, form: "full"),
)

== Manuscripts in preparation and preprints

#table(
  columns: (auto, auto),
  stroke: none,
  align: (right, left),
  [MP4.], cite(<Liu.ea:2025>, form: "full"),
  [MP3.], cite(<Lieffers.ea:2025>, form: "full"),
  [MP2.], cite(<KC.ea:2024>, form: "full"),
  [MP1.], cite(<Basavaraj.ea:2022>, form: "full"),
)

= Media Coverage

  #table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([ID], [Date], [Title], [Publication]),
    [M2], [2020-01-28], [#link("https://timesofindia.indiatimes.com/home/science/%
                     desi-scientist-in-us-is-building-ai-that-understands-you/articleshow/73684813.cms")[#emph[Desi scientist in US is building AI that 'understands' you];];], [Times
    of India],
    [M1], [2020-01-22], [#link("https://tucson.com/news/local/socially-savvy-artificial-intelligence-to-be-developed-at-ua/%
                    article_0f8879d4-3543-56ba-a7dd-12c18c0b3d7b.html")[#emph[Socially savvy artificial intelligence to be developed at UA];];], [Arizona
    Daily Star],
  )

= Scholarly Presentations
#line(length: 100%)

== Colloquia

  #table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.header([ID], [Date], [Venue], [Title], [Type]),
    [CQ5], [2023-03-16], [University of Arizona School of
    Information], [#emph[From Tools to Teammates: Building machines that
    understand humans];], [Invited],
    [CQ4], [2023-01-27], [University of Arizona School of
    Information], [#emph[Artificial Social Intelligence];], [Research
    Blitz],
    [CQ3], [2021-12-09], [University of Arizona School of
    Information], [#emph[Theory of Mind-based Cognitive Architecture for
    Teams];], [Research Blitz],
    [CQ2], [2020-10-08], [University of Arizona Systems and Industrial
    Engineering], [#emph[Building machines that understand
    humans];], [Invited],
    [CQ1], [2020-09-04], [University of Arizona Cognitive Science
    Colloquium Series], [#emph[Building machines that understand
    humans];], [Invited],
  )


== Conferences

#table(
    columns: 6,
    align: (left,left,left,left,left,left,),
    table.header([ID], [Date], [Venue], [Title], [City], [Type]),
    [CP6], [2019], [TRIPODS 2nd Southwest Summer
    Conference], [#emph[Eidos, INDRA, & Delphi: From Free Text to
    Executable Causal Models];], [Tucson, AZ], [Submitted],
    [CP5], [2016], [Joint Meeting of the Four Corners and Texas Sections
    of the American Physical Society], [#emph[A Razor Search for Dark
    Matter at a Future 100 TeV Collider];], [Las Cruces,
    NM], [Submitted],
    [CP4], [2015], [Phenomenology 2015 Symposium], [#emph[Light Charged
    Higgs Bosons in Single-Top Production];], [Pittsburgh,
    PA], [Submitted],
    [CP3], [2015], [Annual Meeting of the APS Four Corners
    Section], [#emph[Light Charged Higgs Bosons in Two Higgs Doublet
    Models];], [Tempe, AZ], [Submitted],
    [CP2], [2014], [Annual Meeting of the APS Four Corners
    Section], [#emph[Light Charged Higgs Bosons in Single-Top
    Production];], [Orem, UT], [Submitted],
    [CP1], [2014], [23$""^(upright("rd"))$ International Conference on
    Supersymmetry and Unification of Fundamental
    Interactions], [#emph[Light Charged Higgs Bosons to AW/HW via Top
    Decay];], [Lake Tahoe, CA], [Submitted],
  )

== Posters

  #table(
    columns: 2,
    align: (left,left,),
    stroke: none,
    [], [],
    [P5.], cite(<Erikson_Pyarelal:2022b>, form: "full"),
    [P4.], cite(<Erikson_Pyarelal:2022a>, form: "full"),
    [P3.], cite(<Erikson_Pyarelal:2021>, form: "full"),
    [P2.], cite(<Schoelen:2021>, form: "full"),
    [P1.], cite(<Morrison:2020>, form: "full"),
  )

= Awarded Grants and Contracts

#table(
    columns: 4,
    align: (left,left,left,left,),
    table.header([ID], [Title, Funding source and amounts, Role, Effort,
      & co-PIs], [Status], [],),
    [SG4], [#figure(
      align(center)[#table(
        columns: 3,
        stroke: none,
        align: (right,left,left,),
        [#emph[Title];], [COMPASS: Computational Assessment of
        Scientific Feasibility], [],
        [#emph[Source];], [Defense Advanced Research Projects
        Agency], [],
        [#emph[Amount];], [#figure(
          align(center)[#table(
            columns: 2,
            stroke: none,
            align: (left,right,),
            [Total], [\$9,160,836],
            [UArizona subaward], [\$3,705,362],
            [], [\$2,513,514],
            [UArizona indirect funding amount], [\$1,191,848],
          )]
          , kind: table
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

    ], [Unawarded], [],
    [SG3], [#figure(
      align(center)[#table(
        columns: 3,
        align: (right,left,left,),
        [#emph[Title];], [STRONG: Hierarchical Knowledge Integration for
        Swift Command and Control in Dynamic Environments], [],
        [#emph[Source];], [Army Research Lab], [],
        [#emph[Amount];], [#figure(
          align(center)[#table(
            columns: 2,
            align: (left,right,),
            [Full], [\$99,409],
            [Direct], [\$64,762],
            [Indirect], [\$34,647],
          )]
          , kind: table
          )

        ], [],
        [#emph[Role];], [Co-PI], [],
        [#emph[Effort];], [0.5 summer months], [],
        [#emph[Period of Performance];], [2024-06 – 2025-05], [],
        [#emph[Co-PIs];], [PI: Liang Zhang], [],
      )]
      , kind: table
      )

    ], [Pending], [],
    [], [#figure(
      align(center)[#table(
        columns: 3,
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

    ], [Unawarded], [],
    [SG1], [#figure(
      align(center)[#table(
        columns: 3,
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

    ], [Unawarded], [],
    [], [], [], [],
  )

#block[
lllp2.6in \

\
Start & End & Name & Position \
Fall 2023 & – & Liang Zhang & Research Scientist III \

\
Start & End & Name & University \
Fall 2022 & – & Justin Lieffers & University of Arizona \
Spring 2022 & Spring 2023 & John Culnan & University of Arizona \
Fall 2020 & Fall 2023 & Liang Zhang & University of Arizona \

\
Start & End & Name & Notes \
Fall 2021 & Fall 2023 & Chinmai Basavaraj & Primary supervisor: Evan
Carter (ARL) \

\
Start & End & Name & University \
Spring 2024 & – & Deepsana Shahi & University of Arizona \

\
Start & End & Name & University \
Spring 2024 & Spring 2024 & Salena Torres Ashton & University of Arizona
\
Spring 2024 & – & Kadir Bulut Ozler & University of Arizona \

\
Start & End & Name & University \
Fall 2022 & Fall 2023 & Deepsana Shahi & University of Arizona \
Spring 2022 & Spring 2023 & Chen Chen & University of Arizona \
Fall 2021 & Spring 2023 & Remo Nitschke & University of Arizona \
Fall 2021 & Spring 2023 & Yuwei Wang & University of Arizona \
Fall 2021 & – & Meghavarshini Krishnaswamy & University of Arizona \
Fall 2019 & – & Salena Torres Ashton & University of Arizona \
Fall 2019 & Spring 2024 & Paulo Soares & University of Arizona \
Summer 2019 & – & Loren Champlin & University of Arizona \
Spring 2018 & Fall 2018 & Tanya Jeffries & University of Arizona \
Fall 2018 & Spring 2022 & Manujinda Wathugala & University of Arizona \

\
Start & End & Name & University \
Fall 2023 & Fall 2023 & Caleb Shibu & University of Arizona \

\
Start & End & Name & University \
Spring 2023 & Spring 2023 & Zach Keyes & University of Arizona \
Spring 2020 & Fall 2021 & Shreeya Jain & University of Arizona \
Spring 2020 & Fall 2020 & Da Long & University of Arizona \
Fall 2020 & Spring 2021 & Siena Schoelen & University of Arizona \
Fall 2019 & Summer 2020 & Runnan Zhou & University of Arizona \
Fall 2019 & Spring 2020 & Jiangfeng Li & University of Arizona \
Fall 2019 & Spring 2023 & Aditya Banerjee & University of Arizona \

]
#figure(
  align(center)[#table(
    columns: 4,
    align: (left,left,left,left,),
    table.cell(align: left, colspan: 4)[Awards won by mentored
    students],
    [Year], [Name], [Student type], [Award],
    [2023], [Aditya Banerjee], [Undergraduate], [Computer Science
    outstanding researcher for his graduating class],
    [2021], [Aditya Banerjee], [Undergraduate], [Galileo Circle
    Scholarship in Computer Science],
    [2021], [Paulo Soares], [Doctoral], [Outstanding research in
    Cognitive Science Award],
    [2021], [Siena Schoelen], [Undergraduate], [Outstanding senior in
    Speech, Language, and Hearing Sciences],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (left,left,left,left,left,),
    table.cell(align: left, colspan: 5)[Courses Taught],
    [Year], [Term], [Course No.], [Course Title], [Role],
    [2024], [Spring], [ISTA 421/INFO 521], [Introduction to Machine
    Learning], [Instructor],
    [2023], [Fall], [ISTA 421/INFO 521], [Introduction to Machine
    Learning], [Instructor],
    [2017], [Spring], [PHYS 105A], [Introduction to Scientific
    Computing], [Lab instructor],
    [2015], [Fall], [PHYS 381/382], [Methods in Experimental Physics
    I/II], [Lab instructor],
    [], [Spring], [PHYS 381/382], [Methods in Experimental Physics
    I/II], [Lab instructor],
    [2014], [Fall], [PHYS 381/382], [Methods in Experimental Physics
    I/II], [Lab Instructor],
    [], [Summer], [PHYS 141], [Introductory Mechanics], [Lab
    Instructor],
    [], [Spring], [PHYS 381/382], [Methods in Experimental Physics
    I/II], [Lab instructor],
    [2013], [Fall], [PHYS 381/382], [Methods in Experimental Physics
    I/II], [Lab instructor],
    [], [Spring], [PHYS 241], [Introductory Electricity and
    Magnetism], [Lab instructor],
    [2012], [Fall], [PHYS 102], [Introductory Physics I], [Lecturer],
    [], [Summer], [PHYS 181], [Introductory Laboratory I], [Lab
    Instructor],
    [], [Spring], [PHYS 241/261H], [Introductory Electricity and
    Magnetism], [Lab instructor],
    [2011], [Fall], [PHYS 261H], [Honors Introductory Electricity and
    Magnetism], [Lab instructor],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.cell(align: left, colspan: 2)[Organizer, IVILab Summer
    Programming Bootcamp],
    [#emph[Summers of 2017 & 2020];], [Organized the IVILab Summer
    Programming Bootcamp. Prepared syllabi and instructional materials,
    gave lectures, graded assignments, and recruited and coordinated
    other lecturers.],
    [], [],
  )]
  , kind: table
  )
