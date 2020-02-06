import Foundation

struct NetworkService {
    private let repositoriesBaseUrl = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
    private let repositoriesPerPageUrlSuffix = "&per_page="
    private let repositoriesPageUrlSuffix = "&page="

    func requestRepository(page: Int, perPage: Int = 25, callback: @escaping (Result<Data, CustomError>) -> Void) {
        let stringUrl = repositoriesBaseUrl +
            repositoriesPerPageUrlSuffix +
            String(perPage) +
            repositoriesPageUrlSuffix +
            String(page)

        makeDataTaskRequest(with: stringUrl, callback: callback)
    }

    func makeDataTaskRequest(with stringUrl: String, callback: @escaping (Result<Data, CustomError>) -> Void) {
        guard let url =  URL(string: stringUrl) else {
            callback(.failure(.urlNotValid))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let _ = error {
                    callback(.failure(.responseError))
                    return
                } else if let data = data {
                    callback(.success(data))
                    return
                }
                callback(.failure(.dataNotExists))
            }
        }
        task.resume()
    }

}
