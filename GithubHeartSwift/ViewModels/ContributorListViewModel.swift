import Foundation

class ContributorListViewModel: ObservableObject {
    let networkService = NetworkService()
    let mappingService = MappingService()
    @Published var contributors: [ContributorItem] = []

    func load(with urlString: String) {
        networkService.requestContributors(stringUrl: urlString) { [weak self] result in
            switch result {
            case .success(let data):
                let mappingResult = self?.mappingService.mapContributorsJSON(data: data)
                switch mappingResult {
                case .success(let contributors): self?.contributors = contributors
                case .failure(let error): print(error)
                default: break
                }
            case .failure(let error): print(error)
            }
        }
    }
}
