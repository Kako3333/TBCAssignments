
import UIKit

public protocol NetworkManagerProtocol {
    func fetchNewsData(pageNumber: Int, completion: @escaping (NewsResponseData) -> Void)
}

public class NetworkingManager: NetworkManagerProtocol {
    
    let pageCountConstant = 10
    let apiKey = "4c679d26a49a4622bc4e621396fa5229"
    
    public init() {}
    
   public func fetchNewsData(pageNumber: Int = 1, completion: @escaping (NewsResponseData) -> Void) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&pageSize=\(pageCountConstant)&page=\(pageNumber)&sortBy=publishedAt&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
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
                
                DispatchQueue.main.async {
                    completion(newsResponseData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}

