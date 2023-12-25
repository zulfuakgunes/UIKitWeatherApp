//
//  ViewController.swift
//  UIKitWeatherApp
//
//  Created by Zülfü Akgüneş on 13.12.2023.
//

import UIKit

class ViewController: UIViewController {
    var weather = [WeatherData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentWeather.shared.fetchCurrentWeather { apiData in
//            self.weather = [apiData]
        }
    }
}
