import SwiftUI

struct RepositoryListView: View {
    @ObservedObject private var viewModel = RepositoryListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repositories) { item in
                    RepositoryItemRowView(item: item)
                }
                Text("loading...")
                    .font(.callout)
                    .italic()
                    .onAppear { self.viewModel.loadNextPage() }
            }
            .navigationBarTitle("Repository List")
        }
    }

    init() {
        // Workaround
        // Because UITableView is behind SwiftUI List
        // We need to remove separators below the list
        UITableView.appearance().tableFooterView = UIView()
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
