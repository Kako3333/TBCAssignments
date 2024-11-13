//
//  withoutSRP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

// მოცემული MovieManager კლასი არ შეესაბამება SOLID პრინციპების SRP პრინციპს, რადგან SRP-ის მიხედვით კლასს უნდა ჰქონდეს 1 ფუნქცია და მოვალეობა, ხოლო მოცემულ კლასს აქვს უამრავი და ის ცდილობს მართოს თავისი სამივე ფროფერთი მოცემული ფუნქციებით. ასევე თუ მოგვინდება კონკრეტული ფუნქციონალის შეცვლა(თუნდაც გავხადოთ rating Int და აღარ გვქონდეს Double) უნდა შევცვალოთ ყველაფერი ამ კლასში სადაც rating არის გამოყენებული. ეს ჩვენ არ უნდა გვიწევდეს და თითოეული ფუნქცია უნდა იყოს დამოუკიდებელი.


class MovieManager {
    private var watchlist: [String] = []
    private var ratings: [String: Double] = [:]
    private var favoriteMovies: [String] = []
    
    func addToWatchlist(movie: String) {
        watchlist.append(movie)
        print("\(movie) added to watchlist")
    }
    
    func getWatchlist() -> [String] {
        return watchlist
    }
    
    func rateMovie(movie: String, rating: Double) {
        ratings[movie] = rating
        print("Rated \(movie) with \(rating) stars")
    }
    
    func getMovieRating(movie: String) -> Double? {
        return ratings[movie]
    }
    
    func addToFavMovies(movie: String) {
        favoriteMovies.append(movie)
    }
    
    func getFavMovies() -> [String] {
        return favoriteMovies
    }
}

// არ არის მგონი ეს საჭირო მაგრამ იყოს მაინც აღარ წავშლი ;დ
func example() {
    let movieManager = MovieManager()
    
    movieManager.addToWatchlist(movie: "Spiderman")
    movieManager.addToWatchlist(movie: "Batman")
    
    let watchlist = movieManager.getWatchlist()
    print("Watchlist: \(watchlist)")
    
    movieManager.rateMovie(movie: "Spiderman", rating: 8.5)
    movieManager.rateMovie(movie: "Batman", rating: 9.0)
    
    if let spidermanRating = movieManager.getMovieRating(movie: "Spiderman") {
        print("Rating for Spiderman: \(spidermanRating) stars")
    }
    
    if let batmanRating = movieManager.getMovieRating(movie: "Batman") {
        print("Rating for Batman: \(batmanRating) stars")
    }
    
    movieManager.addToFavMovies(movie: "Spiderman")
    movieManager.addToFavMovies(movie: "Batman")
    
    let favoriteMovies = movieManager.getFavMovies()
    print("Favorite Movies: \(favoriteMovies)")
}



