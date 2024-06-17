local hotbars = {}
for bar=0,9 do
    local hotbar = {}
    for slot=1,9 do
        local item = game.player.get_quick_bar_slot((bar*10)+slot)
        if (item ~= nil) then
            table.insert(hotbar, item.name)
            game.player.print(item.name)
        end
    end    
    table.insert(hotbars, hotbar)
end

game.write_file("creative_hotbars.json", game.table_to_json(hotbars))