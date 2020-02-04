import UIKit

struct MappingService {
    private let decoder = JSONDecoder()

    func mapRepositoriesJSON(data: Data) -> Result<[RepositoryItem], CustomError>  {
        do {
            let repositories = try decoder.decode(RepositoriesItem.self, from: data)
            return .success(repositories.items)
        } catch {
            return .failure(.decodeIssue)
        }
    }

    func mapContributorsJSON(data: Data) -> Result<[ContributorItem], CustomError>  {
        do {
            let contributors = try decoder.decode([ContributorItem].self, from: data)
            return .success(contributors)
        } catch {
            return .failure(.decodeIssue)
        }
    }

    func mapContributorAvatarImage(data: Data) -> Result<UIImage, CustomError>  {
        guard let image = UIImage(data: data) else {
            return .failure(.dataNotExists)
        }
        return .success(image)
    }
}
