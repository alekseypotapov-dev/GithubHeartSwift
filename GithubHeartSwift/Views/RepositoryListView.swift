import SwiftUI

struct RepositoryListView: View, RepositoryListViewModelProtocol {
    let viewModel = RepositoryListViewModel()
    var items: [RepositoryItem]
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    RepositoryItemRowView(item: item)
                }
            }
            .navigationBarTitle("Repository List")
        }
    }

    func updateList() {
        self.items = viewModel.repositories
    }

    init(items: [RepositoryItem]) {
        viewModel.loadPage(number: 1)
        self.items = []
        
        // Workaround
        // Because UITableView is behind SwiftUI List
        // We need to remove separators below the list
        UITableView.appearance().tableFooterView = UIView()
    }
}

let decoder = JSONDecoder()
let repositories = try! decoder.decode(RepositoriesItem.self, from: repositoryListJsonData())
let reps = repositories.items

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(items: reps)
    }
}
