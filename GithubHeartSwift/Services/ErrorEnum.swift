import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum CustomError: Error {
    case noResponse
    case dataNotExists
    case urlNotValid
    case decodeIssue
    case responseError
    case unknown
}
