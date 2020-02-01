import Foundation

class RepositoryListViewModel: ObservableObject {
    let networkService = NetworkService()
    let mappingService = MappingService()
    @Published var repositories: [RepositoryItem] = []

    init() {
        loadPage(number: 1)
    }

    func loadPage(number: Int) {
        networkService.requestRepository(page: 1) { [weak self] result in
            switch result{
            case .success(let data):
                let mappingResult = self?.mappingService.mapRepositoriesJSON(data: data)
                switch mappingResult {
                case .success(let repositories): DispatchQueue.main.async { self?.repositories = repositories }
                case .failure(let error): print(error)
                default: break
                }
            case .failure(let error): print(error)
            }
        }
    }
}
