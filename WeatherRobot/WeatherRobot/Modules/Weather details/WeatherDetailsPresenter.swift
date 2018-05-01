//
//  WeatherDetailsPresenter.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class WeatherDetailsPresenter: WeatherDetailsPresenterProtocol, WeatherDetailsInteractorOutputProtocol {

    weak private var view: WeatherDetailsViewProtocol?
    var interactor: WeatherDetailsInteractorInputProtocol?
    private let router: WeatherDetailsWireframeProtocol

    var transcriptedSpeech: String?
    
    init(interface: WeatherDetailsViewProtocol, interactor: WeatherDetailsInteractorInputProtocol?, router: WeatherDetailsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
