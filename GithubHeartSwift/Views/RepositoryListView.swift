import SwiftUI

struct RepositoryListView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Preview1")
                Text("Preview2")
            }
            .navigationBarTitle("Repository List")
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
