import SwiftUI

struct RepositoryDetailView: View {
    var item: RepositoryItem
    var body: some View {
        List {
            Text(item.full_name)
                .font(.headline)
            Text("Description: \(item.description)")
                .font(.callout)
            Text("Stars: \(item.stargazers_count)")
                .font(.callout)
            NavigationLink(destination: ContributorListView(items: contributors)) {
                Text("Contributors")
                    .font(.callout)
            }
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

let contributors = try! decoder.decode([ContributorItem].self, from: contributorListJsonData())

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(item: reps.first!)
    }
}
