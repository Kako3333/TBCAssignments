//
//  WithOCP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემული კოდი იცავს OCP პრინციპს, რადგან ის გახსნილია გაფართოებისთვის, მაგრამ დახურულია ცვლილებებისთვის. ამ კოდში, ფილტრაციის ფუნქციონალი მიწერია ცალკე კლასებში, რომლებიც იღებენ MovieFilter პროტოკოლს და თუ მოგვინდება ახალი ჟანრის ფილტრის დამატება უბრალოდ შევქმნით ახალ კლასს და მივაღებინებთ MovieFilter პროტოკოლს და დავწერთ ფუნქციას იმავე კლასში. ამგვარად, OCP პრინციპი არ ირღვევა, რადგან კლასების გაფართოება ხდება ახალი ფუნქციონალის დამატებით, ხოლო ძველი კოდი უცვლელი რჩება, ეს კი გვაძლევს ნაკლებად კომპლექსურ კოდს.

protocol MovieFilter {
    func filter(movies: [String: String]) -> [String]
}

class ActionMovieFilter: MovieFilter {
    func filter(movies: [String: String]) -> [String] {
        return movies.filter { $0.value == "action" }.map { $0.key }
    }
}

class ComedyMovieFilter: MovieFilter {
    func filter(movies: [String: String]) -> [String] {
        return movies.filter { $0.value == "comedy" }.map { $0.key }
    }
}

class DramaMovieFilter: MovieFilter {
    func filter(movies: [String: String]) -> [String] {
        return movies.filter { $0.value == "drama" }.map { $0.key }
    }
}

// დავამატეთ ფუნქციონალი ისე რომ არ შევეხეთ სხვა კოდს.
class HorrorMovieFilter: MovieFilter {
    func filter(movies: [String: String]) -> [String] {
        return movies.filter { $0.value == "horror" }.map { $0.key }
    }
}

class MovieManager2 {
    private var movies: [String: String] = [:]
    
    func addMovie(title: String, genre: String) {
        movies[title] = genre
    }
    
    func filterMovies(filter: MovieFilter) -> [String] {
        return filter.filter(movies: movies)
    }
}

func exampleOCP() {
    let movieManager2 = MovieManager2()
    movieManager2.addMovie(title: "Batman", genre: "action")
    movieManager2.addMovie(title: "Spiderman", genre: "action")
    movieManager2.addMovie(title: "ArviciMetifilmi", genre: "drama")
    let actionFilter = ActionMovieFilter()
    let actionMovies = movieManager2.filterMovies(filter: actionFilter)
    print(actionMovies)
}

