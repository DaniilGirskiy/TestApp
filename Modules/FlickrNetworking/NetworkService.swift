public protocol NetworkService {
    func get(urlString: String, then: @escaping ([Post]) -> Void)
}

class NetworkServiceImpl: NetworkService {
    func get(urlString: String, then: @escaping ([Post]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {     // check
                guard let data = data else { return }
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        then(response.photos.photo)
                    } catch {
                        then([])
                    }
                }
            }.resume()
    }
}
