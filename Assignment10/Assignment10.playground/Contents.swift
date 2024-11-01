import UIKit

var greeting = "Hello, playground"
func separate(task: Int) {
    print("\n------ნომერი:\(task)-------\n")
}

//1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას. 

separate(task: 1)


enum CreatureType {
    case fire(rarity: Double)
    case water(rarity: Double)
    case earth(rarity: Double)
    case air(rarity: Double)
    case electric(rarity: Double)
    
    var rarity: Double {
            switch self {
            case .fire(let rarity), .water(let rarity), .earth(let rarity), .air(let rarity), .electric(let rarity):
                return min(max(rarity, 0.0), 1.0)
            }
        }
    
    var description: String {
        switch self {
        case .fire:
            return "არსება ბინადრობს ცეცხლში. rerity: \(rarity)"
        case .water:
            return "არსება ბინადრობს წყალში. rerity: \(rarity)"
        case .earth:
            return "არსება ბინადრობს ხმელეთზე. rariy: \(rarity)"
        case .air:
            return "არსება ბინადრობს ჰაერში. rarity: \(rarity)"
        case .electric:
            return "არსება არვიცი საერთოდ electric როგორ არის. rarity: \(rarity)"
        }
    }
}




//2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
//    * var health: Double
//    * var attack: Double
//    * var defense: Double
//    * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) 

separate(task: 2)

protocol CreatureStats {
    var health: Double { get }
    var attack: Double { get }
    var defense: Double { get }
    
    func updateStats(health: Double, attack: Double, defense: Double)
}



//3. შექმენით კლასი Trainer შემდეგი ფროფერთებით:
//    * public let name: String
//    * private var creatures: [DigitalCreature]
//    * დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად.
separate(task: 3)

class Trainer {
    public let name: String
    private var creatures: [DigitalCreature]
    
    init(name: String, creatures: [DigitalCreature] = []) {
        self.name = name
        self.creatures = creatures
    }
    
    public func add(creature: DigitalCreature) {
        creatures.append(creature)
        creature.trainer = self
        print("\(name) trainer has added \(creature.name) to his list to train.")
    }
    
    public func removeCreature(named name: String) {
        creatures.forEach { print($0.name) }
        creatures.first { $0.name == name }?.trainer = nil
        creatures.removeAll { $0.name == name }
        creatures.forEach { print($0.name) }
        }
    deinit {
        print("trainer \(name) was deleted")
    }
}




//4. შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
//    * public let name: String
//    * public let type: CreatureType
//    * public var level: Int
//    * public var experience: Double
//    * weak public var trainer: Trainer?
//    * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას. 

separate(task: 4)

class DigitalCreature: CreatureStats {
    
    var health: Double
    var attack: Double
    var defense: Double
    
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    
    init(name: String, type: CreatureType, level: Int, experience: Double, health: Double, attack: Double, defense: Double) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    func updateStats(health: Double = 100, attack: Double = 50, defense: Double = 50) {
        self.health = health
        self.attack = attack
        self.defense = defense
        print("\(name) now has updated stats Health: \(health), Defense: \(defense), Attack: \(attack)")
    }
    
    deinit {
        print("Digital creature \(name) was deleted")
    }
}


//5. შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
//    * private var creatures: [DigitalCreature] - არსებების მასივი
//    * public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
//    * public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
//    * public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნებაგააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას. 

separate(task: 5)

class CreatureManager {
    private var creatures: [DigitalCreature]
    
    init(creatures: [DigitalCreature] = []) {
        self.creatures = creatures
    }
    
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
    }
    
    var totalStrength: Double {
            return creatures.reduce(0) { $0 + ($1.attack + $1.defense) }
        }
    
    public func trainCreature(named name: String) {
        if let creature = creatures.first(where: { $0.name == name }) {
            if let trainer = creature.trainer {
                print("\(name) will be trained")
            } else {
                print("\(name) doesn't have a trainer")
            }
        } else {
            print("creature named \(name) can't be fount")
        }
    }
    
    public func listCreatures() -> [DigitalCreature] {
        if creatures.isEmpty {
            print("There are no creatures to list.")
        } else {
            for creature in creatures {
                print("Name: \(creature.name), Type: \(creature.type.description), Level: \(creature.level), Experience: \(creature.experience), Health: \(creature.health), Attack: \(creature.attack), Defense: \(creature.defense)")
            }
        }
        return creatures
    }
}


extension CreatureManager {
    func trainAllCreatures() {
        print("Total creatures in this manager: \(creatures.count)")
        for creature in creatures {
            if let trainer = creature.trainer {
                print("\(creature.name) is being trained by \(trainer.name).")
            } else {
                print("\(creature.name) doesn't have a trainer.")
            }
        }
    }
}



