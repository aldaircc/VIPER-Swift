//
//  CounterView.swift
//  Counter-Vipper-Swift
//
//  Created by Aldair Raul Cosetito Coral on 1/4/21.
//

import UIKit

class CounterView: UIViewController {
    
    // MARK: - UI Variables
    let counterTable: UITableView = {
        let table = UITableView()
        return table
    }()
    
    // MARK: - Variables
    var presenter: ViewToPresenterCounter?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAction()
    }
    
    // MARK: - Methods
    func setupUI() {
        drawCounterTable()
        registerCounterTable()
    }
    
    func setupAction() {
        self.presenter?.viewDidLoad()
    }
    
    func drawCounterTable() {
        self.view.addSubview(counterTable)
        self.counterTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            counterTable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            counterTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            counterTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            counterTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    func registerCounterTable() {
        self.counterTable.delegate = self
        self.counterTable.dataSource = self
        self.counterTable.register(UITableViewCell.self, forCellReuseIdentifier: "counterCell")
    }
}

// MARK: - TableView
extension CounterView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

// MARK: - PresenterToViewCounter
extension CounterView: PresenterToViewCounter {
    func onSuccessFetchCounters() {
        DispatchQueue.main.async {
            self.counterTable.reloadData()
        }
    }
    
    func onFailureFetchCounters(error: String) {
        print("Error: \(error)")
    }
}
