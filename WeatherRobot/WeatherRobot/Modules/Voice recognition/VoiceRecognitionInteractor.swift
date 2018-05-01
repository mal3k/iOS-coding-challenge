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
    
    private let speechRecogniser = SFSpeechRecognizer(locale: Locale(identifier: "en-GB"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    private var speechText: String?
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
        presenter?.updateLog(withText: "Attempt to start recording. Please wait", andIcon: #imageLiteral(resourceName: "Activated microphone"))
        let audioSession = AVAudioSession.sharedInstance()
        do
        {
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        }catch
        {
            presenter?.updateLog(withText: "The following error occured: \(error), please try again later", andIcon: #imageLiteral(resourceName: "Activated microphone"))
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            return
        }
        let inputNode = audioEngine.inputNode
        recognitionTask = speechRecogniser.recognitionTask(with: recognitionRequest) {[unowned self] result, error in
            if let result = result {
                let transcriptedText = result.bestTranscription.formattedString
                self.audioEngine.stop()
                recognitionRequest.endAudio()
                DispatchQueue.main.async {
                    self.presenter?.updateLog(withText: "Spoken detected text: \(transcriptedText)", andIcon: #imageLiteral(resourceName: "Activated microphone"))
                    self.presenter?.confirmSpeechRecognition(withAlertText: "Want to know the weather of: \(transcriptedText)")
                }
            }
            
            if result?.isFinal ?? (error != nil) {
                inputNode.removeTap(onBus: 0)
            }
        }
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        do
        {
            try audioEngine.start()
            presenter?.updateLog(withText: "Voice recording started, please pronounce the city name you want to get its weather", andIcon: #imageLiteral(resourceName: "Activated microphone"))
        }catch
        {
            presenter?.updateLog(withText: "The following error occured: \(error), please try again later", andIcon: #imageLiteral(resourceName: "Activated microphone"))
        }
    }
}
