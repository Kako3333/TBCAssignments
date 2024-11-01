//
//  NewsFeedViewModel..swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//
import UIKit

final class NewsFeedViewModel {
    
    let pageCountConstant = 10
    var pageNumber = 1
    
    private(set) var news: [NewsModel] = []
    let apiKey = "4c679d26a49a4622bc4e621396fa5229"
    
    var newsCount: Int {
        return news.count
    }
    
    func article(at index: Int) -> NewsModel {
        return news[index]
    }
    
    init() {}
    
    func checkForAdditionalNewsFeed(completion: @escaping () -> Void) {
        guard pageNumber * pageCountConstant <= newsCount else { return }
        pageNumber += 1
        fetchNewsData(pageNumber: pageNumber, completion: completion)
    }
    
    func fetchNewsData(pageNumber: Int = 1, completion: @escaping () -> Void) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&pageSize=\(pageCountConstant)&page=\(pageNumber)&sortBy=publishedAt&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let newsResponseData = try decoder.decode(NewsResponseData.self, from: data)
                self?.news.append(contentsOf: newsResponseData.articles)
                
                for article in self?.news ?? [] {
                    print("Author: \(article.author ?? "xxx")")
                }
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
