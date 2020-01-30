import SwiftUI

struct ContributorItem: Codable, Equatable {
    var login: String
    var avatar_url: String
    var contributions: Int
}
