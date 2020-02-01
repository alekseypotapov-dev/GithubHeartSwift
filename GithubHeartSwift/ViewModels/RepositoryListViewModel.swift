import Foundation
protocol RepositoryListViewModelProtocol {
    func updateList()
}

class RepositoryListViewModel {
    let networkService = NetworkService()
    let mappingService = MappingService()
    var delegate: RepositoryListViewModelProtocol?
    var repositories: [RepositoryItem] = [] {
        didSet {
            self.delegate?.updateList()
        }
    }

    func loadPage(number: Int) {
        networkService.requestRepository(page: 1) { [weak self] result in
            switch result{
            case .success(let data):
                let mappingResult = self?.mappingService.mapRepositoriesJSON(data: data)
                switch mappingResult {
                case .success(let repositories): self?.repositories = repositories
                case .failure(_): print("error")
                default: break
                }
            case .failure(_): print("error")
            }
        }
    }
}
