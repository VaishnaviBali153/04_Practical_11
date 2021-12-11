import UIKit

class NotesDetails: UIViewController {
    
    var f:String? = ""
    
    private let TextField1:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "File name"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .lightGray
        return textfield
    }()
    private let TextField2:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "File name"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .lightGray
        return textfield
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("save", for: .normal)
        button.addTarget(self, action: #selector(saveNote), for: .touchUpInside )
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(TextField1)
        view.addSubview(TextField2)
        view.addSubview(saveButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        TextField1.frame = CGRect(x: 40, y: 100, width: view.width - 80, height: 40)
        TextField2.frame = CGRect(x: 40, y:TextField1.bottom + 20, width: view.width - 80 , height: 300)
        
        saveButton.frame = CGRect(x: 40, y: TextField2.bottom + 20 , width: view.width - 80 , height: 40)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do{
            let filepath = FileManagerService.getDocDir().appendingPathComponent(f! + ".txt")
            let fetchContent = try String(contentsOf: filepath)
            print(fetchContent)
            TextField1.text = f
            TextField2.text = fetchContent
        } catch{
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
        @objc private func saveNote() {
        print("clicked")
        let name = TextField1.text!
        let content = TextField2.text!
        let filePath = FileManagerService.getDocDir().appendingPathComponent("\(name).txt")
        do{
            try content.write(to: filePath, atomically: true, encoding: .utf8)
        }catch{
            print("error")
        }
    }
}
