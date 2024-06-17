local mae={}
local combinator = game.player.surface.create_entity({
    name = "constant-combinator",
     position = {
         x=game.player.position.x + 1,
         y=game.player.position.y
     },
    force = game.forces.player
})
idx = 0
last = nil

function add_signal(sig, prot)
  if idx % 18 == 0 then
    combinator = game.player.surface.create_entity({ name = "constant-combinator", position = { x= combinator.position.x+1, y= combinator.position.y}, force = game.forces.player})
    if last ~= nil then
        combinator.connect_neighbour({ wire = defines.wire_type.green, target_entity = last})
    end
    last = combinator
  end
  combinator.get_control_behavior().set_signal(idx % 18 + 1, { signal=sig, count=prot.stack_size})
  idx = idx + 1
  return
end

for _,p in pairs(game.item_prototypes) do
  if not p.has_flag("hidden") then
   add_signal({ name=p.name, type="item"}, p)
  end
end
