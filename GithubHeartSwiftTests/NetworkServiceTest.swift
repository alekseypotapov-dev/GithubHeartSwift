@testable import GithubHeartSwift
import XCTest

final class NetworkServiceTest: XCTestCase {

    func test_dataTaskRequest() {
        let sut = NetworkService()
        sut.makeDataTaskRequest(with: "https://api.github.com/") { response in
            switch response {
            case .success(_): break
            case .failure(let error): XCTFail(error.localizedDescription)
            }
        }
    }
}
