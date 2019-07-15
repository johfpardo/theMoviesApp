//
//  ApiAccess.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/13/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import Foundation
import Alamofire

class ApiAccess {
    static let shared = ApiAccess()
    
    private init() {
    }
    
    func getMovies(completion: @escaping ([String : Any], _ error: Error?)-> Void, _ url : String){
        Alamofire.request(url).responseJSON{ (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                completion(responseObject.result.value! as! [String : Any], nil)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                completion([:], error)
                
            }
        }
        
    }
}
