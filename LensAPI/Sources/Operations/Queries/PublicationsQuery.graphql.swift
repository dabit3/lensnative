// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PublicationsQuery: GraphQLQuery {
  public static let operationName: String = "publications"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query publications($profileId: ProfileId!) { publications(request: {publicationTypes: [POST], profileId: $profileId}) { __typename items { __typename ... on Post { id metadata { __typename content image media { __typename original { __typename url } } } } } } }"#
    ))

  public var profileId: ProfileId

  public init(profileId: ProfileId) {
    self.profileId = profileId
  }

  public var __variables: Variables? { ["profileId": profileId] }

  public struct Data: LensAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("publications", Publications.self, arguments: ["request": [
        "publicationTypes": ["POST"],
        "profileId": .variable("profileId")
      ]]),
    ] }

    public var publications: Publications { __data["publications"] }

    /// Publications
    ///
    /// Parent Type: `PaginatedPublicationResult`
    public struct Publications: LensAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.PaginatedPublicationResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", [Item].self),
      ] }

      public var items: [Item] { __data["items"] }

      /// Publications.Item
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

        /// Publications.Item.AsPost
        ///
        /// Parent Type: `Post`
        public struct AsPost: LensAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = PublicationsQuery.Data.Publications.Item
          public static var __parentType: ApolloAPI.ParentType { LensAPI.Objects.Post }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", LensAPI.InternalPublicationId.self),
            .field("metadata", Metadata.self),
          ] }

          /// The internal publication id
          public var id: LensAPI.InternalPublicationId { __data["id"] }
          /// The metadata for the post
          public var metadata: Metadata { __data["metadata"] }

          /// Publications.Item.AsPost.Metadata
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

            /// Publications.Item.AsPost.Metadata.Medium
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

              /// Publications.Item.AsPost.Metadata.Medium.Original
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
