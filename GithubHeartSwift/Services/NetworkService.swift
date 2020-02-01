import Foundation

struct NetworkService {
    private let repositoriesBaseUrl = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
    private let repositoriesPerPageUrlSuffix = "&per_page="
    private let repositoriesPageUrlSuffix = "&page="

    func requestRepository(page: Int, perPage: Int = 25,  callback: @escaping (Result<Data, CustomError>) -> Void) {
        let stringUrl = repositoriesBaseUrl +
            repositoriesPerPageUrlSuffix +
            String(perPage) +
            repositoriesPageUrlSuffix +
            String(page)

        makeDataTaskRequest(with: stringUrl, callback: callback)
    }

    // only contributors with >1 contributions are being returned by the API    
    func requestContributors(stringUrl: String,  callback: @escaping (Result<Data, CustomError>) -> Void) {
        makeDataTaskRequest(with: stringUrl, callback: callback)
    }

    private func makeDataTaskRequest(with stringUrl: String, callback: @escaping (Result<Data, CustomError>) -> Void) {
        if let url =  URL(string: stringUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let _ = error {
                    callback(.failure(.responseError))
                    return
                } else if let data = data {
                    callback(.success(data))
                    return
                }
                callback(.failure(.dataNotExists))
            }
            task.resume()
        } else {
            callback(.failure(.urlNotValid))
        }
    }

}
