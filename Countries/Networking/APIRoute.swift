import Foundation

enum APIRoute {
    // Endpoints that view layers will call.
    case getAllCountries
    case querryCountryByName(name:String)

    // Base url of the Countries API
    private var baseURLString: String { "https://restcountries.com/v3.1/" }

    // Computed property for URL generation
    // Required parameters appending to this property.
    private var url: URL? {
        switch self {
            
        case .getAllCountries:
            return URL(string: baseURLString + "all")
        case .querryCountryByName(name: let name):
            return URL(string: baseURLString + "name/" + name)
        }
    }

    // URL body params. (In this article we won't use it)
    private var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }

    // This func creates request with the given parameters.
    // We will use this request in the RequestHandler to execute requests.
    func asRequest() -> URLRequest? {
        guard let url = url else {
            print("Missing URL for route: \(self)")
            return nil
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters

        guard let parametrizedURL = components?.url else {
            print("Missing URL with parameters for url: \(url)")
            return nil
        }

        return URLRequest(url: parametrizedURL)
    }
}
