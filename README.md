# GithubHeartSwift
Checking capabilities of SwiftUI on a sample project with no third-party frameworks
Using MVVM architecture

Using Github V3 Search API requests:

Request #1 for all repositories sorted by star:
https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc&per_page=25&page=1

Request #2 for contributor list:
https://api.github.com/repos/vsouza/awesome-ios/contributors

Request #3 for async download user's avatar image:
https://avatars3.githubusercontent.com/u/2668221

Roadmap: 
- [X] Show list of repositories 25 per page
- [X] Paging the list of repositories
- [X] Show repository details
- [X] Show repository contributors
- [X] Download user's avatars asynchronously
- [ ] XCTests
- [ ] Mock data for SwiftUI Previews
- [ ] Custom animations
- [ ] Handle all errors
