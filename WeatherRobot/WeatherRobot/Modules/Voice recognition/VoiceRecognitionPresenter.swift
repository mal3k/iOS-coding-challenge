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
    
    func viewInit()
    {
        interactor?.getSpeechAuthorizationStatus()
    }
    func recordSpeech()
    {
        interactor?.startRecordingSpeech()
    }
    func didGetSpeechAuthorizationStatus(withLog log: String, andIcon icon: UIImage, andRecordButtonEnabled status: Bool)
    {
        view?.updateLog(withText: log, andIcon: icon)
        view?.updateRecordButton(withStatus: status)
    }
    func updateLog(withText text: String, andIcon icon: UIImage)
    {
        view?.updateLog(withText: text, andIcon: icon)
    }
    func confirmSpeechRecognition(withAlertText text: String)
    {
        view?.confirmSpeechRecognition(withAlertText: text)
    }
}
