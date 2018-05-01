//
//  VoiceRecognitionRouter.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class VoiceRecognitionRouter: VoiceRecognitionWireframeProtocol {

    weak var viewController: VoiceRecognitionViewController?

    static func createModule() -> VoiceRecognitionViewController {
        // Change to get view from storyboard if not using progammatic UI
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "VoiceRecognitionScene") as! VoiceRecognitionViewController
        let interactor = VoiceRecognitionInteractor()
        let router = VoiceRecognitionRouter()
        let presenter = VoiceRecognitionPresenter(interface: view,
                                                  interactor: interactor,
                                                                router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    func moveToWeatherScene()
    {
        let weatherViewController = WeatherDetailsRouter.createWeatherDetailsModule(forCity: (viewController?.transcriptedText)!)
        viewController?.navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
