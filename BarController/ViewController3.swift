//
//  ViewController3.swift
//  BarController
//
//  Created by Amir Umarov on 19.05.2024.
//

import UIKit

class ViewController3: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Change Screen"
        label.textColor = UIColor.darkText
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
        
    }()
    
    let segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["white","Light", "Dark"])
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.gray.cgColor
        control.tintColor = .gray
        control.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
        return control
    }()
    
    var isDarkMode = false
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(segmentControl)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func defaultBackgroundWhite() {
        view.backgroundColor = .white
    }
    
    private func lightMode() {
        view.backgroundColor = .lightGray
    }
    
    private func darkMode() {
        view.backgroundColor = .darkGray
    }
    
    @objc private func suitDidChange(_ segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            defaultBackgroundWhite()
        case 1:
            lightMode()
        case 2:
            darkMode()
        default:
            break
        }
    }
    
    private func saveCurrentBackgroundColor() {
        UserDefaults.setValue(view.backgroundColor?.description, forKey: "backgroundColor")
    }
}

    
 
