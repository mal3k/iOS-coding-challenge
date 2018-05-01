//
//  VoiceRecognitionProtocols.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import Foundation
import UIKit

// MARK: WireFrameProtocol

protocol VoiceRecognitionWireframeProtocol: class {

}

// MARK: PresenterProtocol

protocol VoiceRecognitionPresenterProtocol: class {

    var interactor: VoiceRecognitionInteractorInputProtocol? { get set }
    func viewInit()
    func recordSpeech()
}

// MARK: InteractorProtocol

protocol VoiceRecognitionInteractorOutputProtocol: class {

    /** Interactor -> Presenter */
    func didGetSpeechAuthorizationStatus(withLog log: String, andIcon icon: UIImage, andRecordButtonEnabled status: Bool)
    func updateLog(withText text: String, andIcon icon: UIImage)
    func confirmSpeechRecognition(withAlertText text: String)
}

protocol VoiceRecognitionInteractorInputProtocol: class {

    var presenter: VoiceRecognitionInteractorOutputProtocol? { get set }

    /** Presenter -> Interactor */
    func getSpeechAuthorizationStatus()
    func startRecordingSpeech()
}

// MARK: ViewProtocol

protocol VoiceRecognitionViewProtocol: class {

    var presenter: VoiceRecognitionPresenterProtocol? { get set }

    /** Presenter -> ViewController */
    func updateLog(withText text: String, andIcon icon: UIImage)
    func updateRecordButton(withStatus status: Bool)
    func confirmSpeechRecognition(withAlertText text: String)
}
