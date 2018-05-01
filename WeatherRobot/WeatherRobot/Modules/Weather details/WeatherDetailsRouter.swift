//
//  WeatherDetailsRouter.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class WeatherDetailsRouter: WeatherDetailsWireframeProtocol {

    weak var viewController: UIViewController?

    static func createWeatherDetailsModule(forCity city: String) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "WeatherDetailsScene") as! WeatherDetailsViewController
        let interactor = WeatherDetailsInteractor()
        let router = WeatherDetailsRouter()
        let presenter = WeatherDetailsPresenter(interface: view,
                                                                interactor: interactor,
                                                                router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.transcriptedSpeech = city
        return view
    }
}
