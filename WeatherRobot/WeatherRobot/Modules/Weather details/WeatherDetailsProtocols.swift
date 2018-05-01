//
//  WeatherDetailsProtocols.swift
//  WeatherRobot
//
//  Created by Malek Trabelsi on 5/1/18.
//  Copyright © 2018 Malek Trabelsi. All rights reserved.
//

import Foundation

// MARK: WireFrameProtocol

protocol WeatherDetailsWireframeProtocol: class {

}

// MARK: PresenterProtocol

protocol WeatherDetailsPresenterProtocol: class {

    var interactor: WeatherDetailsInteractorInputProtocol? { get set }
}

// MARK: InteractorProtocol

protocol WeatherDetailsInteractorOutputProtocol: class {

    /** Interactor -> Presenter */
}

protocol WeatherDetailsInteractorInputProtocol: class {

    var presenter: WeatherDetailsInteractorOutputProtocol? { get set }

    /** Presenter -> Interactor */
}

// MARK: ViewProtocol

protocol WeatherDetailsViewProtocol: class {

    var presenter: WeatherDetailsPresenterProtocol? { get set }

    /** Presenter -> ViewController */
}
