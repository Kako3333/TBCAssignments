//
//  WithoutOCP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული MovieManager1 კლასი არღვევს OCP პრინციპს, რადგან არ არის დახურული ცვლილებებისთვის. OCP-ის მიხედვით, კლასი უნდა იყოს ისეთი, რომ მისი ფუნქციონალობის გაფართოება მოხდეს მისი ცვლილების გარეშე. თუმცა ამ კლასში თუ ახალი ფილმის ჟანრის ფილტრციის დამატება მოგვინდება (მაგალითად ჰორორი), ჩვენ დაგვჭირდება filterMovies-ის ცვლილება და ახალი else-if-ის დამატება რაც დაარღვევს ocp-ის.

class MovieManager1 {
    private var movies: [String: String] = [:]
    
    func addMovie(title: String, genre: String) {
        movies[title] = genre
    }
    
    func filterMovies(filterType: String) -> [String] {
        var filteredMovies: [String] = []
        
        if filterType == "action" {
            filteredMovies = movies.filter { $0.value == "action" }.map { $0.key }
        } else if filterType == "comedy" {
            filteredMovies = movies.filter { $0.value == "comedy" }.map { $0.key }
        } else if filterType == "drama" {
            filteredMovies = movies.filter { $0.value == "drama" }.map { $0.key }
        } else {
            print("no filter")
        }
        return filteredMovies
    }
}
