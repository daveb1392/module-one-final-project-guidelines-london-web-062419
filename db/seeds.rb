
#locations
Location.create ([
{name: "Babylon", address: "Tikrit, Iraq (1000AD)"},#1
{name: "Black Forest", address: "Schwarzwald, Germany (1700's)"},#2
{name: "Hogwarts", address: "Hogwarts School of Witchcraft and Wizardry, North West Highlands(Unknown to muggles)"},#3
{name: "Aokigahara", address: "Aokigahara Forest, Mount Fuji, Japan"},#4
{name: "Atlantis", address: "Somewhere in the Atlantic Ocean"},#5
])

puts "locations seeded"

Creature.create ([
{creature: "Wizard"},
{creature: "Witch"},
{creature: "Ogre"},
{creature: "Dragon"},
{creature: "Fairy"},
{creature: "Goblin"},
{creature: "Griffen"},
{creature: "Elf"},
{creature: "Gnome"},
{creature: "Vampire"},
{creature: "Werewolf"},
{creature: "Shapeshifter"},
{creature: "Mermaid"},
{creature: "Lochness Monster"},
{creature: "Sasquatch(Big Foot"},
])

puts "Creature seeded"

Story.create ([
    {user_id:, location_id:1, title:"", content:, creature_id:, creature_id2:, creature_id3:}
])
puts "\n---------- SEEDED ------------\n\n"