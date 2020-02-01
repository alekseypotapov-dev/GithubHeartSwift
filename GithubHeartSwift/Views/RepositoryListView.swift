import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var viewModel = RepositoryListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repositories) { item in
                    RepositoryItemRowView(item: item)
                }
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

let decoder = JSONDecoder()
let repositories = try! decoder.decode(RepositoriesItem.self, from: repositoryListJsonData())
let reps = repositories.items

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
