Ninja.destroy_all
Requester.destroy_all
Mission.destroy_all


# Ninja

 kakashi = Ninja.create({
    name: 'Kakashi Hatake', 
    clan: 'Hatake Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Alive'
 })

 dan = Ninja.create({
    name: 'Dan Katō', 
    clan: 'Yamanaka', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Death'
 })

 sasori = Ninja.create({
    name: 'Sasori', 
    clan: nil, 
    village: 'Sunagakure', 
    rank: 'Kage',
    status: 'Death'
 })

 danzo = Ninja.create({
    name: 'Danzō Shimura', 
    clan: 'Shimura Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Death'
 })

 asuma = Ninja.create({
    name: 'Asuma Sarutobi', 
    clan: 'Sarutobi Clan', 
    village: 'Konohagakure', 
    rank: 'Jōnin',
    status: 'Alive'
 })

# Requester


ichigo = Requester.create({
    name: 'Ichigo Kurosaki', 
    password: nil,
    village: 'Sunagakure', 
    funds: 500
 })

 orihime = Requester.create({
    name: 'Orihime Inoue', 
    password: nil,
    village: 'Konohagakure', 
    funds: 5000
 })

 renji = Requester.create({
    name: 'Renji Abarai', 
    password: nil,
    village: 'Otogakure', 
    funds: 700
 })

 rukia = Requester.create({
    name: 'Rukia Kuchiki', 
    password: nil,
    village: 'Konohagakure', 
    funds: 2000
 })

 uryu = Requester.create({
    name: 'Uryū Ishida', 
    password: nil, 
    village: 'Otogakure', 
    funds: 3000
 })

#  Mission


clash = Mission.create({
    title: 'Operation Clash Of Titans'
    class: 'S', 
    cost: 900, 
    status: 'Completed', 
    ninja_id: dan.id, 
    requester_id: ichigo.id
 })

 full = Mission.create({
    title: 'Operation Full Moon'
    class: 'A', 
    cost: 600, 
    status: 'Ongoing', 
    ninja_id: kakashi.id, 
    requester_id: orihime.id
 })

 werewolf = Mission.create({
    title: 'Operation Werewolf'
    class: 'C', 
    cost: 300, 
    status: 'Ongoing', 
    ninja_id: sasori.id, 
    requester_id: renji.id
 })

 octagon = Mission.create({
    title: 'Operation Octagon'
    class: 'B', 
    cost: 400, 
    status: 'Completed', 
    ninja_id: danzo.id, 
    requester_id: rukia.id
 })

 bronze = Mission.create({
    title: 'Operation Bronze Nightmare'
    class: 'S', 
    cost: 800, 
    status: 'Pending', 
    ninja_id: kakashi.id, 
    requester_id: uryu.id
 })
