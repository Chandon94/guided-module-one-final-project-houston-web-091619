Ninja.destroy_all
Requester.destroy_all
Mission.destroy_all


# Ninja

 kakashi = Ninja.create({
    name: 'Kakashi Hatake', 
    password: "admin",
    clan: 'Hatake Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Alive', 
    bank: 0
 })

 dan = Ninja.create({
    name: 'Dan Katō',
    password: "admin", 
    clan: 'Yamanaka', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Death',
    bank: 0
 })

 sasori = Ninja.create({
    name: 'Sasori',
    password: "admin", 
    clan: nil, 
    village: 'Sunagakure', 
    rank: 'Kage',
    status: 'Death',
    bank: 0
 })

 danzo = Ninja.create({
    name: 'Danzō Shimura', 
    password: "admin",
    clan: 'Shimura Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Death',
    bank: 0
 })

 asuma = Ninja.create({
    name: 'Asuma Sarutobi', 
    password: "admin",
    clan: 'Sarutobi Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Alive',
    bank: 0
 })

# Requester


admin = Requester.create({
    name: 'admin', 
    password: "admin",
    village: 'Sunagakure', 
    funds: 10000
 })

ichigo = Requester.create({
    name: 'Ichigo Kurosaki', 
    password: "admin",
    village: 'Sunagakure', 
    funds: 500
 })

 orihime = Requester.create({
    name: 'Orihime Inoue', 
    password: "admin",
    village: 'Konohagakure', 
    funds: 5000
 })

 renji = Requester.create({
    name: 'Renji Abarai', 
    password: "admin",
    village: 'Otogakure', 
    funds: 700
 })

 rukia = Requester.create({
    name: 'Rukia Kuchiki', 
    password: "admin",
    village: 'Konohagakure', 
    funds: 2000
 })

 uryu = Requester.create({
    name: 'Uryū Ishida', 
    password: "admin", 
    village: 'Otogakure', 
    funds: 3000
 })

#  Mission


clash = Mission.create({
    title: 'Operation Clash Of Titans',
    tier: 'S', 
    cost: 900, 
    status: 'Completed', 
    ninja_id: dan.id, 
    requester_id: ichigo.id
 })

 full = Mission.create({
    title: 'Operation Full Moon',
    tier: 'A', 
    cost: 600, 
    status: 'Ongoing', 
    ninja_id: kakashi.id, 
    requester_id: orihime.id
 })

 werewolf = Mission.create({
    title: 'Operation Werewolf',
    tier: 'C', 
    cost: 300, 
    status: 'Ongoing', 
    ninja_id: sasori.id, 
    requester_id: renji.id
 })

 octagon = Mission.create({
    title: 'Operation Octagon',
    tier: 'B', 
    cost: 400, 
    status: 'Completed', 
    ninja_id: danzo.id, 
    requester_id: rukia.id
 })

 bronze = Mission.create({
    title: 'Operation Bronze Nightmare',
    tier: 'S', 
    cost: 800, 
    status: 'Pending', 
    ninja_id: kakashi.id, 
    requester_id: uryu.id
 })


 