import UIKit

var greeting = "Hello, playground"


//1. შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.


enum Genre {
    case fiction
    case nonFiction
    case mystery
    case sciFi
    case biography
    
    //  უკეთესად ვერ აღვწერე :D
    var description: String {
        switch self {
        case .biography:
            return "ფილმის ჟანრია biography"
        case .fiction:
            return "ფილმის ჟანრია fiction"
        case .mystery:
            return "ფილმის ჟანრია mystery"
        case .nonFiction:
            return "ფილმის ჟანრია nonFiction"
        case .sciFi:
            return "ფილმის ჟანრია sciFi"
        }
    }
}


//2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//
//   - "title: String" ფროფერთი
//
//   - "author: String" ფროფერთი
//
//   - "publicationYear: Int" ფროფერთი
//
//   - "readingLevel: ReadingLevel" ფროფერთი
//
//   - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘


enum ReadingLevel {
    case beginner
    case intermediate
    case advanced
}

protocol Readable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var readingLevel: ReadingLevel { get }
    
    func read()
}


//3. შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.


struct Book: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var genre: Genre
    
    func read() {
        print("გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი სახელად \(title), რომლის ჟანრი არის \(genre), და გამოიშვა \(publicationYear) წელს")
    }
    
    func description() {
        print("წიგნის სახელი - \(title), გამოშვების წელი - \(publicationYear), ავტორი - \(author), კითხვის სირთულე - \(readingLevel), ჟანრი - \(genre)"
        )
    }
}

//var testBook1 = Book(title: "test1", author: "JohnCena", publicationYear: 2016, readingLevel: .intermediate, genre: .sciFi)
//testBook1.description()
//print("-")
//testBook1.read()
//print("\n---------\n")



//4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//
//   - "name: String" - ბიბლიოთეკის სახელი
//
//   - "books: [Book]" - წიგნების მასივი

//   დაამატეთ მეთოდები:
//
//   - "add(book: Book)" - წიგნის დამატება
//
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა
//
//  გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.

class Library {
    var name: String
    var books: [Book]
    
    init(name: String, books: [Book] = []) {
        self.name = name
        self.books = books
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func removeBookWith(bookTitle: String) {
        books.removeAll { $0.title == bookTitle }
    }
    
    func listBooks() {
        if books.isEmpty {
            print("There are no books to list")
        } else {
//          print(books.map { $0.title })
            print(books.map { $0.description() })
            // ორივე print მეთოდი პრაქტიკულია
        }
    }
}

extension Library {
    func filterBooks(closure: ([Book]) -> [Book]) -> [Book] {
        return closure(books)
    }
}

//closures
var filterByYear: ([Book]) -> ([Book]) = { books in
    return books.filter { $0.publicationYear > 2000 }
}
var hardToRead: ([Book]) -> ([Book]) = { books in
    return books.filter { $0.readingLevel == .advanced }
}



//5.  შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.



func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    var dict = books.reduce(into: [:]) { dict, book in
        dict[book.readingLevel, default: []].append(book)
    }
    for (readingLevel, books) in dict {
        let titles = books.map{ $0.title }
        print("\(readingLevel) : \(titles)")
    }
    return dict
}


//
//func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
//    var groupedBooks: [ReadingLevel: [T]] = [:]
//    groupedBooks = books.reduce(into: [ReadingLevel: [T]]()) { result, book in
//        result[book.readingLevel, default: []].append(book)
//    }


//    for (readingLevel, books) in groupedBooks {
//        let titles = books.map { $0.title }
//        print("\(readingLevel): \(titles)")
//    }
//    return groupedBooks
//}



//6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//
//   - "id: Int"
//
//   - "name: String"
//
//   - "borrowedBooks: [Book]"
//   დაამატეთ მეთოდები:
//
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში

class LibraryMember {
    var id: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String, borrowedBooks: [Book] = []) {
        self.id = id
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(_ book: Book, from library: Library) {
        if library.books.contains(where: { $0.title == book.title }) {
            library.removeBookWith(bookTitle: book.title)
            borrowedBooks.append(book)
            print("\(name) borrowed book \(book.title) from the library")
        } else {
            print("Library doesn't have the book for you to borrow")
        }
    }
    
    func returnBook(_ book: Book, to library: Library) {
        if borrowedBooks.contains(where: { $0.title == book.title }) {
            library.add(book: book)
            borrowedBooks.removeAll(where: { $0.title == book.title })
            print("\(name) returned borrowed book \(book.title) to the library")
        } else {
            print("\(name) doesn't have book \(book.title) to return")
        }
    }
}


//7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
//
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ


let book1 = Book(title: "Metro2033", author: "GiorgiK", publicationYear: 2016, readingLevel: .advanced, genre: .sciFi)
let book2 = Book(title: "1984", author: "ZuraB", publicationYear: 1949, readingLevel: .intermediate, genre: .fiction)
let book3 = Book(title: "King", author: "AnaK", publicationYear: 2006, readingLevel: .intermediate, genre: .fiction)
let book4 = Book(title: "MindOfHer", author: "NikaK", publicationYear: 2011, readingLevel: .advanced, genre: .nonFiction)
let book5 = Book(title: "Becoming", author: "LukaT", publicationYear: 2018, readingLevel: .beginner, genre: .biography)

