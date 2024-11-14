//
//  WithoutDIP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი არღვევს DIP-ს, რადგან მაღალი დონის მოდული PaymentProcessor პირდაპირ დამოკიდებულია დაბალი დონის მოდულზე, ApplePayPayment-ზე. DIP-ის პრინციპი ითვალისწინებს იმას, რომ მაღალი დონის მოდულები არ უნდა იყვნენ დამოკიდებული დაბალი დონის მოდულების კონკრეტულ რეალიზაციაზე, არამედ უნდა იქყვნენ დაყრდნობილი აბსტრაქციებზე. ამ კოდში, PaymentProcessor კლასი პირდაპირ ქმნის ApplePayPayment კლასის ობიექტს, რაც ნიშნავს იმას რომ ეს კლასი მხოლოდ ApplePayPayment-ზეა დამოკიდებული. თუ გადაწყდა სხვა გადახდის მეთოდის მაგალითად, CreditCard-ის დამატება, მაშინ PaymentProcessor კლასში ცვლილება გახდება აუცილებელი.

class ApplePayPayment {
    func makePayment(amount: Double) {
        print("Payment of \(amount) made through PayPal")
    }
}

class PaymentProcessor {
    private var applePayPayment: ApplePayPayment
    
    init() {
        self.applePayPayment = ApplePayPayment() //პირდაპირი კავშირი(dependency) Payment-თან
    }
    
    func processPayment(amount: Double) {
        applePayPayment.makePayment(amount: amount) //პირდაპირ იყენებს Payment კლასს
    }
}
