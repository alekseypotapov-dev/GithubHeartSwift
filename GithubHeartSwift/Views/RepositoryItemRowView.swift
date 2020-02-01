import SwiftUI

struct RepositoryItemRowView: View {
    var item: RepositoryItem
    var body: some View {
        NavigationLink(destination: RepositoryDetailView(repository: item)) {
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

