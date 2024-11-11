//
//  NewsFeedViewModel..swift
//  Assignment19
//
//  Created by Gio Kakaladze on 30.10.24.
//
import UIKit
import Networking

final class NewsFeedViewModel: NetworkManagerProtocol {
    
    let pageCountConstant = 10
    var pageNumber = 1
    private let networkManager: NetworkManagerProtocol
    
    private(set) var news: [NewsModel] = []
    
    var newsCount: Int {
        return news.count
    }
    
    func article(at index: Int) -> NewsModel {
        return news[index]
    }
    
    init(networkManager: NetworkManagerProtocol = NetworkingManager()) {
        self.networkManager = networkManager
    }
    
    func checkForAdditionalNewsFeed(completion: @escaping () -> Void) {
        guard pageNumber * pageCountConstant <= newsCount else { return }
        pageNumber += 1
        fetchNewsData(pageNumber: pageNumber) { newsResponseData in
            completion()
        }
    }
    
    func fetchNewsData(pageNumber: Int, completion: @escaping (Networking.NewsResponseData) -> Void) {
        networkManager.fetchNewsData(pageNumber: pageNumber) { [weak self] newsResponseData in
            self?.news.append(contentsOf: newsResponseData.articles)
            completion(newsResponseData)
        }
    }
}

