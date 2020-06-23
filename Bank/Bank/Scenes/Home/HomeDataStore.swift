//
//  HomeDataStore.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject {
    private var presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
}

extension HomeDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! HomeTableViewCell
        cell.prepareCells(statement: presenter.statements[indexPath.row])
        return cell
    }
}
extension HomeDataSource {
    class func setupHome(tableView: UITableView?) {
        tableView?.register(HomeTableViewCell.self, forCellReuseIdentifier: "infoCell")
    }
}
