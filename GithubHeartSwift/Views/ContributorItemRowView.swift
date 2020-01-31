import SwiftUI

struct ContributorItemRowView: View {
    var item: ContributorItem
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.login)
                .font(.headline)
                .bold()
            Text("Contributions: \(item.contributions)")
                .font(.callout)
                .italic()
        }
    }
}
