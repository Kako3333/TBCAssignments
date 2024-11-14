//
//  WithoutLSP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი არღვევს LSP პრინციპს, რადგან მშობელი კლასი ერგება შვილობილის ლოგიკას თუმცა აძლევს მას ალოგიკურ ქმედებას რაც მას არ შეესაბამება. შვილობილი კლასები უნდა იყვნენ ისეთები, რომ სრულად გააგრძელონ მშობელი კლასის ქცევა. ეს მაგალითი კი ამტკიცებს რომ ზოგადი ლოგიკის მიუხედავად არის მაგალითი როცა ირღვევა ლოგიკა კონკრეტული ქცევის გამო. არვიცი როგორ ავხსნა სხვანაირად ;დ

class Vehicle {
    func startEngine() {
        print("Engine started")
    }
}

class Bmw: Vehicle {
    override func startEngine() {
        print("Bmw engine started")
    }
}

class Tesla: Vehicle {
    override func startEngine() {
        print("Tesla powered on, cant start the engine") // ვერ დაიქოქება...
    }
}


