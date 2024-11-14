//
//  WithISP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი არ არღვევს ISP-ის პრინციპს, რადგან ახლა თითოეული კლასი მხოლოდ იმ პროტოკოლს იღებს, რომელიც მის ქცევას ახასიათებს. მაგალითად, Dog კლასი იღებს Eater, Sleeper, Swimmer, და Barker, რადგან ეს მისთვის შესაბამისი ქცევებია. ასევე, Bird კლასი იღებს Eater, Sleeper, და Flyer რადგან ასევე ეს მისთვის შესაბამისი ქცევებია, მაგრამ მას არ სჭირდება swim() მეთოდი, ამიტომ ის არ იღებს Swimmer პროტოკოლს და არ არის ვადებული რომ მიიღოს. ამგვარად, თითოეული კლასის ინტერფეისი მხოლოდ იმ მოქმედებებს შეიცავს, რაც ამ კლასს ნამდვილად სჭირდება, და არა დამატებით ფუნქციონალს, რომელიც არ არის საჭირო. ეს სტრუქტურა იცავს ISP-ის, რადგან გვაქვს მრავალი პროტოკოლი რომლებიც კლასებს მოქნილს ხდის დააქონფირმონ მხოლოდ ისინი რომლებიც მათ შეესაბამება.

protocol Eater {
    func eat()
}

protocol Sleeper {
    func sleep()
}

protocol Flyer {
    func fly()
}

protocol Swimmer {
    func swim()
}

//არვიცი Barker რამდენად სწორია ;დდ
protocol Barker {
    func bark()
}

class Dogg: Eater, Sleeper, Swimmer, Barker {
    func bark() {
        print("Dog is Barking")
    }
    
    func swim() {
        print("Dog is swimming")
    }
    
    func eat() {
        print("Dog is eating")
    }
    
    func sleep() {
        print("Dog is sleeping")
    }
}

class Birddd: Eater, Sleeper, Flyer {
    func eat() {
        print("Bird is eating")
    }
    
    func sleep() {
        print("Bird is sleeping")
    }
    
    func fly() {
        print("Bird is flying")
    }
}

class Fish: Eater, Sleeper, Swimmer {
    func eat() {
        print("Fish is eating")
    }
    
    func sleep() {
        print("Fish is sleeping")
    }
    
    func swim() {
        print("Fish is swimming")
    }
}
