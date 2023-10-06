import SwiftUI

struct InfoView: View {
    @State private var articles: [ArticleJson] = []

    var body: some View {
        NavigationView {
            List(articles, id: \.title) { article in
                VStack(alignment: .leading) {
                    Text(article.title ?? "No title")
                        .font(.headline)
                    if let imageURL = article.urlToImage,
                       let url = URL(string: imageURL.absoluteString) {
                        AsyncImage(url: url)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                    }
                }
            }
            .navigationTitle("News Articles")
            .onAppear {
                fetchNews()
            }
        }
    }

    func fetchNews() {
        let newsAPI = NewsAPI()
        newsAPI.fetchNews(keyword: "technology") { articles in
            self.articles = articles
        }
    }
}

