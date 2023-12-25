//
//  WeatherViewController.swift
//  UIKitWeatherApp
//
//  Created by Zülfü Akgüneş on 25.12.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scrollView.bounds)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let weatherView = WeatherView()
        print("did appear", scrollView.bounds)
        weatherView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.addSubview(weatherView)
    }
    
}
