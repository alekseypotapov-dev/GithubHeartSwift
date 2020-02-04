import Foundation

class RepositoryListViewModel: ObservableObject {
    let networkService = NetworkService()
    let mappingService = MappingService()
    var currentPage = 0
    @Published var repositories: [RepositoryItem] = []
    @Published var shouldShowError: Bool = false
    @Published var errorMessage: String = ""

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
                case .failure(let error):
                    switch error {
                    case .decodeIssue:
                        self?.errorMessage = "Scroll the table down and up again" // github's api rate limit reached
                    default:
                        self?.errorMessage = "Unknown"
                    }
                    self?.shouldShowError = true
                default: break
                }
            case .failure(let error): print(error)
            }
        }
    }
}
