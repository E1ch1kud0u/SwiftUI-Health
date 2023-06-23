//
//  infoView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import SwiftUI
import Alamofire
import Kanna

let fdaKey = "XLjqSuh524pcubw3I5Y5utdkPgfQ1fnpzUiDwxgk"

enum Tab{
    case FoodAndMedicine
    case Exercise
    case UsefulItem
}

struct InfoView: View {
    @State private var selectedTab: Tab = .foodAndMedicine
    
    var body: some View{
        TabView(selection: $selectedTab) {
            FoodAndMedicineTabView().tabItem {
                Text("食事や薬")
            }.tag(Tab.foodAndMedicine)
                        
            ExerciseTabView().tabItem {
                Text("運動")
            }.tag(Tab.exercise)
                        
            UsefulItemsTabView().tabItem {
                Text("便利グッズ")
            }.tag(Tab.usefulItems)
        }
    }
//    var body: some View {
//        NavigationView {
//
//            List(articles) { article in
//                VStack(alignment: .leading) {
//                    Text(article.title)
//                        .font(.headline)
//                    Text(article.description ?? "")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//            }
//
//
//
//
//            .navigationBarTitle("Top Headlines")
//        }
//        .onAppear {
//            NewsAPI().fetchArticles { articles in
//                self.articles = articles
//                for article in articles {
//
//                }
//            }
//        }
//    }
}

struct FoodAndMedicineTabView: View {
    @State private var foodAndMedicineData: [FoodAndMedicine] = []

    var body: some View {
        VStack {
            // APIを使用してfoodAndMedicineDataを取得するロジックを追加
            Text("生理中の食事や薬")
                .font(.title)
            
            // foodAndMedicineDataの表示や検索機能などを実装
        }
        .onAppear {
            fetchData { articles in
                self.foodAndMedicineData = articles
            }
        }
    }
    
    private func fetchData(completion: @escaping ([Article]) -> Void) {
        let openfda = "menstruation+food+medicine"
        let medplus = "menstruation+food+medicine"

        guard let url1 = URL(string: "https://api.fda.gov/drug/event.json?api_key=\(fdaKey)&search=\(openfda)") else { return }
        guard let url2 = URL(string: "https://wsearch.nlm.nih.gov/ws/query?db=healthTopics&term=\(medplus)") else { return }

        var articles: [Article] = []

        let group = DispatchGroup()
        group.enter()

        URLSession.shared.dataTask(with: url1) { (data, _, _) in
            defer { group.leave() }
            guard let data = data else { return }

            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: data)
                articles += decodedData.articles
            } catch let error {
                print("Failed to decode JSON: ", error)
            }
        }.resume()

        group.enter()

        URLSession.shared.dataTask(with: url2) { (data, _, _) in
            defer { group.leave() }
            guard let data = data else { return }

            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: data)
                articles += decodedData.articles
            } catch let error {
                print("Failed to decode JSON: ", error)
            }
        }.resume()

        group.notify(queue: .main) {
            completion(articles)
        }
    }

}

struct ExerciseTabView: View {
    @State private var exerciseData: [Exercise] = []

    var body: some View {
        VStack {
            // APIを使用してexerciseDataを取得するロジックを追加
            Text("生理中の運動")
                .font(.title)
            
            // exerciseDataの表示や検索機能などを実装
        }
        .onAppear {
            fetchData { articles in
                self.exerciseData = articles
            }
        }
    }
    
    private func fetchData(completion: @escaping ([Article]) -> Void) {
        // 生理中の運動に関するAPIを呼び出し、データを取得してexerciseDataにセットするロジックを実装
        let openfda = "menstruation+exercise"
        let medplus = "menstruation+exercise"
        // 生理中の食事や薬に関するAPIを呼び出し、データを取得してfoodAndMedicineDataにセットするロジックを実装
        print("fetchArticle called")

        guard let url1 = URL(string: "https://api.fda.gov/drug/event.json?api_key=\(fdaKey)&search=\(openfda)") else { return }
        guard let url2 = URL(string: "https://wsearch.nlm.nih.gov/ws/query?db=healthTopics&term=\(medplus)") else { return }
        
        URLSession.shared.dataTask(with: url1) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let articles = try JSONDecoder().decode(ApiResponse.self, from: data).articles
                completion(articles)
            } catch let error {
                print("Failed to decode JSON: ", error)
                print("œ")
            }
        }.resume()
        URLSession.shared.dataTask(with: url2) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let articles = try JSONDecoder().decode(ApiResponse.self, from: data).articles
                completion(articles)
            } catch let error {
                print("Failed to decode JSON: ", error)
                print("œ")
            }
        }.resume()
    }
}

struct UsefulItemsTabView: View {
    @State private var usefulItemsData: [UsefulItem] = []

    var body: some View {
        VStack {
            // APIを使用してusefulItemsDataを取得するロジックを追加
            Text("生理中の便利グッズ")
                .font(.title)
            
            // usefulItemsDataの表示や検索機能などを実装
        }
        .onAppear {
            fetchData { articles in
                self.usefulItemsData = articles
            }
        }
    }
    
    private func fetchData(completion: @escaping (String) -> Void) {
        let url = "https://www.amazon.com" // スクレイピングしたいページのURL

        AF.request(url).responseString { response in
            switch response.result {
            case .success(let html):
                parseHTML(html)
                completion(html)
            case .failure(let error):
                print("Error: \(error)")
                completion("")
            }
        }
    }
    func parseHTML(_ html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8) {
            // 特定の要素を抽出するためのXPathやCSSセレクタを使用します
            if let titleNode = doc.at_xpath("//title") {
                let pageTitle = titleNode.text // タイトル要素のテキストを取得
                print("Page Title: \(pageTitle)")
            }

            // 他の要素を取得する処理を追加します
        }
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
