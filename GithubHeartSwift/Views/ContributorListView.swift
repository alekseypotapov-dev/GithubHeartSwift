import SwiftUI

struct ContributorListView: View {
    @ObservedObject private var viewModel = ContributorListViewModel()

    init(urlString: String) {
        viewModel.load(with: urlString)
    }

    var body: some View {
        List {
            ForEach(viewModel.contributors) { item in
                ContributorItemRowView(item: item)
            }
        }
        .navigationBarTitle(Text("Contributors"), displayMode: .inline)
    }
}
