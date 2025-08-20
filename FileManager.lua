---REVISE---
local scriptDir = arg[0]:match("(.*/)") -- Linux/MacOS
--local scriptDir = arg[0]:match("(.*[\\/])") -- Windows
package.path = scriptDir .. "?.lua;" .. scriptDir .. "?/init.lua;" .. package.path

local hFuncs = require("ModHelperFunctions")
---REVISE---


-- Simple tool's menu
local menu = [[

Choose the operation mode:

    (1). Create file             (2). Delete file

    (3). Read file               (4). Edit file

    (5). Copy file               (6). Move file

    (7). Rename file             (8). %s

    (0). Exit

Note: Press (8) to select/deselect a file to consistently use it in all other operations

]]


local function uioptions(choice, eight) -- Main operations

    if choice == 7 then -- Rename a file


        print("Enter the path of the file to rename (path + name):")
        
        if eight == false then

            local targetfile = tostring(io.read())

            if not hFuncs.RenameFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to rename:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.RenameFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.RenameFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to rename:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.RenameFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 6 then -- Move a file


        print("Enter the path of the file to move (path + name):")

        if eight == false then

            local targetfile = tostring(io.read())

            if not hFuncs.MoveFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to move:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.MoveFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.MoveFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to move:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.MoveFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 5 then -- Copy a file


        print("Enter the path of the file to copy (path + name):")

        if eight == false then
            
            local targetfile = tostring(io.read())

            if not hFuncs.CopyFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to copy:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.CopyFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.CopyFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to copy:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.CopyFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 4 then -- Write/Edit a file


        print("Enter the path of the file to edit (path + name):")

        if eight == false then
            
            local targetfile = tostring(io.read())

            if not hFuncs.EditFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to edit:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.EditFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.EditFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to edit:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.EditFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 3 then -- Read/View a file


        print("Enter the path of the file to read (path + name):")

        if eight == false then
            
            local targetfile = tostring(io.read())

            if not hFuncs.ViewFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to read:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.ViewFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.ViewFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to read:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.ViewFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 2 then -- Delete a file


        print("Enter the path of the file to delete (path + name):")

        if eight == false then
            
            local targetfile = tostring(io.read())

            if not hFuncs.DeleteFL(hFuncs.VerifyFL(targetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to delete:")
                    targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.DeleteFL(hFuncs.VerifyFL(targetfile)) == true

            end

        else

            if not hFuncs.DeleteFL(hFuncs.VerifyFL(Gtargetfile)) then

                repeat

                    print("Invalid path. Re-enter the path of the file to delete:")
                    local targetfile = tostring(io.read())
                    os.execute("clear")

                until hFuncs.DeleteFL(hFuncs.VerifyFL(targetfile)) == true

            end

        end


    end


    if choice == 1 then -- Create a file


        print("Enter the path and name of the file to create (path + name):")
        local targetfile = tostring(io.read())

        hFuncs.CreateFL(targetfile)


    end

end



do -- Just initialization, completely misc

    local initbar = {"-", "-", "-", "-", "-", "-", "-", "-", "-", "-"}

    os.execute("clear")                       print("INITIALIZING")
    os.execute("sleep 1") os.execute("clear") print("INITIALIZING.")
    os.execute("sleep 1") os.execute("clear") print("INITIALIZING..")
    os.execute("sleep 1") os.execute("clear") print("INITIALIZING...")
    os.execute("sleep 2")

    for progress = 1, #initbar do

        local dec = tostring(math.random(3, 7))
        local int = tostring(math.random(0, 1))
    
    
        os.execute("clear")


        print("INITIALIZING...")
        if progress == 1 then print("[----------]") os.execute("sleep ".. int.. ".".. dec) os.execute("clear") print("INITIALIZING...") end
    
    
        initbar[progress] = "#"
        print("["..table.concat(initbar).."]")


        if initbar[10] == "#" then break end
        os.execute("sleep ".. int.. ".".. dec)

    end

    print("INITIALIZED!")


    os.execute("sleep 1")
    os.execute("clear")

end


print(menu:format("Select file"))


do -- Actual operation

    --Gtargetfile = nil
    local choice = tonumber(io.read())

    if choice ~= 0 and choice ~= 1 and choice ~= 2 and choice ~= 3 and choice ~= 4 and choice ~= 5 and choice == 6 and choice == 7 and choice == 8 then

		repeat

            os.execute("clear")
            print(menu:format("Select file"))

            print("Invalid option. Try again:")
			choice = tonumber(io.read())

		until choice == 0 or choice == 1 or choice == 2 or choice == 3 or choice == 4 or choice == 5 or choice == 6 or choice == 7 or choice == 8

	end


    uioptions(choice, false) -- MAIN OPERATIONS, EIGHT == FALSE

    os.execute("clear")


    do -- Dedicated code block for choice 8
    
    
        if choice == 8 then -- Consistent operation


            print("Enter the file path to operate consistently:")
		    Gtargetfile = tostring(io.read())

            if not hFuncs.VerifyFL(Gtargetfile) then
                

                repeat

                    print("Error: The file does not exist. Please re-enter the directory for the file:")
                    Gtargetfile = tostring(io.read())
            

                    os.execute("clear")

                until hFuncs.VerifyFL(Gtargetfile)
            

            end


            print(menu:format("Unselect file"))

            print("Selected directory: ".. Gtargetfile)
            choice = tonumber(io.read())

            uioptions(choice, true) -- MAIN OPERATIONS, EIGHT == TRUE


            if choice == 8 then -- Consistent operation, unselect (temp, revise)

                print(menu:format("Select file"))

                print("Unselected \"".. Gtargetfile.. "\" for consistent operations.")
                Gtargetfile = nil

                uioptions(choice, false) -- MAIN OPERATIONS, EIGHT == FALSE

            end

        end

    end

end
