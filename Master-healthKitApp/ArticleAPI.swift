import Foundation

class NewsAPI {
    let apiKey = "f7c46a254bc04e2f945d28ff807477af" // ここにあなたのAPIキーを入力してください
    var articleList: [(title: String, url: URL, urlToImage: URL)] = []
    
    func fetchNews(keyword: String, completion: @escaping ([ArticleJson]) -> ()) {
        print("fetchNews called")
        guard let keyword_encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(keyword_encoded)&apiKey=\(apiKey)") else { return }
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            session.finishTasksAndInvalidate()
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("Data not found.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data)
                
                if let articles = json.articles {
                    self.articleList = articles.compactMap { article in
                        if let title = article.title, let url = article.url, let urlToImage = article.urlToImage {
                            return (title, url, urlToImage)
                        }
                        return nil
                    }
                    completion(articles)
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        })
        task.resume()
    }
}


struct ArticleJson: Codable {
    let title: String?
    let url: URL?
    let urlToImage: URL?
}
struct ResultJson: Codable {
    let articles: [ArticleJson]?
}
