//
//  HomeTableViewCell.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTypeLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var itemTitleLb: UILabel!
    @IBOutlet weak var priceLb: UILabel!
    
    func prepareCells(statement: Statement){
        itemTypeLb.text = statement.title
        itemTitleLb.text = statement.desc
        let date = Date()
        dateLb.text = date.getFormattedDate(format: statement.date)
        priceLb.text = PriceHelper.formatPrice(price: statement.value)
    }
    
}
