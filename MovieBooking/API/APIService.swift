//
//  APIService.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation

class APIService {
    private struct Constants {
        static let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDM4Nzk4MzQyZDZhZTJjYWQxNmVmNDc3YmFkY2RlZiIsInN1YiI6IjY1YjY1NmI2MGQyOTQ0MDE2NDVhYzYxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sGUXdWtRM2e55UAWHa59Aijy5Pmo3rixMBTAQD24y1s"
        ]
        
    }
    
    func getNowPlayingMovies(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=\(page)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["results"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Movie].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch {
                        print("ERROR: \(error)")
                    }
                    
                }
            } catch let error as NSError {
                print("ERROR: Failed to load: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func getUpcomingMovie(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=\(page)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["results"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Movie].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch {
                        print("ERROR: \(error)")
                    }
                    
                }
            } catch let error as NSError {
                print("ERROR: Failed to load: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func getMovieDetail(id: Int, completion: @escaping(MovieDetail) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)



        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(MovieDetail.self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch {
                        print("ERROR: \(error)")
                    }
                    
                }
            } catch let error as NSError {
                print("ERROR: Failed to load: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func getMovieImages(id: Int, completion: @escaping([Images]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/images")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["backdrops"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Images].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch {
                        print("ERROR: \(error)")
                    }
                    
                }
            } catch let error as NSError {
                print("ERROR: Failed to load: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func getMovieCastList(id: Int, completion: @escaping([Cast]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["cast"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Cast].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    } catch {
                        print("ERROR: \(error)")
                    }
                    
                }
            } catch let error as NSError {
                print("ERROR: Failed to load: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
