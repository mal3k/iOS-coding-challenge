//
//  VoiceRecognitionViewController.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import UIKit

class VoiceRecognitionViewController: UIViewController, VoiceRecognitionViewProtocol  {

    var presenter: VoiceRecognitionPresenterProtocol?

    @IBOutlet weak var microPhoneImageView: UIImageView!
    @IBOutlet weak var voiceRecognitionLogTextView: UITextView!
    
    @IBOutlet weak var recordButton: UIBarButtonItem!
    @IBAction func onRecordAction(_ sender: Any) {
        presenter?.recordSpeech()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewInit()
    }
    @IBAction func onRefresh(_ sender: Any) {
        presenter?.viewInit()
    }
}
typealias ManageUI = VoiceRecognitionViewController
extension ManageUI
{
    func updateLog(withText text: String, andIcon icon: UIImage)
    {
        microPhoneImageView.image = icon
        voiceRecognitionLogTextView.text = text
    }
    func updateRecordButton(withStatus status: Bool)
    {
        recordButton.isEnabled = status
    }
    func confirmSpeechRecognition(withAlertText text: String)
    {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I confirm", style: .default, handler: {_ in
            print("Speech confirmed")
        }))
        alert.addAction(UIAlertAction(title: "No, retry", style: .destructive, handler: {_ in
            self.presenter?.recordSpeech()
        }))
        present(alert, animated: true, completion: nil)
    }
}
