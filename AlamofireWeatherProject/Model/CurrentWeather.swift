//
//  CurrentWeather.swift
//  AlamofireWeatherProject
//
//  Created by Mohamed on 1/27/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation

class CurrentWeather{
    
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
    
    
    init(weatherDictionary: [String: Any]) {
        
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            
            humidity = Int(humidityDouble * 100)
            
        }else{
            
            humidity = nil
        }
        
        if let precipProbabilityDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double{
            
            precipProbability = Int(precipProbabilityDouble * 100)
            
        }else{
            
            precipProbability = nil
        }
        
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon    = weatherDictionary[WeatherKeys.icon]   as? String
    }
    
    
}
