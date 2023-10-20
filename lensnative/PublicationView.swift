//
//  PublicationView.swift
//  lensnative
//
//  Created by Nader Dabit on 10/20/23.
//

import SwiftUI
import Apollo
import LensAPI

struct PublicationView: View {
    let post: ExploreQuery.Data.ExplorePublications.Item.AsPost
    @State var fetchedPosts: [PublicationsQuery.Data.Publications.Item.AsPost] = []
    
    func fetchProfile() {
        apollo.fetch(query: PublicationsQuery(profileId: post.profile.id)) { result in
             switch result {
             case .success(let graphQLResult):
                 if let posts = graphQLResult.data?.publications.items {
                     self.fetchedPosts = posts.compactMap { $0.asPost }
                 }
             case .failure(let error):
                 print("Error fetching posts: \(error)")
             }

         }
     }
    
    var body: some View {
        VStack {
            if let urlString = post.profile.picture?.asMediaSet?.original.url,
               let url = URL(string: urlString) {
                AsyncImage(
                    url: url
                )
                { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable().frame(width: 100, height: 100)
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
                .fontWeight(.semibold)
            List(fetchedPosts, id: \.id) { fetchedPost in
                VStack(
                    alignment: .leading
                ) {
                    HStack(spacing: 10) {
                        if let urlString = post.profile.picture?.asMediaSet?.original.url,
                           let url = URL(string: urlString) {
                            AsyncImage(
                                url: url
                            )
                            { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable().frame(width: 45, height: 45)
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
                    }
                    Text(fetchedPost.metadata.content ?? "")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    if let image = post.metadata.image,
                       !image.contains("phaver"),
                       fetchedPost.metadata.media.count < 1,
                       fetchedPost.metadata.image != nil {
                        if let urlString = fetchedPost.metadata.image, let url = URL(string: urlString) {
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
                    if (fetchedPost.metadata.media.count > 0) {
                        let urlString = fetchedPost.metadata.media[0].original.url
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
            fetchProfile()
        }
    }
}

struct PublicationView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [String: AnyHashable] = ["": ""]
        let fragments: Set<ObjectIdentifier> = []
        let dataDictInstance = DataDict(data: data, fulfilledFragments: fragments)
        let dummyPost = ExploreQuery.Data.ExplorePublications.Item.AsPost(_dataDict: dataDictInstance)
        return PublicationView(post: dummyPost)
    }
}
