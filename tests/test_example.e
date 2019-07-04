note
	description: "Example of a test"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_EXAMPLE

inherit

	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- initialize tests
		do
			add_boolean_case (agent t0)
			add_boolean_case (agent t1)
		end

feature -- tests

	t0: BOOLEAN
		do
			comment ("t0: First test")
				-- this test will fail because Result = False
		end

	t1: BOOLEAN
		local
			a: ARRAY [CHARACTER]
		do
			comment ("t1: test array of chars")
			a := <<'a', 'b', 'c'>>
				-- the domain of array `a` is 1..3
			Result := a [1] = 'a' and a.count = 3
			check
				Result
			end
			a.put ('z', 1) -- replace a[1]
			Result := a [1] = 'z' and a.count = 3
			check
				Result
			end
			a.force ('d', 4) -- extend array
			Result := a.count = 4 and a [4] = 'd'
		end

end
