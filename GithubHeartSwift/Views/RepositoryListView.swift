import SwiftUI

struct RepositoryListView: View {
    var items: [RepositoryItem]
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text(item.name)
                }
            }
            .navigationBarTitle("Repository List")
        }
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
