//
//  ForcastServices.swift
//  AlamofireWeatherProject
//
//  Created by Mohamed on 1/27/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation
import Alamofire


class ForcastServices
{
    //https://api.darksky.net/forecast/d15014f9492940ec6aa9d5beeabdf0d7/37.8267,-122.4233
    
    let forcastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        
        self.forcastAPIKey = APIKey
        self.forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
        
    }
    
    func getCurrentWeather(latitude: Double , longitude: Double , completion: @escaping (CurrentWeather?)->Void){
        
        if let completeURL = URL(string: "\(forecastBaseURL!)/\(latitude)/\(longitude)"){
            
            Alamofire.request(completeURL).responseJSON { (response) in
                
                if let jsonDictionary = response.result.value as? [String:Any]{
                    
                    if let currentWeather = jsonDictionary["currently"] as? [String: Any]{
                        
                        
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeather)
                        completion(currentWeather)
                    }else{
                        
                        completion(nil)
                    }
                    
                }
                
            }
            
        }
    }
}
