//
//  WithSRP.swift
//  SOLID
//
//  Created by Gio Kakaladze on 13.11.24.
//

//მოცემულ კოდში დაცულია SRP პრინციპი. თითოეული კლასს გააჩნია თავისი კონკრეტული დანიშნულება რომელიც არ ეხება სხვა კლასებს.თუ რაიმე ცვლილება უნდა განხორციელდეს ერთ ფუნქციონალში (მაგალითად, ფილმის ამოშლა ფავორიტებიდან), ამისთვის მხოლოდ კონკრეტული კლასი უნდა შეიცვალოს, რაც უზრუნველყოფს მოდულარული კოდის შენარჩუნებას. ასე რომ, კოდის ყველა ნაწილი ცალ-ცალკე პასუხისმგებელია თავის კონკრეტულ ფუნქციაზე, რაც SRP-ის სრულიად დაცვას ნიშნავს.

class WatchlistManager {
    private var watchlist: [String] = []
    
    func addToWatchlist(movie: String) {
        watchlist.append(movie)
        print("\(movie) added to watchlist")
    }
    
    func getWatchlist() -> [String] {
        return watchlist
    }
}

class RatingServiceManagr {
    private var ratings: [String: Double] = [:]
    
    func rateMovie(movie: String, rating: Double) {
        ratings[movie] = rating
        print("Rated \(movie) with \(rating) stars")
    }
    
    func getMovieRating(movie: String) -> Double? {
        return ratings[movie]
    }
}

class FavoritesManager {
    private var favoriteMovies: [String] = []
    
    func addToFavMovies(movie: String) {
        favoriteMovies.append(movie)
    }
    
    func getFavMovies() -> [String] {
        return favoriteMovies
    }
}
