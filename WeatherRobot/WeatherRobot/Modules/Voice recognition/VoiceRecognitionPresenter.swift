//
//  VoiceRecognitionPresenter.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class VoiceRecognitionPresenter: VoiceRecognitionPresenterProtocol, VoiceRecognitionInteractorOutputProtocol {

    weak private var view: VoiceRecognitionViewProtocol?
    var interactor: VoiceRecognitionInteractorInputProtocol?
    private let router: VoiceRecognitionWireframeProtocol

    init(interface: VoiceRecognitionViewProtocol, interactor: VoiceRecognitionInteractorInputProtocol?, router: VoiceRecognitionWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
