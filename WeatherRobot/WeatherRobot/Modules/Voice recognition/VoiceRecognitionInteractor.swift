//
//  VoiceRecognitionInteractor.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import Foundation
import Speech
import UIKit

class VoiceRecognitionInteractor : VoiceRecognitionInteractorInputProtocol {

    weak var presenter: VoiceRecognitionInteractorOutputProtocol?

}
typealias SpeechAuthorizationWorker = VoiceRecognitionInteractor
extension SpeechAuthorizationWorker
{
    func getSpeechAuthorizationStatus()
    {
        SFSpeechRecognizer.requestAuthorization { (authorizationStatus) in
            OperationQueue.main.addOperation {
                switch authorizationStatus
                {
                case .authorized:
                    self.presenter?.didGetSpeechAuthorizationStatus(withLog: "Congratulations, app now can use the microphone", andIcon: #imageLiteral(resourceName: "Activated microphone"), andRecordButtonEnabled: true)
                case .denied:
                    self.presenter?.didGetSpeechAuthorizationStatus(withLog: "User denied app permission to use the microphone", andIcon: #imageLiteral(resourceName: "Deactivated microphone"), andRecordButtonEnabled: false)
                case .notDetermined:
                    self.presenter?.didGetSpeechAuthorizationStatus(withLog: "The authorization to use the microphone is unknown", andIcon: #imageLiteral(resourceName: "Deactivated microphone"), andRecordButtonEnabled: false)
                case .restricted:
                    self.presenter?.didGetSpeechAuthorizationStatus(withLog: "The device denies the app permission to use the microphone", andIcon: #imageLiteral(resourceName: "Deactivated microphone"), andRecordButtonEnabled: false)
                }
            }
        }
    }
}
typealias SpeechRecordingWorker = VoiceRecognitionInteractor
extension SpeechRecordingWorker
{
    func startRecordingSpeech()
    {
    }
}
