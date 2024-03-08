import SwiftUI
import SafariServices

struct InfoView: View {
    @State private var articles: [ArticleJson] = []

    var body: some View {
        NavigationView {
            List(articles, id: \.title) { article in
                VStack(alignment: .leading) {
                    Button(action: {
                        if let url = article.url {
                            openURL(url)
                        }
                    }) {
                        Text(article.title ?? "No title")
                            .font(.headline)
                    }
                    if let imageURL = article.urlToImage,
                       let url = URL(string: imageURL.absoluteString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 100)
                                    .clipped()
                            case .failure(let error):
                                Text("Failed to load image: \(error.localizedDescription)")
                            case .empty:
                                ProgressView()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 100)
                        .cornerRadius(8)
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
        newsAPI.fetchNews(keyword: "health") { articles in
            self.articles = articles
        }
    }

    func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
