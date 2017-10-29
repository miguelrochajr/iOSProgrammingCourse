//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Gabriella França on 26/07/17.
//  Copyright © 2017 Miguel Rocha Jr. All rights reserved.
//

import UIKit
import Alamofire /* In case there is an error on Alamofire, press Shift+cmd+k to clean the project and shift+cmd+b to build it again */

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
        
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
//        Alamofire.reques
        Alamofire.request(currentWeatherURL).responseJSON { response in //please note that this is in closure format (doc: http://apple.co/2jyZZCb)
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weatherType = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let weather = weatherType[0]["main"] as? String {
                        self._weatherType = weather.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let currentTemp = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = currentTemp["temp"] as? Double{
                        let kelvinToFarenheit = Double(round(10*(temp * (9/5) - 459.67)/10))
                        self._currentTemp = kelvinToFarenheit
                        print(self._currentTemp)
                    }
                    
                }
            }
            completed()
        }
    }
}


