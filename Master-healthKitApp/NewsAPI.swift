//
//  NewsAPI.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import Foundation

class NewsAPI {
    let apiKey = "f7c46a254bc04e2f945d28ff807477af" // ここにあなたのAPIキーを入力してください
    
    func fetchNews(completion: @escaping ([Article]) -> ()) {
        print("fetchNews called")

        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=\(apiKey)") else { return }
        
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


