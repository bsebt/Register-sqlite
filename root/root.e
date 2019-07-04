note
	description: "ROOT class for project"
	date: "$Date$"
	revision: "$Revision$"

class
	ROOT
inherit
	ARGUMENTS_32
	ES_SUITE  -- testing via ESpec
create
	make

feature {NONE} -- Initialization

	switch: BOOLEAN = FALSE

	make
		local
			l_server: REGISTRATION_SERVER
		do
			if  switch = True then
				print ("Hello EECS: void safe Eiffel project for 19.05!%N")
				add_test (create {TEST_EXAMPLE}.make) --suite of tests
				show_browser
				run_espec
			else
				create l_server.make_and_launch
			end

		end
end
