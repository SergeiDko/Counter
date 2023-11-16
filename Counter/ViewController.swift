//
//  ViewController.swift
//  Counter
//
//  Created by Sergey Dyachenko on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var buttonCounter: UIButton!
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        labelCounter.text = "Значение сётчика: \(String(counter))"

        // Do any additional setup after loading the view.
        
    }
    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        labelCounter.text = "Значение сётчика: \(String(counter))"
    }
    

}

