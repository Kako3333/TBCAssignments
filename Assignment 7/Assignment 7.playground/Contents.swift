import UIKit

var greeting = "Hello, playground"

// 1) შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს.


enum FoodGroup {
    case fruit
    case vegetable
    case protein
    case dairy
    case grain
}

// 2) შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით)

enum productStatus {
    case sold
    case available
}



// 3) შექმენით სტრუქტურა Product რომელიც შეიცავს
//ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი
//ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.

struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var info: String {
        get {
            print("პროდუქტის სახელია \(name), და ფასი არის \(price)")
            return ("პროდუქტის სახელია \(name), და ფასი არის \(price)")
        }
    }
    var discount: Double
    var mass: Int
    var caloriesPerHundredGram: Int
    var productStatus: productStatus
    
  func showDiscountedPrice() -> Double {
       var discountedPrice = (price) - ((price * discount) / 100)
       print(discountedPrice)
       return discountedPrice
  }
    
   func buy() {
        if productStatus == .available {
            print("თქვენ შეიძინეთ პროდუქტი \(price) ლარად")
        } else {
            print("პროდუქტი არ არის ხელმისაწვდომი")
        }
    }
    
    func calculateCalorieWithMass() -> Double {
        print(Double(caloriesPerHundredGram * mass) / 100)
        return Double(caloriesPerHundredGram * mass / 100)
    }
}


var product = Product(name: "milk", category: .dairy, price: 5, discount: 20, mass: 500, caloriesPerHundredGram: 50, productStatus: .available)

product.info
product.showDiscountedPrice()
product.buy()
product.calculateCalorieWithMass()


// 4) შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.

var arrayOfProducts: [Product] = [
    Product(name: "Apple", category: .fruit, price: 1.5, discount: 10, mass: 150, caloriesPerHundredGram: 52, productStatus: .available),
    Product(name: "Banana", category: .fruit, price: 1.2, discount: 5, mass: 120, caloriesPerHundredGram: 89, productStatus: .available),
    Product(name: "Carrot", category: .vegetable, price: 0.8, discount: 0, mass: 200, caloriesPerHundredGram: 41, productStatus: .available),
    Product(name: "Chicken Breast", category: .protein, price: 6.5, discount: 15, mass: 250, caloriesPerHundredGram: 165, productStatus: .sold),
    Product(name: "Milk", category: .dairy, price: 5.0, discount: 20, mass: 500, caloriesPerHundredGram: 100, productStatus: .sold),
    Product(name: "Yogurt", category: .dairy, price: 1.8, discount: 10, mass: 250, caloriesPerHundredGram: 59, productStatus: .available),
    Product(name: "Cheese", category: .dairy, price: 3.5, discount: 5, mass: 100, caloriesPerHundredGram: 402, productStatus: .available),
    Product(name: "Potato", category: .vegetable, price: 0.6, discount: 0, mass: 300, caloriesPerHundredGram: 77, productStatus: .sold),
    Product(name: "Pasta", category: .grain, price: 2.2, discount: 10, mass: 400, caloriesPerHundredGram: 131, productStatus: .available),
    Product(name: "Rice", category: .grain, price: 1.5, discount: 5, mass: 500, caloriesPerHundredGram: 130, productStatus: .available),
    Product(name: "Eggs", category: .protein, price: 3.0, discount: 0, mass: 500, caloriesPerHundredGram: 155, productStatus: .sold),
    Product(name: "Beef Steak", category: .protein, price: 10.0, discount: 20, mass: 350, caloriesPerHundredGram: 271, productStatus: .available),
    Product(name: "Orange", category: .fruit, price: 0.9, discount: 5, mass: 130, caloriesPerHundredGram: 47, productStatus: .available),
    Product(name: "Bread", category: .grain, price: 2.0, discount: 0, mass: 500, caloriesPerHundredGram: 265, productStatus: .sold),
    Product(name: "Chocolate Bar", category: .grain, price: 1.5, discount: 20, mass: 100, caloriesPerHundredGram: 546, productStatus: .sold)
]


// 5) მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი.


var arrayWithProductNames = arrayOfProducts.map{ $0.name }
print(arrayWithProductNames)


// 6) თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით.

var sortedArrayOfProducts = arrayOfProducts.sorted{ $0.price < $1.price }
// ამას სრულად არ დავპრინტავ კონსოლში საშინლად ჩანს :D
for productPrices in sortedArrayOfProducts {
    print("\(productPrices.name) - \(productPrices.price)")
}



// 7) რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.

func changeToSold(products: [Product]) -> [Product] {
    return products.map { product in
        if product.category == .fruit && product.productStatus == .available {
            return Product(
                name: product.name,
                category: product.category,
                price: product.price,
                discount: product.discount,
                mass: product.mass,
                caloriesPerHundredGram: product.caloriesPerHundredGram,
                productStatus: .sold
            )
        
        } else {
            return product
        }
    }
}

// არ შევცვალე მთავარი მასივი arrayOfProducts თუმცა შემეძლო დამეწერა arrayOfProducts = changeToSold(products: arrayOfProducts) და შეიცვლებოდა
var newArrayOfProducts = changeToSold(products: arrayOfProducts)

// ყველა fruit-ს შეეცვალა სტატუსი და არის sold
for product in newArrayOfProducts {
    print("\(product.name) - \(product.productStatus)")
}





// 8) გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.


func sumOfAvailableProduts(products1: [Product]) {
    
    var filteredProducts = products1.filter { $0.productStatus == .available  }
        .reduce(0.0) { $0 + $1.price }
    
    print(" sum of available products is \(filteredProducts)")
    
}

sumOfAvailableProduts(products1: arrayOfProducts)










