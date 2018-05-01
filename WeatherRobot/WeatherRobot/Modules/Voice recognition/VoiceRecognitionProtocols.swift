//
//  VoiceRecognitionProtocols.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import Foundation

// MARK: WireFrameProtocol

protocol VoiceRecognitionWireframeProtocol: class {

}

// MARK: PresenterProtocol

protocol VoiceRecognitionPresenterProtocol: class {

    var interactor: VoiceRecognitionInteractorInputProtocol? { get set }
}

// MARK: InteractorProtocol

protocol VoiceRecognitionInteractorOutputProtocol: class {

    /** Interactor -> Presenter */
}

protocol VoiceRecognitionInteractorInputProtocol: class {

    var presenter: VoiceRecognitionInteractorOutputProtocol? { get set }

    /** Presenter -> Interactor */
}

// MARK: ViewProtocol

protocol VoiceRecognitionViewProtocol: class {

    var presenter: VoiceRecognitionPresenterProtocol? { get set }

    /** Presenter -> ViewController */
}
