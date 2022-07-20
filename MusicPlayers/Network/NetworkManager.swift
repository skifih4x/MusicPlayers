//
//  NetworkManager.swift
//  MusicPlayers
//
//  Created by Артем Орлов on 19.07.2022.
//

import Foundation

struct NetworkManager {
//    jack-johnson
    static let shared = NetworkManager()
    
    func getAlbumsSheffield(completion: @escaping (Result <[Results], Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=Sheffield&entity=album&attribute=albumTerm") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Albums.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results.results))
                    print(results.results)
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getAlbumsJackJohnson(completion: @escaping (Result <[Results], Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack-johnson&entity=album&attribute=albumTerm") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Albums.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results.results))
                    print(results.results)
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getAlbumsSystemOfDown(completion: @escaping (Result <[Results], Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=system-of-a-down&entity=album&attribute=albumTerm") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Albums.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results.results))
                    print(results.results)
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
