//import Foundation
//import SwiftUI
//
//struct apitestView: View {
//    @State private var articles: [Article] = []
//        
//    var body: some View {
//        VStack {
//            if !articles.isEmpty {
//                Text("JSON Data:")
//                    .font(.headline)
//                List(articles, id: \.title) { article in
//                    VStack(alignment: .leading) {
//                        Text(article.title)
//                            .font(.title)
//                        Text(article.description ?? "")
//                            .font(.subheadline)
//                        Text(article.publishedAt)
//                            .font(.subheadline)
//                    }
//                }
//            } else {
//                Text("Loading JSON data...")
//                    .font(.headline)
//                    .onAppear {
//                        fetchData()
//                    }
//            }
//        }
//    }
//        
//    func fetchData() {
//        let openfda = "menstruation+food+medicine"
//        let fdaKey = "XLjqSuh524pcubw3I5Y5utdkPgfQ1fnpzUiDwxgk"
//        
//        
//        guard let url2 = URL(string: "https://api.fda.gov/drug/event.json?api_key=\(fdaKey)&search=\(openfda)") else { return }
//        
//        
//        URLSession.shared.dataTask(with: url2) { (data, _, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let data = data {
//                let jsonString = String(data: data, encoding: .utf8)
//                print(jsonString)
//            }
//
//        }.resume()
//    }
//}
//
//struct apitestView_Previews: PreviewProvider {
//    static var previews: some View {
//        apitestView()
//    }
//}
//
//struct ApiResponse: Decodable {
//    let articles: [Article]
//}
//
//
//struct Article: Decodable {
//    let title: String
//    let description: String?
//    let url: String
//    let urlToImage: String?
//    let publishedAt: String
//}
//
