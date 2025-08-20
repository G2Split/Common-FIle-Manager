-- Uncomment the line below to suppress 'need-check-nil' warnings (remove the brackets) if you are in VSC
---@diagnostic disable: need-check-nil

local hFuncs = {}

-- - Verify the target file existence (kind of optional but essential helper function)
-- - All other functions will depend on this one to check the existence of targets
-- - All other functions assume that this will be used, since they have no independent VerifyFL logic
function hFuncs.VerifyFL(filepath)

    if io.open(filepath, "r") then return filepath 
    else return false end

end


-- - Creates a new file using the provided path and file name
function hFuncs.CreateFL(filepath)

        if io.open(filepath, "w") then print("Operation completed.") os.execute("sleep 2") os.execute("clear") return true
        else error("ERROR CREATING FILE.") return false end

end


-- - Clones the target file to a desired location
-- - #TODO: Empty input handler
function hFuncs.CopyFL(filepath)

    if filepath then

        local file = io.open(filepath, "r")
        local content = file:read("a")

        if content == "" then print("Warning: The file is empty.") end

        os.execute("sleep 1") os.execute("clear")

        print("Enter the directory you want to copy the file to (include the file name):")
        local input1 = tostring(io.read())
        local newpath = io.open(input1, "w")

        print("Copying \"".. filepath.. "\" to \"".. input1.. "\"...") os.execute("sleep 1")

        if newpath:write(content) then
            
            print("Operation completed.") os.execute("sleep 2") os.execute("clear") 
            
            file:close()
            
            return true

        else error("ERROR COPYING FILE.") return false end

    else

        return false

    end

end


-- - Moves the target file to a desired location
function hFuncs.MoveFL(filepath)

    if filepath then

        print("Enter the directory you want to move the file to (include the file name):")
        local newpath = tostring(io.read())

        os.execute("clear")
    
        print("Moving \"".. filepath.. "\" to \"".. newpath.. "\"...") os.execute("sleep 1")
        
        if os.rename(filepath, newpath) then
            
            print("Operation completed.") os.execute("sleep 2") os.execute("clear")
            
            return true

        else error("ERROR MOVING FILE.") return false end
    
    else
    
        return false
    
    end

end


-- - Deletes the target file
function hFuncs.DeleteFL(filepath)

    if filepath then
    
        if os.remove(filepath) then
            
            print("Operation completed.") os.execute("sleep 2") os.execute("clear")
                        
            return true

        else error("ERROR DELETING FILE.") return false end

    else

        return false
    
    end

end


-- - Only reads the target file, displaying its content
function hFuncs.ViewFL(filepath)

    if filepath then

        filepath = io.open(filepath, "r")

        local content = filepath:read("a")

        os.execute("clear") os.execute("sleep 1")

        if filepath then

            print(content) print("Operation completed.") os.execute("sleep 5") os.execute("clear")

            filepath:close()

            return true

        else error("ERROR READING FILE.") return false end

    else

        return false

    end

end


-- - Edits the target file content
-- - #TODO: Basic GNU/Nano-like features for text editing
function hFuncs.EditFL(filepath)

    if filepath then

        filepath = io.open(filepath, "w+")
            
        print("Enter what you want to write:")
        local content = tostring(io.read())

        os.execute("clear") os.execute("sleep 1")

        if filepath:write(content) then
            
            print("Operation completed.") os.execute("sleep 2") os.execute("clear")

            filepath:close()

            return true
        
        else error("ERROR WRITING FILE.") return false end

    else

        return false

    end

end


-- - Renames the target file
function hFuncs.RenameFL(filepath)

    if filepath then -- assumindo que VerifyFL foi usado antes

        print("Enter the new name for the file (path + new name):")
        --local oldname = tostring(io.read())
        local newname = tostring(io.read())

        os.execute("clear")
    
        print("Renaming \"".. filepath.. "\" to \"".. newname.. "\"...") os.execute("sleep 1")
        
        if os.rename(filepath, newname) then
            
            print("Operation completed.") os.execute("sleep 2") os.execute("clear")

            return true
            
        else error("ERROR RENAMING FILE.") return false end
    
    else
        
        return false

    end

end



return hFuncs