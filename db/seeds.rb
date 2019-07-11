
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
{creature: "Wizard", age: "35", weapon: "Wand"},
{creature: "Witch", age: "200", weapon: "Wand"},
{creature: "Ogre", age: "40", weapon: "Onion"},
{creature: "Dragon", age: "1000", weapon: "Fire"},
{creature: "Fairy", age: "300", weapon: "Magic"},
{creature: "Goblin", age: "33", weapon: "Dagger"},
{creature: "Griffen", age:"81", weapon: "Claws"},
{creature: "Elf", age: "a long time", weapon: "Mind Control" },
{creature: "Gnome", age: "50", weapon: "Stick"},
{creature: "Vampire", age: "2019", weapon: "Fangs"},
{creature: "Werewolf", age: "24", weapon: "Claws & Teeth"},
{creature: "Shapeshifter", age: "31", weapon: "Morph"},
{creature: "Mermaid", age: "70", weapon: "Trident"},
{creature: "Lochness Monster", age: "1000", weapon: "Very sharp teeth"},
{creature: "Sasquatch(Big Foot", age: "60", weapon: "A club"},
{creature: "Princess", age: "18", weapon: "Jewelry"},
{creature: "Prince", age: "21", weapon: "Sword"},
{creature: "Dwarf", age: "60", weapon: "Double side axe"},
{creature: "Alien", age: "130", weapon: "Spaceship"}])

puts "Creature seeded"

Story.create ([
    {user_id:1, location_id:1, title:"The Unfortunate Events in Babylon", content:"There once was a mystical land called Babylon, now this is in ancient history, however, what people don't know is about the unfortunate story of a Sasquatch(Big Foot) meeting his fate when he wondered across a Griffen. Now there were two wondering the area. But unbeknown to Big Foot, was that one of the Griffens was indeed a fraud, she was a shapeshifter, so the first time he met a griffen, he just stroked the griffen's head with no problems. The next time he came across a griffen, he did not know that there were rules in approaching such a creature. Instead of bowing and approaching slowly, he once again just walked up to the griffen. The real Griffen kicked Big Foot in the head, leading to his unfortunate death. The end",},
    {user_id:1, location_id:2, title:"The Dark Stories of the Black Forest", content:"There once was a witch who lived in a little cottage in the deep deep woods of Black Forest. This witch was evil and loved playing around with her magic. A couple nervously approached her cottage in the hope of a spell cast on them to become beautiful. They said they would pay the witch a lot of gold coins. Th witch happily took the couples money but once she cast her spell... the man was turned into a goblin and the woman was turned into an ogre. She told them to live with their ugly features. The End."},
    {user_id:1, location_id:3, title:"They call it.. Magic", content:"Hogwarts has many tales. But once upon a time.. in Hogwarts, a vampire entered the building. He didn't like witches or wizards so he went around terrorizing all the children. Dumbledore could not find this indecent individual because with vampires they have their own powers: speed, strength and mind control. So Dumbledore sent everyone into hiding i.e the common rooms. Once everyone was safe.. Dumbledore casted a spell to portal a werewolf into the building. Werewolves love killing vampires. He sniffed the vamp out and killed him on site."},
    {user_id:1, location_id:4, title:"Lost in Aokigahara", content:"Three best friends: a fairy, a gnome and an elf decided to go for a walk. They knew about the horrifying stories about Aokigahara but being magical creatures they were not worried. They were wrong. They got so lost that til this very day, their bodies have not been found."},
    {user_id:1, location_id:5, title:"It's Atlantis!", content:"A mermaid was swimming around Atlantis. She was singing and enjoying her time until she came across an Ogre. He wanted all the treasures of Atlantis to himself. The mermaid refused to show him the way to the treasure room, before the Ogre could do anything.. the Lochness Monster swam up to them and ate the Ogre. He swam off leaving the mermaid to her lovely day. The end."}
])
puts "Story seeded"

Trait.create ([
    {name: "Evil"},
    {name: "Good"},
    {name: "Ugly"},
    {name: "Bubbly"},
    {name: "Patient"},
    {name: "Friendly"},
    {name: "Very Chatty"},
    {name: "Always Hangry"},
    {name: "The local cray, cray"},
    {name: "Smelly"},
    {name: "Sly"},
    {name: "Sneaky"},
    {name: "Shy"},
    {name: "Curious"},
    {name: "VIP"},
    {name: "Cold-Blooded"},
])
puts "\n---------- SEEDED ------------\n\n"