import Foundation
import UIKit

class ContributorAvatarImageViewModel: ObservableObject {
    let networkService = NetworkService()
    @Published var image = UIImage(systemName: "photo")! // if this will be marked as Optional, then we more likely will get an error: "Function declares an opaque return type, but the return statements in its body do not have matching underlying types", so for now it was left using Force Unwrapping

    func load(with urlString: String) {
        networkService.makeDataTaskRequest(with: urlString) { [weak self] result in
            switch result {
            case .success(let data):
                if let uiImage = UIImage(data: data) {
                    self?.image = uiImage
                }
            case .failure(let error): print(error)
            }
        }
    }
}
