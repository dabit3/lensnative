// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == LensAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == LensAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == LensAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == LensAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return LensAPI.Objects.Query
    case "PaginatedPublicationResult": return LensAPI.Objects.PaginatedPublicationResult
    case "Post": return LensAPI.Objects.Post
    case "Comment": return LensAPI.Objects.Comment
    case "Mirror": return LensAPI.Objects.Mirror
    case "MetadataOutput": return LensAPI.Objects.MetadataOutput
    case "MediaSet": return LensAPI.Objects.MediaSet
    case "Media": return LensAPI.Objects.Media
    case "ExplorePublicationResult": return LensAPI.Objects.ExplorePublicationResult
    case "Profile": return LensAPI.Objects.Profile
    case "NftImage": return LensAPI.Objects.NftImage
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
