User.create(email: 'user@gmail.com', username: 'user', password: 'user11', password_confirmation: 'user11')

type1 = Type.create(name: 'Warrior', user_id: 1)
type1.image.attach(io: File.open("#{Rails.root}/db/seeds/type_images/warrior.png"), filename: "warrior.png")
type1.save()

type2 = Type.create(name: 'Mage', user_id: 1)
type2.image.attach(io: File.open("#{Rails.root}/db/seeds/type_images/mage.jpeg"), filename: "mage.jpeg")
type2.save()

type3 = Type.create(name: 'Hunter', user_id: 1)
type3.image.attach(io: File.open("#{Rails.root}/db/seeds/type_images/hunter.jpeg"), filename: "hunter.jpeg")
type3.save()

type4 = Type.create(name: 'Jumanji', user_id: 1)
type4.image.attach(io: File.open("#{Rails.root}/db/seeds/type_images/jumanji.jpeg"), filename: "jumanji.jpeg")
type4.save()

type5 = Type.create(name: 'Forge Of Empires', user_id: 1)
type5.image.attach(io: File.open("#{Rails.root}/db/seeds/type_images/empires.jpeg"), filename: "empires.jpeg")
type5.save()

attribute1 = Attribute.create(name: 'speed', numerical: 30, type_id: 1, user_id: 1)
attribute1.icon.attach(io: File.open("#{Rails.root}/db/seeds/type_images/speed.png"), filename: "speed.png")
attribute1.save()

attribute2 = Attribute.create(name: 'strength', numerical: 70, type_id: 1, user_id: 1)
attribute2.icon.attach(io: File.open("#{Rails.root}/db/seeds/type_images/strength.jpeg"), filename: "strength.jpeg")
attribute2.save()

attribute3 = Attribute.create(name: 'invisible', numerical: 90, type_id: 2, user_id: 1)
attribute3.icon.attach(io: File.open("#{Rails.root}/db/seeds/type_images/invisible.png"), filename: "invisible.png")
attribute3.save()
