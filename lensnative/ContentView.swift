//
//  ContentView.swift
//  lensnative
//
//  Created by Nader Dabit on 10/19/23.
//

import SwiftUI
import Apollo
import LensAPI

let apollo = ApolloClient(url: URL(string: "https://api.lens.dev")!)

struct ContentView: View {
    @State var posts: [ExploreQuery.Data.ExplorePublications.Item.AsPost] = []

    func fetchPosts() {
         apollo.fetch(query: ExploreQuery()) { result in
             switch result {
             case .success(let graphQLResult):
                 if let posts = graphQLResult.data?.explorePublications.items {
                     self.posts = posts.compactMap { $0.asPost }
                 }
             case .failure(let error):
                 print("Error fetching posts: \(error)")
             }

         }
     }
    
    var body: some View {
        NavigationView {
            List(posts, id: \.id) { post in
                NavigationLink(destination: PublicationView(
                    post: post
                )) {
                    VStack(
                        alignment: .leading
                    ) {
                        if let urlString = post.profile.picture?.asMediaSet?.original.url,
                           let url = URL(string: urlString) {
                            AsyncImage(
                                url: url
                            )
                            { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable().frame(width: 80, height: 80)
                                        .aspectRatio(contentMode: .fill).clipShape(Circle())
                                        .padding(.vertical, 15)
                                    
                                case .failure:
                                    EmptyView()
                                case .empty:
                                    ProgressView()
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            EmptyView()
                        }
                        Text("@" + post.profile.handle)
                            .foregroundColor(Color(.sRGB, white: 0.5, opacity: 1.0))
                            .fontWeight(.medium)
                        
                        Text(post.metadata.content ?? "")
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        if let image = post.metadata.image,
                           !image.contains("phaver"),
                           post.metadata.media.count < 1,
                           post.metadata.image != nil {
                            if let urlString = post.metadata.image, let url = URL(string: urlString) {
                                AsyncImage(
                                    url: url
                                )
                                { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable().frame(width: 300, height: 300)
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    case .failure:
                                        Image("placeholder") // Replace with your placeholder image
                                    case .empty:
                                        EmptyView() // or some placeholder content
                                    @unknown default:
                                        EmptyView() // Fallback for any unhandled cases
                                    }
                                }
                            } else {
                                EmptyView()
                            }
                        }
                        if (post.metadata.media.count > 0) {
                            let urlString = post.metadata.media[0].original.url
                            if  let url = URL(string: urlString) {
                                AsyncImage(
                                    url: url
                                )
                                { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable().frame(width: 300, height: 300)
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    case .failure:
                                        Image("placeholder") // Replace with your placeholder image
                                    case .empty:
                                        EmptyView() // or some placeholder content
                                    @unknown default:
                                        EmptyView() // Fallback for any unhandled cases
                                    }
                                }
                            } else {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            .onAppear {
                fetchPosts()
            }
            .navigationTitle("Publications")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
