local map={}
local comb = game.player.surface.create_entity({name = "constant-combinator", position = {x=game.player.position.x+1,y=game.player.position.y}, force = game.forces.player})
idx = 0
last = nil
prot_id = 0
function addSig(sig, prot)
  if idx % 18 == 0 then
    comb = game.player.surface.create_entity({name = "constant-combinator", position = {x=comb.position.x+1,y=comb.position.y}, force = game.forces.player})
    if last ~= nil then
        comb.connect_neighbour({wire = defines.wire_type.green, target_entity = last})
    end
    last = comb
  end
  comb.get_control_behavior().set_signal(idx % 18 + 1, {signal=sig, count=idx +100})
  idx = idx + 1
  return
end
for _,p in pairs(game.item_prototypes) do
  if not p.has_flag("hidden") then
   add_signal({ name=p.name, type="item"}, p)
  end
end