let myLibrary = Library(name: "City Library")
let arrayOfBooks = [book1, book2, book3, book4, book5]

myLibrary.add(book: book1)
myLibrary.add(book: book2)
myLibrary.add(book: book3)
myLibrary.add(book: book4)
myLibrary.add(book: book5)

myLibrary.listBooks()
// myLibrary.removeBookWith(bookTitle: "King") კომენტარის სახით დავწერ იმიტორო შემდეგ დავალებაში ყველა წიგნი მჭირდება

// closure მაქვს შექმნილი 140 ხაზზე და აქ ვიყენებ
myLibrary.filterBooks(closure: filterByYear)

// დაჯგუფების გამოყენება
groupBooksByLevel(arrayOfBooks)






//8. შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//
//   - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//
//   - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//
//   დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია

var member1 = LibraryMember(id: 111, name: "Mari")
var member2 = LibraryMember(id: 222, name: "Kako")

member1.borrowBook(book1, from: myLibrary)
member1.borrowBook(book3, from: myLibrary)

member2.borrowBook(book2, from: myLibrary)
member2.borrowBook(book4, from: myLibrary)

member1.returnBook(book1, to: myLibrary)
member2.returnBook(book2, to: myLibrary)

print(" \(member1.name) borrowed books: \(member1.borrowedBooks.map { $0.title })")
print(" \(member2.name) borrowed books: \(member2.borrowedBooks.map { $0.title })")



//9. გააფართოვეთ "Array" ტიპი, სადაც ელემენტი აკმაყოფილებს "Readable" პროტოკოლს (ანუ ამ ექსთენშენი მოცემული მეთოდები ხელმსიაწვდომი იქნება მხოლოდ [Readable] მასივისთვის), შემდეგი მეთოდებით:
//
//   - "findByAuthor(_ author: String) -> [Readable]" - აბრუნებს ავტორის მიხედვით ნაპოვნ წიგნებს
//   - "oldestBook() -> Readable?" - აბრუნებს ყველაზე ძველ წიგნს

extension Array where Element: Readable {
    func findByAuthor(_ author: String) -> [Readable] {
        return self.filter { $0.author == author }
    }
    
    func oldestBook() -> Readable? {
        return self.sorted { $0.publicationYear < $1.publicationYear }.first
    }
    
}

let oldestBook = arrayOfBooks.oldestBook()
let bookOfGiorgiK = arrayOfBooks.findByAuthor("GiorgiK")




//10. შექმენით "EBook" სტრუქტურა, რომელიც დააკმაყოფილებს "Readable" პროტოკოლს და დაამატეთ "fileSize: Double" ფროფერთი.
//  გამოიყენეთ "extension", რომ დაამატოთ "printDetails()" მეთოდი, რომელიც დაბეჭდავს ელექტრონული წიგნის დეტალებს.
//  შექმენით მინიმუმ 2 "EBook" ობიექტი და გამოიძახეთ "printDetails()" მეთოდი თითოეულისთვის.


struct Ebook: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var fileSize: Double
    
    func read() {
        print("")
    }
}

extension Ebook {
    func printDetails() {
        print("წიგნის სახელი - \(self.title), გამოშვების წელი - \(self.publicationYear), ავტორი - \(self.author), კითხვის სირთულე - \(self.readingLevel)")
    }
}

var ebook1 = Ebook(title: "ebook1", author: "ebookAuthor1", publicationYear: 2003, readingLevel: .advanced, fileSize: 20)
var ebook2 = Ebook(title: "ebook2", author: "ebookAuthor2", publicationYear: 2004, readingLevel: .advanced, fileSize: 30)

ebook1.printDetails()
ebook2.printDetails()





//11. შექმენით ჯენერიკ ფუნქცია "findMostFrequent<T: Hashable>(_ array: [T]) -> T?", რომელიც იპოვის და დააბრუნებს მასივში ყველაზე ხშირად გამეორებულ ელემენტს. თუ რამდენიმე ელემენტი თანაბრად ხშირად მეორდება, დააბრუნეთ პირველი მათგანი.


func findMostFrequent<T: Hashable>(_ array: [T]) -> T? {
    
    let frequencyDict = array.reduce(into: [T: Int]()) { result, element in
        result[element, default: 0] += 1
    }
    return frequencyDict.max(by: { $0.value < $1.value })?.key
}


let array = [1, 2, 2, 2, 2, 3, 3, 3, 5, 5, 5]

findMostFrequent(array)



//12. შექმენით მასივი, რომელიც შეიცავს ყველა წიგნის ავტორს მე-7 დავალებაში შექმნილი ბიბლიოთეკიდან.
//გამოიძახეთ "findMostFrequent" ფუნქცია ამ მასივზე, რათა იპოვოთ ყველაზე პოპულარული ავტორი.
//დაბეჭდეთ შედეგი: "ბიბლიოთეკაში ყველაზე პოპულარული ავტორი არის: [ავტორის სახელი]".



