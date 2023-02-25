import Foundation

let randomFact = "https://meowfacts.herokuapp.com/"
let uncorrectLink = "https://meowfacts.herokuappcom/"

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else {return}
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("ACCESS ERROR")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else {return }
            let dataAsString = String(data: data, encoding: .utf8)
            print("Status code: \(response.statusCode)")
            print("\(dataAsString ?? "")")
        }
    }.resume()
}

getData(urlRequest: uncorrectLink)
getData(urlRequest: randomFact)
