import SwiftUI

struct ContributorListView: View {
    @ObservedObject var viewModel: ContributorListViewModel
    var body: some View {
        List {
            ForEach(viewModel.contributors) { item in
                ContributorItemRowView(item: item)
            }
        }
        .navigationBarTitle(Text("Contributors"), displayMode: .inline)
    }
}
