import SwiftUI

struct RepositoryItemRowView: View {
    var item: RepositoryItem
    var body: some View {
        NavigationLink(destination: RepositoryDetailView(item: item)) {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .bold()
                Text(item.full_name)
                    .font(.callout)
                    .italic()
            }
        }
    }
}

