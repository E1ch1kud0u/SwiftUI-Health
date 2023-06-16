//
//  infoView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import SwiftUI

struct InfoView: View {
    @State var articles = [Article]()
    
    
    var body: some View {
        NavigationView {
            
            List(articles) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            
            
            
            .navigationBarTitle("Top Headlines")
        }
        .onAppear {
            NewsAPI().fetchNews { articles in
                self.articles = articles
                for article in articles {
                    
                }
            }
        }
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

