import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "insert info"
        return textfield
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func saveTapped() {
        saveNameToArray()
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    private func setupViews()  {
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(30)
        }
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
    }

    private func saveNameToArray() {
        guard let name = textField.text, !name.isEmpty else {
            print("no name")
            return
        }
        let names = UserDefaults.standard.array(forKey: "UserNames") as? [String]
        
        if var names = names {
            names.append(name)
            UserDefaults.standard.setValue(names, forKey: "UserNames")
            print("\(names) is saved to userDefaults")
        }else {
            UserDefaults.standard.setValue([name], forKey: "UserNames")
            print("\([name]) is saved to userDefaults")
        }
        
    }
}

