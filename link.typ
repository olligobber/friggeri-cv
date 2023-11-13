#let simpleLink(address) = link(address, address)

#let email(address, display: none) = link(
	"mailto:"+address,
	if display == none {address} else {display},
)