import UIKit

class Login: UIViewController {
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        
        return textField
    }()
    private var passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton();
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func login(){
        print("Button Click")
        if(nameTextField.text == "Vaishnavi" && passTextField.text == "123"){
            
            UserDefaults.standard.setValue("Vaishnavi", forKey: "username")
            go()
        }
    }
    private func go(){
        let n1 = NotesList()
        navigationController?.pushViewController(n1, animated: true)
        present(n1,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let uname = UserDefaults.standard.string(forKey: "username")
        print(uname)
        if  UserDefaults.standard.object(forKey: "username") == nil{
            print("not set")
        }
        else{
            print("set")
            go()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: 225, width: view.width - 80, height: 40)
        passTextField.frame = CGRect(x: 40 ,y: 275, width: view.width - 80, height: 40)
        loginButton.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
    }
}
