import SwiftUI

struct RepositoryDetailView: View {
    var repository: RepositoryItem
    var body: some View {
        List {
            Text(repository.full_name)
                .font(.headline)
            Text("Description: \(repository.description)")
                .font(.callout)
            Text("Stars: \(repository.stargazers_count)")
                .font(.callout)
            Text("Size: \(repository.size / 1024) MB")
                .font(.callout)
            NavigationLink(destination: ContributorListView(viewModel: ContributorListViewModel(urlString: repository.contributors_url))) {
                Text("Contributors")
                    .font(.callout)
            }
        }
        .navigationBarTitle(Text(repository.name), displayMode: .inline)
    }
}
