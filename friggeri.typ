#import "@preview/wrap-it:0.1.1": wrap-content

#let cv(
	title,
	subtitle: [],
	asideContent,
	mainContent,
) = {

	set page(
		paper: "a4",
		margin: 1.5cm,
	)

	// Define some preset colours to use

	let white = rgb("#ffffff")
	let gray = rgb("#4D4D4D")
	let lightgray = rgb("#999999")
	let green = rgb("#C2E15F")
	let orange = rgb("#FDA333")
	let purple = rgb("#D3A4F9")
	let red = rgb("#FB4485")
	let blue = rgb("#6CE0F1")
	let brown = rgb("#765116")

	// Set up basic text properties

	set par(
		leading: 4pt,
	)

	set text(
		font: "TeX Gyre Heros",
		fallback: false,
		fill: gray,
		size: 10pt,
	)

	let alttext(..args) = text(font: "Lato", weight:"light", ..args)

	// Set up headings

	let headercolors = (
		blue,
		red,
		orange,
		green,
		purple,
		brown,
	)

	// We don't actually show the numbering, but we want the data from it

	set heading(numbering: "1.")

	show heading.where(level:1): it => {
		let index = counter(heading).get().first()
		let color = headercolors.at(index - 1, default:gray)
		let start = repr(it.body).slice(1, 4)
		let end = repr(it.body).slice(4, -1)
		set text(size: 16pt)
		[
			#(text(fill:color)[#start]+text(fill:gray)[#end])
			#v(3mm)
		]
	}

	// Document header

	let dochead(title, subtitle) = move(dx: -1.5cm, dy: -1.5cm, block(
		fill: gray,
		width: 100% + 3cm,
		height: auto,
		inset: (top:1.5cm, bottom:-0.2cm),
		outset: (bottom: 1cm),
		[
			#set par(leading:8pt)
			#set text(fill:white)
			#align(
				center,
				text(40pt)[ #title \ ] +
				alttext(14pt)[ #subtitle ]
			)
		]
	))

	// Document content

	let aside(content) = box(
		inset: (right: 1cm),
		outset: (top: 1cm, left: 1cm),
		width: 4cm,
		height: 23cm,
		align(right)[
			#show heading.where(level:1): it => [
				#set text(size: 14pt)
				#it.body
				#v(1mm)
				#counter(heading).update(n => n - 1)
			]
			#content
		]
	)

	let makeContentWithAside(asideContent, content) = block(
		width: 100%,
		height: auto,
		wrap-content(
			aside(asideContent),
			[
				#set par(justify: true)
				#content
			]
		)
	)

	dochead(title, subtitle)
	makeContentWithAside(asideContent, mainContent)
}

// Entries environment

// Each entry should be a list of 4 pieces of content
#let entries(..entries) = {
	// Define some preset colours to use

	let lightgray = rgb("#999999")

	let griddata = entries.pos().map(a => {
		let (left, bold, weak, main) = a
		(
			left,
			[
				#block(below: 5pt, strong(bold))
				#place(top+right, text(fill: lightgray, size: 8pt, weak))
				#main
			]
		)}
	).flatten()

	grid(
		columns: (10%, 90% - 5mm),
		rows: (auto),
		column-gutter: 5mm,
		row-gutter: 3mm,
		..griddata
	)
}