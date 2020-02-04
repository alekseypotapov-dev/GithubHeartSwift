import Foundation

class RepositoryListViewModel: ObservableObject {
    let networkService = NetworkService()
    let mappingService = MappingService()
    var currentPage = 0
    @Published var repositories: [RepositoryItem] = []

    // due to github's rate limit this could show not concrete page.
    // but it will take the next one
    func loadNextPage() {
        currentPage += 1
        loadPage(number: currentPage)
    }

    private func loadPage(number: Int) {
        networkService.requestRepository(page: number) { [weak self] result in
            switch result {
            case .success(let data):
                let mappingResult = self?.mappingService.mapRepositoriesJSON(data: data)
                switch mappingResult {
                case .success(let repositories): self?.repositories.append(contentsOf: repositories)
                case .failure(let error): print(error)
                default: break
                }
            case .failure(let error): print(error)
            }
        }
    }
}