//6. შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას. 

separate(task: 6)

class CreatureShop {
    
    let creatureNames = ["Flame", "Aqua", "Rocky", "Breezy", "Volt", "Inferno", "Splash", "Terra", "Gale", "Spark"]
    
    func purchaseRandomCreature() -> DigitalCreature {
        
        // რენდომ მონაცემები
        let randomLevel = Int.random(in: 1...100)
        let randomExperience = Double.random(in: 0.0...100.0)
        let randomHealth = Double.random(in: 50...150)
        let randomAttack = Double.random(in: 10...100)
        let randomDefense = Double.random(in: 10...100)
        let randomName = creatureNames.randomElement()!
        let randomRarity = Double.random(in: 0.1...1.0)
        
        let creatureTypes: [CreatureType] = [
            .fire(rarity: randomRarity),
            .water(rarity: randomRarity),
            .earth(rarity: randomRarity),
            .air(rarity: randomRarity),
            .electric(rarity: randomRarity)
        ]
        let randomType = creatureTypes.randomElement()!
        
        let randomGeneratedCreature = DigitalCreature(name: randomName, type: randomType, level: randomLevel, experience: randomExperience, health: randomHealth, attack: randomAttack, defense: randomDefense)
        return randomGeneratedCreature
    }
    
    func description(for creature: DigitalCreature) -> String {
        return "Name: \(creature.name), Type: \(creature.type.description), Level: \(creature.level), Experience: \(creature.experience), Health: \(creature.health), Attack: \(creature.attack), Defense: \(creature.defense)"
    }
}


//7. შექმენით გლობალური ფუნქცია updateLeaderboard(players: [CreatureManager]) -> [CreatureManager], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  

separate(task: 7)

func updateLeaderboard(players: [CreatureManager]) -> [CreatureManager] {
    players.sorted { $0.totalStrength > $1.totalStrength }.forEach { print($0.totalStrength) }
    return players.sorted { $0.totalStrength > $1.totalStrength }
}




//8. გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
//    * შექმენით რამდენიმე Trainer ობიექტი
//    * შექმენით რამდენიმე CreatureManager ობიექტი
//    * შექმენით ერთი ან ორი CreatureShop
//    * თითოეული მენეჯერისთვის:
//        * შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//        * მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//        * სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
//    * გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
//    * განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
//    * დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
//    * წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//    * დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 

// შექმენით რამდენიმე Trainer ობიექტი
var trainer1: Trainer? = Trainer(name: "firstTrainer")
let trainer2 = Trainer(name: "SecondTrainer")

// შექმენით რამდენიმე CreatureManager ობიექტი
var creatureManager1 = CreatureManager()
let creatureManager2 = CreatureManager()

// შექმენით ერთი ან ორი CreatureShop
let shop1 = CreatureShop()

// შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
let purchasedCreature1 = shop1.purchaseRandomCreature()
let randomGeneratedCreature = purchasedCreature1
let purchasedCreature2 = shop1.purchaseRandomCreature()
let randomGeneratedCreature1 = purchasedCreature2
let purchaseCreature3 = shop1.purchaseRandomCreature()
let randomGeneratedCreature3 = purchaseCreature3
//var creature1 = DigitalCreature(name: "gio", type: .air(rarity: 0.3), level: 200, experience: 24, health: 50, attack: 300, defense: 400)
//let creature2 = DigitalCreature(name: "luka", type: .air(rarity: 0.5), level: 200, experience: 24, health: 20, attack: 200, defense: 300)


// მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
trainer1?.add(creature: randomGeneratedCreature)
trainer1?.add(creature: randomGeneratedCreature1)

// სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
creatureManager1.adoptCreature(randomGeneratedCreature)
creatureManager1.adoptCreature(randomGeneratedCreature1)
creatureManager2.adoptCreature(randomGeneratedCreature)
creatureManager2.adoptCreature(randomGeneratedCreature3)

//წვრთნა
creatureManager1.trainCreature(named: randomGeneratedCreature.name)
creatureManager1.trainCreature(named: randomGeneratedCreature1.name)

// გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)

creatureManager1.trainAllCreatures()

// განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით

updateLeaderboard(players: [creatureManager1, creatureManager2])

// დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
print("Creatures in CreatureManager 1:")
creatureManager1.listCreatures()



// წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
print("------")

trainer1?.removeCreature(named: "gio")
trainer1 = nil


print("")
print("")
print("")
print("")

// დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 















