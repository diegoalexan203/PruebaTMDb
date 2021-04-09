//
//  MovieService.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 30/03/21.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieService {
    
     func getMovies(page: String,_ completionHandler:  @escaping(ResponseMovies? , Error?) -> Void) {
    //func getMovies(page: String) -> ResponseMovies? {
        let url = "\(Constants.URL.base)/discover/movie?api_key=\(Constants.NEWS_API_KEY)&page=\(page)"
        AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let json = value as? [String: Any] {
                            let response = Mapper<ResponseMovies>().map(JSON: json)
                            completionHandler(response, nil)
                        }
                    case .failure(let error):
                        print(error)
                        completionHandler(nil,BackendError.internalError(reason: "Parsing error"))
                    }
            }
    }
}

enum BackendError: Error {
    case parameters(reason: String)
    case connection
    case technicalProblem
    case timeOut
    case internalError(reason: String)
    case objectSerialization(reason: String)
}
