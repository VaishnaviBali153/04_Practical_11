import UIKit
class NotesList: UIViewController {
    
    private var stateArray=[String]()
    private let myTableview = UITableView()
    private let tabBar:UIToolbar = {
        let toolBar = UIToolbar()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handel_add))
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let logout = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(handel_logout))
        toolBar.items = [leftSpace,add,logout]
        
        return toolBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tabBar)
        view.addSubview(myTableview)
        stateArray = FileManagerService.getfiles()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateArray = FileManagerService.getfiles()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame = CGRect(x: 0, y: 60, width: view.width, height: 40)
        myTableview.frame = CGRect(x: 0,y: tabBar.bottom + 10, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom - 50)
    }
    
    @objc func handel_add(){
        print("add")
        let n1 = NotesDetails()
        //self.dismiss(animated: true)
        navigationController?.pushViewController(n1, animated: true)
        present(n1,animated: true, completion: nil)
    }
    
    private func checkAuth(){
        if let uname = UserDefaults.standard.string(forKey: "username"){
            print("welcome \(uname)")
            
        }
        else{
            let vc = Login()
            let nev = UINavigationController(rootViewController: vc)
            nev.modalPresentationStyle = .fullScreen
            nev.setNavigationBarHidden(true, animated: false)
            present(nev,animated: false)
        }
    }
    
    @objc func handel_logout(){
        UserDefaults.standard.setValue(nil, forKey: "username")
        checkAuth()
        
    }
}
extension NotesList: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text=stateArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let filePath = FileManagerService.getDocDir().appendingPathComponent(stateArray[indexPath.row] + ".txt")
        do{
            try FileManager.default.removeItem(at: filePath)
            print("delete")
            tableView.reloadData()
        }catch{
            print("error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NotesDetails()
        vc.f = stateArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    private func setupTableView(){
        myTableview.dataSource = self
        myTableview.delegate = self
        myTableview.register(UITableViewCell.self, forCellReuseIdentifier: "StateCell")
    }    
}
