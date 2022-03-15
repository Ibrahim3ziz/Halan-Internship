//
//  ViewController.swift
//  DI
//
//  Created by Ibrahim Abdul Aziz on 13/03/2022.
//
import UIKit
import MyAppUIKit

class ViewController: UIViewController {
    
    // https://iosacademy.io/api/v1/courses/index.php

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let vc = CoursesViewController()
        present(vc, animated: true)
    }


}

