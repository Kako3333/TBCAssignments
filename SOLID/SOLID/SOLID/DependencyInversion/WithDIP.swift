//
//  WithDIP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი არ არღვევს DIP-ს, რადგან მაღალი დონის მოდული PaymentProcessor1 არ არის პირდაპირ დამოკიდებული დაბალი დონის მოდულებზე, როგორიცაა ApplePayPayment1 ან CreditCardPayment. პირიქით, ის იყენებს აბსტრაქციას PaymentMethodProtocol პროტოკოლს, რომელიც საშუალებას აძლევს კოდს, ჰქონდეს მოქნილობა და იყოს გაფართოებადი. PaymentProcessor1 კლასში PaymentMethodProtocol-ის ტიპის ობიექტი ინიციანიზდება, რაც გვაძლევს შესაძლებლობას, გადავიხადოთ ნებისმიერი გადახდის მეთოდით, რომელიც დააკმაყოფილებს PaymentMethodProtocol-ს. ეს ნიშნავს, რომ PaymentProcessor1-ის კლასი მხოლოდ პროტოკოლზეა დამოკიდებული. თუ მომავალში მოგვინდება დამატოთ ახალი გადახდის მეთოდი, მაგალითად payPal, ის მხოლოდ მიიღებს PaymentMethodProtocol პროტოკოლს, და PaymentProcessor1 კლასის კოდის შეცვლა არ დაგვჭირდება. ეს ქმნის მოქნილობას და მარტივს ხდის ახალი ფუნქციების დამატებას კოდის სხვა ნაწილში.

protocol PaymentMethodProtocol {
    func makePayment(amount: Double)
}

class ApplePayPayment1: PaymentMethodProtocol {
    func makePayment(amount: Double) {
        print("Payment of \(amount) amount made with ApplePay")
    }
}

class CreditCardPayment: PaymentMethodProtocol {
    func makePayment(amount: Double) {
        print("Payment of \(amount) amount made with Credit Card")
    }
}

class PaymentProcessor1 {
    private var paymentMethodProtocol: PaymentMethodProtocol
    
    init(paymentMethodProtocol: PaymentMethodProtocol) {
        self.paymentMethodProtocol = paymentMethodProtocol//dependency injectionს იყენებს
    }
    
    func processPayment(amount: Double) {
        paymentMethodProtocol.makePayment(amount: amount)
    }
}
