//
//  ViewController.swift
//  Example
//
//  Created by ChungTV on 11/05/2023.
//

import UIKit
import StringUtils

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        label.attributedText = AttributedStringBuilder()
            .append(UIImage(named: "ic_location_white"), height: 14)
            .append(" ")
            .append("299 Cau Giay Street, Dich Vong, Ha Noi")
            .with(UIColor.white)
            .with(UIFont.boldSystemFont(ofSize: 14))
            .append("\n\n")
            .append("Taken at 10:20 AM")
            .with(UIColor.white)
            .with(UIFont.systemFont(ofSize: 12))
            .attributedString()
    }


}

