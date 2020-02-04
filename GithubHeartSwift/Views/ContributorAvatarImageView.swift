import SwiftUI

struct ContributorAvatarImageView: View {
    @ObservedObject private var viewModel = ContributorAvatarImageViewModel()

    init(urlString: String) {
        viewModel.load(with: urlString)
    }

    var body: some View {
        Image(uiImage: viewModel.image)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height:50)
            .clipShape(Circle())
    }
}
