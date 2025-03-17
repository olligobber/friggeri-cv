#import "friggeri.typ": cv, entries
#import "link.typ": email

#show: doc => cv(
	[Phillip Sherman],
	subtitle: [Excellent Candidate for Position],
	[
		= Contact

		42 Wallaby Way \
		Sydney, NSW \
		Australia

		#v(2mm)

		#email("example@example.com", display:[
			example \
			\@example.com
		])

		#v(2mm)

		#link("https://github.com/olligobber", "github.com/olligobber")

		#v(2mm)

		0123 456 789

		#v(2mm)

		= Skills

		#lorem(2) \
		#lorem(1) \
		#lorem(3) \
		#lorem(2)

		= Languages

		English \
		#lorem(3)
	],
	doc,
)

= Introduction

#lorem(40)

= Work Experience

#entries(
	(
		[2022],
		lorem(2),
		lorem(4),
		lorem(20),
	),
	(
		[2020-2021],
		lorem(4),
		lorem(4),
		lorem(23),
	),
	(
		[2013-2019],
		lorem(3),
		lorem(6),
		lorem(18),
	),
	(
		[2000-2012],
		lorem(5),
		lorem(4),
		lorem(25),
	)
)

\

= Education

#entries(
	(
		[2017-2018],
		lorem(5),
		lorem(6),
		lorem(21),
	),
	(
		[2008-2010],
		lorem(6),
		[],
		lorem(24),
	),
	(
		[1999],
		lorem(4),
		lorem(8),
		lorem(19),
	),
	(
		[1995-1998],
		lorem(8),
		lorem(1),
		lorem(19),
	)
)

= History

#lorem(50)

= Projects

#lorem(100)

#lorem(200)

= Interests

#lorem(50)

#lorem(60)

#lorem(40)