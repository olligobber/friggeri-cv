build: example.typ
	typst c example.typ --font-path font

watch: example.typ
	typst w example.typ --font-path font