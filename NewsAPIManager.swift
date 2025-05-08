import Foundation

class NewsAPIManager {
    private let apiKey = "ced4b8fca56c4f229f120458ce9b16cd" // Your NewsAPI key

    func fetchNews(query: String, completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        guard !query.isEmpty else {
            completion(.failure(NSError(domain: "Query cannot be empty", code: 400, userInfo: nil)))
            return
        }

        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://newsapi.org/v2/everything?q=\(encodedQuery)&sortBy=popularity&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 500, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                completion(.success(decodedResponse.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
