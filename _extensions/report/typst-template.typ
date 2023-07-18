// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let report(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 23mm, right: 25mm, top: 27mm, bottom: 27mm),
    numbering: ("1/1"),
    number-align: center,
    header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            [
              #set text(8pt)
              #smallcaps[
               *CONFIDENTIAL*\
               Patient Name
             ]
           ]
        }
    )
)

  // Save heading and body font families in variables.
  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 11pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  show heading: set text(font: sans-font)
    
  set heading(numbering: "1.a")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 3 {
      parbreak()
      text(10pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  set par(leading: 0.75em)

  // Logo
  block(
    figure(
      image("logo.png"),
    )
)

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(2.2em, weak: true)
    // #date
  ]

  // Main body.
  set text(hyphenate: true)

  body


}
