import UIKit

struct MappingService<T: Codable> {
    private let decoder = JSONDecoder()

    func mapJSON(data: Data) -> Result<T, CustomError>  {
        do {
            let repositoriesItem = try decoder.decode(T.self, from: data)
            return .success(repositoriesItem)
        } catch {
            return .failure(.decodeIssue)
        }
    }
}
