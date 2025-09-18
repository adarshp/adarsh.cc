#import "@preview/fontawesome:0.5.0": *

#show table.cell.where(x: 0): it => smallcaps(lower(it))

= Media Coverage #fa-icon("newspaper")

  #table(
    columns: (auto, auto, auto, 1fr),
    align: (left,left,left,right,),
    table.header([ID], [Date], [Title], [Publication]),
    [M2], [2020-01-28], [#link("https://timesofindia.indiatimes.com/home/science/%
                     desi-scientist-in-us-is-building-ai-that-understands-you/articleshow/73684813.cms")[#emph[Desi scientist in US is building AI that 'understands' you];];], [Times
    of India],
    [M1], [2020-01-22], [#link("https://tucson.com/news/local/socially-savvy-artificial-intelligence-to-be-developed-at-ua/%
                    article_0f8879d4-3543-56ba-a7dd-12c18c0b3d7b.html")[#emph[Socially savvy artificial intelligence to be developed at UA];];], [Arizona
    Daily Star],
    table.hline()
  )
