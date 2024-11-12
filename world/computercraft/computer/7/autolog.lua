-- Function to refuel the turtle if needed
function refuelIfNeeded()
    if turtle.getFuelLevel() < 10 then
        -- Select the coal block slot (slot 1) for refueling
        turtle.select(1)
        turtle.refuel(1) -- Refuel using one block of coal
    end
end

-- Function to check if the block in front is living wood
function checkAndReplaceLog()
    local success, block = turtle.inspect()

    if success then
        -- Check if the block is "living wood" from Botania
        if block.name == "botania:livingwood_log" then
            -- Break the living wood
            turtle.dig()

            -- Select the dark oak log slot (slot 2)
            turtle.select(2)

            -- Place the dark oak log
            turtle.place()
        end
    end
end

-- Function to check a row of blocks 
function checkLeftRow()
    -- Turn Left and check the block in front 
    turtle.turnLeft()
    checkAndReplaceLog()

    -- Turn Right and move forward 
    turtle.turnRight()
    turtle.forward()

    -- Turn Left and check the block in front 
    turtle.turnLeft()
    checkAndReplaceLog()

    -- Turn Right and move forward 
    turtle.turnRight()
    turtle.forward()

    -- Turn Left and check the block in front 
    turtle.turnLeft()
    checkAndReplaceLog()

    -- Turn Right 
    turtle.turnRight()
end

-- Function to check the 8 blocks around the pure daisy
function checkArea()
    -- Check start row 
    checkLeftRow()

    -- Move to second row 
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()

    -- Check second row
    checkLeftRow()

    -- Move to third row 
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()

    -- Check third row 
    checkLeftRow()

    -- Move to last row
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()

    -- Check Last Row 
    checkLeftRow()

    -- Move back to start position 
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
end 


-- Main loop
while true do
    refuelIfNeeded()      -- Check fuel level and refuel if needed
    checkArea()           -- Check the 8 blocks around the pure daisy

    -- Sleep for a certain amount of time (e.g., 5 seconds)
    sleep(15)
end
