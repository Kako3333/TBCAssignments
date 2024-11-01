import UIKit

//1) შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.

enum Genre: String {
    case action
    case drama
    case comedy
    case thriller
    case horror
    
}

class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Int
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Int) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("name - \(title), release year - \(releaseYear), genge - \(genre), revenue - \(revenue)")
    }
    
    func removeFilm(filmArr: inout [Film], name: String) {
        filmArr.removeAll{ $0.title == name }
        print(filmArr)
    }
}

// 2) შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.

class Person {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge() -> Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear - birthYear
    }
}



//3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.



var film999 = Film(title: "harryPotter", releaseYear: 2001, genre: .thriller, revenue: 200000)
var film9990 = Film(title: "soundOfMetal", releaseYear: 2020, genre: .drama, revenue: 30000000)
var film99900 = Film(title: "incendies", releaseYear: 2014, genre: .drama, revenue: 4000000)
// ბოდიში სახელებისთვის...

var arrayOfFilms = [film999, film9990, film99900]

// მთლიანი მასივი
for film in arrayOfFilms {
    film.description()
}

film999.removeFilm(filmArr: &arrayOfFilms, name: "harryPotter")

// მასივი წაშლილი ფილმის შემდეგ
for film in arrayOfFilms {
    film.description()
}
print("\n-----------\n")







//4. შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი
//   Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ   ნათამაშებ ფილმებს დაამატებს სიაში.

class Actor: Person {
    var actedFilms: [Film] = []
    
    init(name: String, birthYear: Int, actedFilms: [Film] = []) {
        self.actedFilms = actedFilms
        super.init(name: name, birthYear: birthYear)
    }
    
    func addToFilmList(film: Film) {
        actedFilms.append(film)
    }
}

// მაგალითები


var filmi123 = Film(title: "filmi1", releaseYear: 2000, genre: .action, revenue: 30)
var filmi1234 = Film(title: "filmi2", releaseYear: 2000, genre: .drama, revenue: 40)
var testActor1 = Actor(name: "giorgikakaladze", birthYear: 2003)
testActor1.addToFilmList(film: filmi123)
testActor1.addToFilmList(film: filmi1234)
testActor1.actedFilms.map { print($0.title) }
print("\n-----------\n")




//5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
//  დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.


class Director: Person {
    var directedFilms: [Film]
    var totalRevenue: Int
    
    init(name: String, birthYear: Int, directedFilms: [Film] = [], totalRevenue: Int = 0) {
        self.totalRevenue = totalRevenue
        self.directedFilms = directedFilms
        super.init(name: name, birthYear: birthYear)
    }
    
    func addFilmToDirectedList(film: Film) {
        directedFilms.append(film)
        totalRevenue += film.revenue
    }
}


var testFilm1 = Film(title: "test", releaseYear: 2000, genre: .action, revenue: 100)
var testFilm2 = Film(title: "test", releaseYear: 2000, genre: .action, revenue: 400)
var testDirector = Director(name: "zura", birthYear: 2001)

testDirector.addFilmToDirectedList(film: testFilm2)
testDirector.addFilmToDirectedList(film: testFilm1)
print(testDirector.totalRevenue) // 500
print("\n-----------\n")


//6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.

var film1 = Film(title: "inception", releaseYear: 2010, genre: .thriller, revenue: 50000)
var film2 = Film(title: "theDarkKnight", releaseYear: 2008, genre: .action, revenue: 60000)
var film3 = Film(title: "interstellar", releaseYear: 2014, genre: .drama, revenue: 30000)
var film4 = Film(title: "dunkirk", releaseYear: 2017, genre: .drama, revenue: 40000)
var film5 = Film(title: "tenet", releaseYear: 2020, genre: .action, revenue: 45000)

