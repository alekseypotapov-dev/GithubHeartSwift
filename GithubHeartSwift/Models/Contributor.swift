import SwiftUI

struct ContributorItem: Codable, Hashable, Identifiable {
    var id: Int
    var login: String
    var avatar_url: String
    var contributions: Int
}
