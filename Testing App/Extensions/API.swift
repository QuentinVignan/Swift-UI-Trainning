//
//  API.swift
//  Testing App
//
//  Created by Quentin Vignan on 18/06/2021.
//

import Foundation
import SwiftUI


struct Result: Codable , Identifiable{
    var id = UUID()
    let name: String
    let email: String
    let body: String
}

class Api: ObservableObject {
    func getUser(completion:@escaping ([Result]) -> ()) {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let results = try! JSONDecoder().decode([Result].self, from: data!)
                print(results)
                
                DispatchQueue.main.async {
                    completion(results)
                }
            }
            .resume()
        }

}
