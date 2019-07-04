note
	description: "Summary description for {REGISTRATION_SERVER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REGISTRATION_SERVER

inherit
	WSF_LAUNCHABLE_SERVICE
	redefine
		initialize
	end

	APPLICATION_LAUNCHER [REGISTRATION_EXECUTION]

create
	make_and_launch

feature {NONE} -- Initialization

	initialize
	-- Initialize current service.
		do
			Precursor
			set_service_option ("verbose", True)
			set_service_option ("port", 9092)
		end

end