var actor11 = Actor(name: "LeonardoDiCaprio", birthYear: 1974)
var actor22 = Actor(name: "ChristianBale", birthYear: 1974)
var actor33 = Actor(name: "MatthewMcConaughey", birthYear: 1969)
var actor44 = Actor(name: "TomHardy", birthYear: 1975)
var actor55 = Actor(name: "CillianMurphy", birthYear: 1976)

actor11.addToFilmList(film: film1)
actor22.addToFilmList(film: film2)
actor33.addToFilmList(film: film3)
actor44.addToFilmList(film: film4)
actor55.addToFilmList(film: film5)

var arrayOfFilms2: [Film] = [film1, film2, film3, film4, film5]
var arrayOfActors: [Actor] = [actor11, actor22, actor33, actor44, actor55]
var dictionaryOfActorsAndFilms: [String: [String]] = [:]


dictionaryOfActorsAndFilms = arrayOfActors.reduce(into: [String: [String]]()) { result, actor in
    result[actor.name] = actor.actedFilms.map { $0.title }
}

print(dictionaryOfActorsAndFilms)
print("\n-----------\n")

//7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან

arrayOfFilms2.map { print($0.title) }
print("\n-----------\n")


//8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.


let averageOfFilmsReleaseYear = arrayOfFilms2.reduce(0) { $0 + $1.releaseYear } / arrayOfFilms2.count

print(averageOfFilmsReleaseYear)
print("\n-----------\n")



/*
9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
name სუპერ გმირის სახელი
superPower  სუპერ ძალა
level - PowerLevel enum-ის ტიპის,
და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები
 */

class SuperHero {
    
    enum Powerlevel {
        case weak
        case normal
        case strong
    }
    
    var name: String
    var superPower: String
    var level: Powerlevel
    var allies: [SuperHero]
    
    init(name: String, superPower: String, level: Powerlevel, allies: [SuperHero] = []) {
        self.name = name
        self.superPower = superPower
        self.level = level
        self.allies = allies
    }
    
    deinit {
        print("superhero \(name) is dead")
    }
    
   static func uniqueSuperPowers(_ superHeroes: [SuperHero]) -> [String] {
        var uniqueSuperPowers = Set<String>()
        
        for hero in superHeroes {
            uniqueSuperPowers.insert(hero.superPower)
        }
        print(uniqueSuperPowers)
        return Array(uniqueSuperPowers)
    }
    
    func addAlly(ally: SuperHero) {
        allies.append(ally)
    }
}




var superman = SuperHero(name: "superman", superPower: "fly", level: .strong)
var batman: SuperHero? = SuperHero(name: "batman", superPower: "rich", level: .normal, allies: [superman])

batman = nil
print("\n-----------\n")
// ვიძახებთ deinit ფუნქციას



//10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.

enum Powerlevel: String {
    case weak
    case average
    case strong
    case superr
    
    func info() -> String {
        print(self.rawValue)
        return self.rawValue
    }
}

var testtt = Powerlevel.strong

testtt.info()
print("\n-----------\n")



//11. uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას

var testSuperHero1 = SuperHero(name: "aaa", superPower: "fly", level: .normal)
var testSuperHero2 = SuperHero(name: "bbb", superPower: "fly", level: .normal)
var testSuperHero3 = SuperHero(name: "ccc", superPower: "run", level: .normal)
var testSuperHero4 = SuperHero(name: "ddd", superPower: "fly", level: .normal)
// ბოდიში სახელებისთვის :D

let superheroes = [testSuperHero1, testSuperHero2, testSuperHero3, testSuperHero4]
let uniquePowers = SuperHero.uniqueSuperPowers(superheroes)
print("\n-----------\n")



//12.  მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.


var flash = SuperHero(name: "flash", superPower: "run", level: .strong)
var spiderman = SuperHero(name: "spiderman", superPower: "webRagaca", level: .strong)

flash.addAlly(ally: spiderman)
spiderman.addAlly(ally: flash)

for ally in spiderman.allies {
    print("\(ally.name)")
}

for ally in flash.allies {
    print("\(ally.name)")
}













