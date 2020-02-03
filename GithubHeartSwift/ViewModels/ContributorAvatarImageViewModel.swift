import Foundation
import UIKit

class ContributorAvatarImageViewModel: ObservableObject {
    @Published var image = UIImage(systemName: "photo")! //

    func load(with urlString: String) {
        if let url = URL(string: urlString) {
            UIImage.load(from: url) { [weak self] result in
                switch result {
                case .success(let uiImage): self?.image = uiImage
                case .failure(let error): print(error)
                }
            }
        }
    }
}
