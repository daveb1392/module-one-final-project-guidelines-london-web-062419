
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
    {user_id:1, location_id:1, title:"The Unfortunate Events in Babylon", content:"There once was a mystical land called Babylon, now this is in ancient history, however, what people don't know is about the unfortunate story of a Sasquatch(Big Foot) meeting his fate when he wondered across a Griffen. Now there were two wondering the area. But unbeknown to Big Foot, was that one of the Griffens was indeed a fraud, she was a shapeshifter, so the first time he met a griffen, he just stroked the griffen's head with no problems. The next time he came across a griffen, he did not know that there were rules in approaching such a creature. Instead of bowing and approaching slowly, he once again just walked up to the griffen. The real Griffen kicked Big Foot in the head, leading to his unfortunate death. The end",},
    {user_id:1, location_id:2, title:"The Dark Stories of the Black Forest", content:"There once was a witch who lived in a little cottage in the deep deep woods of Black Forest. This witch was evil and loved playing around with her magic. A couple nervously approached her cottage in the hope of a spell cast on them to become beautiful. They said they would pay the witch a lot of gold coins. Th witch happily took the couples money but once she cast her spell... the man was turned into a goblin and the woman was turned into an ogre. She told them to live with their ugly features. The End."},
    {user_id:1, location_id:3, title:"They call it.. Magic", content:"Hogwarts has many tales. But once upon a time.. in Hogwarts, a vampire entered the building. He didn't like witches or wizards so he went around terrorizing all the children. Dumbledore could not find this indecent individual because with vampires they have their own powers: speed, strength and mind control. So Dumbledore sent everyone into hiding i.e the common rooms. Once everyone was safe.. Dumbledore casted a spell to portal a werewolf into the building. Werewolves love killing vampires. He sniffed the vamp out and killed him on site."},
    {user_id:1, location_id:4, title:"Lost in Aokigahara", content:"Three best friends: a fairy, a gnome and an elf decided to go for a walk. They knew about the horrifying stories about Aokigahara but being magical creatures they were not worried. They were wrong. They got so lost that til this very day, their bodies have not been found."},
    {user_id:1, location_id:5, title:"It's Atlantis!", content:"A mermaid was swimming around Atlantis. She was singing and enjoying her time until she came across an Ogre. He wanted all the treasures of Atlantis to himself. The mermaid refused to show him the way to the treasure room, before the Ogre could do anything.. the Lochness Monster swam up to them and ate the Ogre. He swam off leaving the mermaid to her lovely day. The end."}
])
puts "\n---------- SEEDED ------------\n\n"