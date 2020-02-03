import UIKit

extension UIImage {
    static func load(from url: URL, completion: @escaping (Result<UIImage, CustomError>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    completion(.failure(.dataNotExists))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            } catch {
                completion(.failure(.responseError))
            }
        }
    }
}
