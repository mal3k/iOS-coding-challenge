//
//  VoiceRecognitionRouter.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class VoiceRecognitionRouter: VoiceRecognitionWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = VoiceRecognitionViewController(nibName: nil, bundle: nil)
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

}
