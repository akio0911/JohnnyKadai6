//
//  ViewController.swift
//  JohnnyKadai6
//
//  Created by Johnny Toda on 2022/03/28.
//

import UIKit

final class ViewController: UIViewController {
    private var randomNum = RandomNum()

    @IBOutlet private weak var valueLabel: UILabel!

    @IBOutlet private weak var slider: UISlider!

    @IBAction private func judgeTheResult(_ sender: Any) {
        let sliderValue = Int(slider.value)

        guard randomNum.num == sliderValue else {
            showAlert(message: JudgementResult.incorrect + "\(sliderValue)")
            return
        }
        showAlert(message: JudgementResult.correct + "\(sliderValue)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        valueLabel.text = "\(randomNum.generateRandomNum())"
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "再挑戦する", style: .default) { _ in
            self.viewDidLoad()
        })

        present(alertController, animated: true, completion: nil)
    }
}
