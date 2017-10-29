//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Gabriella França on 26/07/17.
//  Copyright © 2017 Miguel Rocha Jr. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LOGITUDE = "&lon="
let APP_ID = "&appid=c066c64c6233a2e9e99abd6e5fe1054d"
let API_KEY = "c066c64c6233a2e9e99abd6e5fe1054d"

typealias DownloadComplete = () -> () //this wil tell our function when we are completed

let CURRENT_WEATHER_URL: String = {
    
    let str = "\(BASE_URL)\(LATITUDE)-36\(LOGITUDE)123\(APP_ID)\(API_KEY)"
    
    return str
}()
