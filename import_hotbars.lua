-- Created using .\export_hotbars.lua
local creative_hotbars = {
    {"express-transport-belt","express-underground-belt","express-splitter","stack-inserter","assembling-machine-3","substation","fast-inserter","electric-furnace","electric-mining-drill"},
    {"medium-electric-pole","big-electric-pole","substation","small-lamp","roboport","small-electric-pole"},
    {"green-wire","red-wire","medium-electric-pole","arithmetic-combinator","decider-combinator","constant-combinator","small-lamp","programmable-speaker","power-switch"},
    {"rail","rail-signal","train-stop","rail-chain-signal","locomotive","cargo-wagon","fluid-wagon","artillery-wagon"},
    {"pipe","pipe-to-ground","storage-tank","pump","offshore-pump","boiler","steam-engine","pumpjack","oil-refinery"},
    {"beacon","roboport","steel-chest","logistic-chest-passive-provider","logistic-chest-requester","logistic-chest-buffer","logistic-chest-storage","logistic-chest-active-provider"},
    {"stone-wall","gate","laser-turret","flamethrower-turret","artillery-turret","radar","gun-turret"},
    {"landfill","concrete","hazard-concrete","refined-concrete","refined-hazard-concrete","stone-brick","waterfill","cliff-explosives"}
}


function map_hotbars(hotbars, fn)
    for bar, hotbar in ipairs(hotbars) do
        game.player.print(bar)
        for slot, item_name in ipairs(hotbar) do
            fn(bar, slot, item_name)
        end
    end
end


function set_hotbars(hotbars)
    map_hotbars(hotbars, function(bar, slot, item_name)
        local index = ((bar-1)*10)+slot
        game.player.set_quick_bar_slot(index, item_name)
    end)
end


function ensure_items_present(hotbars)
    local player_inv = game.player.get_main_inventory()
    local player_inv_contents = player_inv.get_contents()

    map_hotbars(hotbars, function(bar, slot, item_name)
        local item_prototype = game.item_prototypes[item_name]
        local item_stack_size = item_prototype.stack_size
        local item_current_amount = player_inv.get_item_count(item_name)
        if item_current_amount < item_stack_size then
            local full_stack_diff = item_stack_size - item_current_amount
            player_inv.insert({name=item_name, count=full_stack_diff})
        end
    end)
end

set_hotbars(creative_hotbars)
ensure_items_present(creative_hotbars)


