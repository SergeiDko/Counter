//
//  ViewController.swift
//  Counter
//
//  Created by Sergey Dyachenko on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textStatus: UITextView!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    var counter: Int = 0
    
    func currentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let currentTime = Date()
        let currentTimeString = dateFormatter.string(from: currentTime)
        return currentTimeString
    }
    
    func autoScroll() {
        let end = textStatus.endOfDocument
        textStatus.selectedTextRange = textStatus.textRange(from: end, to: end)
        textStatus.scrollRangeToVisible(textStatus.selectedRange)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        buttonPlus.layer.cornerRadius = 9
        buttonMinus.layer.cornerRadius = 9
        buttonZero.layer.cornerRadius = 9
        buttonPlus.backgroundColor = .red
        buttonMinus.backgroundColor = .blue
        textStatus.text = "История изменений: \n"
        textLabel.text = "Значение счётчика: \(counter)"
        textStatus.isEditable = false
        textStatus.isScrollEnabled = true
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        counter += 1
        textStatus.text += "[\(currentTime())]: значение изменено на +1 \n"
        textLabel.text = "Значение счётчика: \(counter)"
        autoScroll()
    }
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if counter != 0{
            counter -= 1
            textStatus.text += "[\(currentTime())]: значение изменено на -1 \n"
            textLabel.text = "Значение счётчика: \(counter)"
            autoScroll()
        }
        else {
            textStatus.text += "[\(currentTime())]: попытка уменьшить значение счётчика ниже 0\n"
            autoScroll()
        }
    }
    @IBAction func buttonZeroDidTap(_ sender: Any) {
        counter = 0
        textStatus.text += "[\(currentTime())]: значение сброшено \n"
        textLabel.text = "Значение счётчика: \(counter)"
        autoScroll()
    }
    
}

