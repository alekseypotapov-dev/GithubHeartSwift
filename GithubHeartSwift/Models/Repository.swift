import SwiftUI

struct RepositoryItem: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var full_name: String
    var description: String
    var stargazers_count: Int
    var forks_count: Int
    var contributors_url: String
    var size: Int
}
