import SwiftUI

struct ContributorListView: View {
    var items: [ContributorItem]
    var body: some View {
        List {
            ForEach(items) { item in
                ContributorItemRowView(item: item)
            }
        }
        .navigationBarTitle(Text("Contributors"), displayMode: .inline)
    }
}
