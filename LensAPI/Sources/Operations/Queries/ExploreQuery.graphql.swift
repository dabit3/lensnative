// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ExploreQuery: GraphQLQuery {
  public static let operationName: String = "explore"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query explore { explorePublications( request: {sortCriteria: TOP_COMMENTED, publicationTypes: POST} ) { __typename items { __typename ... on Post { id metadata { __typename content image media { __typename original { __typename url } } } profile { __typename id handle name picture { __typename ... on MediaSet { original { __typename url } } } } } } } }"#
    ))

  public init() {}

  public struct Data: LensAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("explorePublications", ExplorePublications.self, arguments: ["request": [
        "sortCriteria": "TOP_COMMENTED",
        "publicationTypes": "POST"
      ]]),
    ] }

    public var explorePublications: ExplorePublications { __data["explorePublications"] }

    /// ExplorePublications
    ///
    /// Parent Type: `ExplorePublicationResult`
    public struct ExplorePublications: LensAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.ExplorePublicationResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", [Item].self),
      ] }

      public var items: [Item] { __data["items"] }

      /// ExplorePublications.Item
      ///
      /// Parent Type: `Publication`
      public struct Item: LensAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { LensAPI.Unions.Publication }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsPost.self),
        ] }

        public var asPost: AsPost? { _asInlineFragment() }

        /// ExplorePublications.Item.AsPost
        ///
        /// Parent Type: `Post`
        public struct AsPost: LensAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = ExploreQuery.Data.ExplorePublications.Item
          public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Post }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", LensAPI.InternalPublicationId.self),
            .field("metadata", Metadata.self),
            .field("profile", Profile.self),
          ] }

          /// The internal publication id
          public var id: LensAPI.InternalPublicationId { __data["id"] }
          /// The metadata for the post
          public var metadata: Metadata { __data["metadata"] }
          /// The profile ref
          public var profile: Profile { __data["profile"] }

          /// ExplorePublications.Item.AsPost.Metadata
          ///
          /// Parent Type: `MetadataOutput`
          public struct Metadata: LensAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.MetadataOutput }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("content", LensAPI.Markdown?.self),
              .field("image", LensAPI.Url?.self),
              .field("media", [Medium].self),
            ] }

            /// This is the metadata content for the publication, should be markdown
            public var content: LensAPI.Markdown? { __data["content"] }
            /// This is the image attached to the metadata and the property used to show the NFT!
            public var image: LensAPI.Url? { __data["image"] }
            /// The images/audios/videos for the publication
            public var media: [Medium] { __data["media"] }

            /// ExplorePublications.Item.AsPost.Metadata.Medium
            ///
            /// Parent Type: `MediaSet`
            public struct Medium: LensAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.MediaSet }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("original", Original.self),
              ] }

              /// On-chain or snapshotted media on a CDN
              public var original: Original { __data["original"] }

              /// ExplorePublications.Item.AsPost.Metadata.Medium.Original
              ///
              /// Parent Type: `Media`
              public struct Original: LensAPI.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Media }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("url", LensAPI.Url.self),
                ] }

                /// The token image nft
                public var url: LensAPI.Url { __data["url"] }
              }
            }
          }

          /// ExplorePublications.Item.AsPost.Profile
          ///
          /// Parent Type: `Profile`
          public struct Profile: LensAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Profile }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", LensAPI.ProfileId.self),
              .field("handle", LensAPI.Handle.self),
              .field("name", String?.self),
              .field("picture", Picture?.self),
            ] }

            /// The profile id
            public var id: LensAPI.ProfileId { __data["id"] }
            /// The profile handle
            public var handle: LensAPI.Handle { __data["handle"] }
            /// Name of the profile
            public var name: String? { __data["name"] }
            /// The picture for the profile
            public var picture: Picture? { __data["picture"] }

            /// ExplorePublications.Item.AsPost.Profile.Picture
            ///
            /// Parent Type: `ProfileMedia`
            public struct Picture: LensAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { LensAPI.Unions.ProfileMedia }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .inlineFragment(AsMediaSet.self),
              ] }

              public var asMediaSet: AsMediaSet? { _asInlineFragment() }

              /// ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet
              ///
              /// Parent Type: `MediaSet`
              public struct AsMediaSet: LensAPI.InlineFragment {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public typealias RootEntityType = ExploreQuery.Data.ExplorePublications.Item.AsPost.Profile.Picture
                public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.MediaSet }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("original", Original.self),
                ] }

                /// On-chain or snapshotted media on a CDN
                public var original: Original { __data["original"] }

                /// ExplorePublications.Item.AsPost.Profile.Picture.AsMediaSet.Original
                ///
                /// Parent Type: `Media`
                public struct Original: LensAPI.SelectionSet {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Media }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("url", LensAPI.Url.self),
                  ] }

                  /// The token image nft
                  public var url: LensAPI.Url { __data["url"] }
                }
              }
            }
          }
        }
      }
    }
  }
}
