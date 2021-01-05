//
//  CounterContract.swift
//  Counter-Vipper-Swift
//
//  Created by Aldair Raul Cosetito Coral on 1/4/21.
//

import UIKit

// MARK: - View to Presenter
protocol ViewToPresenterCounter {
    var view: PresenterToViewCounter? { get set }
    var interactor: PresenterToInteractorCounter? { get set }
    var router: PresenterToRouterCounter? { get set }
    var counters: [Counter]? { get set }
    func viewDidLoad()
    func numberOfRowInSection() -> Int
    func getCounter(at indexPath: IndexPath) -> Counter?
}

// MARK: - Presenter to View
protocol PresenterToViewCounter {
    func onSuccessFetchCounters()
    func onFailureFetchCounters(error: String)
}

// MARK: - Presenter to Interactor
protocol PresenterToInteractorCounter {
    var presenter: InteractorToPresenter? { get set }
    func loadCounters()
}

// MARK: - Interactor to Presenter
protocol InteractorToPresenter {
    func onSuccessFetchCounters(_ counters: [Counter])
    func onFailureFetchCounter(_ error: String)
}

// MARK: - Presenter to Router
protocol PresenterToRouterCounter {
    static func createModule() -> UINavigationController
}
