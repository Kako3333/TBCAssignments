//
//  WithoutISP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი არღვევს ISP-ის პრინციპს, რადგან AnimalActions პროტოკოლი მოიცავს იმაზე მეტ ფუნქციას, ვიდრე საჭიროა კონკრეტულ კლასებში. მაგალითად, Dog კლასს არ სჭირდება fly() ფუნქცია, რადგან ძაღლები არ ფრინავენ, მაგრამ ის მაინც იძულებულია იმუშაოს ამ მეთოდზე რადგან ის ძაღლია და ცხოველია, რაც არღვევს ISP-ის. ასევე, Birdd კლასს არ სჭირდება swim() ფუნქცია, რადგან ბევრ ფრინველს არ შეუძლია ცურვა, მაგრამ ის მაინც ვალდებულია დააქონფირმოს პროტოკოლი. ეს ქმნის ზედმეტად დიდ და ზოგად პროტოკოლს, რომელიც აიძულებს კლასებს შეასრულონ ისეთი ქმედებები, რომლებიც არ შეესაბამება მათ რეალურ ქცევას. ISP-ის მიხედვით, პროტოკოლები უნდა იყვნენ სპეციალიზებული და მხოლოდ კონკრეტულ ქცევებზე მიმართული, რომლებიც კონკრეტულ კლასებს სჭირდებათ.

protocol AnimalActions {
    func eat()
    func sleep()
    func fly()
    func swim()
    func bark()
}

class Dog: AnimalActions {
    func bark() {
        print("Dog is Barking")
    }
    
    func eat() {
        print("Dog is eating")
    }
    
    func sleep() {
        print("Dog is sleeping")
    }
    
    func fly() {
        print("Dogs can't fly")
    }
    
    func swim() {
        print("Dog is swimming")
    }
}

class Birdd: AnimalActions {
    func bark() {
        print("Birds can't Bark")
    }
    
    func eat() {
        print("Bird is eating")
    }
    
    func sleep() {
        print("Bird is sleeping")
    }
    
    func fly() {
        print("Bird is flying")
    }
    
    func swim() {
        print("Birds can't swim")
    }
}
