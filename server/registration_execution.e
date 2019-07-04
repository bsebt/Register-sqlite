note
	description: "Summary description for {REGISTRATION_EXECUTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REGISTRATION_EXECUTION

inherit

	WSF_EXECUTION

create
	make

feature -- Execution

	execute
		local
			statement: SQLITE_STATEMENT
			db: SQLITE_DATABASE
			l_resultarray: ARRAY [INTEGER]
			l_resultset: SQLITE_STATEMENT_ITERATION_CURSOR
			i: INTEGER
			response_string: STRING
		do
			db := create {SQLITE_DATABASE}.make_create_read_write ("mydata.db")
			statement := create {SQLITE_STATEMENT}.make ("select * from table1;", db)
			l_resultset := statement.execute_new
			l_resultarray := create {ARRAY [INTEGER]}.make_empty
			from
				l_resultset.start
				i := 1
			until
				l_resultset.after
			loop
				l_resultarray.force (l_resultset.item.integer_value (2), i)
				i := i + 1
				l_resultset.forth
			end
			db.close
			response_string := convert_to_json (l_resultarray)
			response.header.put_content_type_application_json
			response.put_string (response_string)
			response.flush
		end

	convert_to_JSON (a_input: ARRAY [INTEGER]): STRING
		do
			Result := "{ %"result%" : ["
			across
				a_input as number
			loop
				Result := Result + "%"" + number.item.out + "%", "
			end
			Result.remove_tail (2)
			Result.append ("]}")
		ensure
			class
		end

end
