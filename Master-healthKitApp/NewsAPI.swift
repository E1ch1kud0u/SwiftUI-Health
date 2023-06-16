//
//  NewsAPI.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import Foundation

class NewsAPI {
    let fdaKey = "XLjqSuh524pcubw3I5Y5utdkPgfQ1fnpzUiDwxgk" // ここにあなたのAPIキーを入力してください
    let openfda = "menstruation+"
    let medplus = "menstruation+"
    
    func fetchArticles(completion: @escaping ([Article]) -> ()) {
        print("fetchArticle called")

        guard let url1 = URL(string: "https://api.fda.gov/drug/event.json?api_key=\(fdaKey)&search=\(openfda)") else { return }
        guard let url2 = URL(string: "https://wsearch.nlm.nih.gov/ws/query?db=healthTopics&term=\(medplus)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let articles = try JSONDecoder().decode(NewsApiResponse.self, from: data).articles
                completion(articles)
            } catch let error {
                print("Failed to decode JSON: ", error)
                print("œ")
            }
        }.resume()
    }
}

struct NewsApiResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}


