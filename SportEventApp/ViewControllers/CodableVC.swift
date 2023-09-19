//
//  CodableVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 07.09.2023.
//

import Foundation
import SnapKit
import UIKit
import Alamofire
import RealmSwift

class CodableVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        setupRealm()
    }
    
    private func setupUD() {
        let some = UserDefaults.standard.integer(forKey: "age")
        
        UserDefaults.standard.setValuesForKeys([
            "age": 28,
            "name": "Vadim"
        ])
        
        UserDefaults.standard.setValue("dark", forKey: "theme")
        
        let second = UserDefaults.standard.array(forKey: "age")
        print("-------------------❤️️️️️️️---------------")
        print(some)
        print("------------------❤️️️️️️️----------------")
        print(second)
    }
    
    private func setupRealm() {
        let config = Realm.Configuration(
            schemaVersion: 3
        )
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm() // посилання на базу даних
        
        let newUser = UserRealm()
        newUser.name = "vadim"
        newUser.surname = "babiichuck"
        newUser.email = "babiichuck.vadim@gmail.com"
        newUser.age = 27
        
        try? realm.write {
            realm.add(newUser, update: .all)
        }
        
        let userList = realm.objects(UserRealm.self) // get users
        
        let vadim = realm.object(ofType: UserRealm.self, forPrimaryKey: "babiichuck.vadim@gmail.com")
        
        do { // блок тесту "зможеш виконати?"
            try realm.write {
                vadim?.name = "Nikita"
            }
        } catch {
            print("------------------❤️️️️️️️----------------")
            print(error.localizedDescription)
        }
        
        print(vadim)
    }
    
    private func setupLayout() {
        let backImage = UIImageView(image: UIImage(named: "back"))
        backImage.contentMode = .scaleAspectFill
        view.addSubview(backImage)
        
        let formView = UIView()
        formView.backgroundColor = UIColor(red: 0.216, green: 0.22, blue: 0.243, alpha: 1)
        formView.layer.cornerRadius = 16
        view.addSubview(formView)
        
        let titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        titleLabel.textColor = .white
        formView.addSubview(titleLabel)
        
        let array: [(UIImage, String, UITextContentType)] = [
            (UIImage(named: "user")!, "Full Name", .name),
            (UIImage(named: "user")!, "Email", .emailAddress),
            (UIImage(named: "user")!, "Password", .password)
        ]
        
        let stackView = UIStackView(arrangedSubviews: array.map({ item in
            let textField = UITextField()
            textField.placeholder = item.1
            textField.textContentType = item.2
            textField.textColor = .white
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.borderWidth = 1
            textField.textColor = .white
            
            let image = UIImageView(image: item.0)
            textField.addSubview(image)
            
            image.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(8)
                $0.width.height.equalTo(24)
            }
            textField.snp.makeConstraints {
                $0.height.equalTo(60)
            }
            
            return textField
        }))
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isUserInteractionEnabled = true
        formView.addSubview(stackView)
        
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 10
        btn.layer.cornerCurve = .continuous
        btn.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        formView.addSubview(btn)
        
        backImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            //            $0.height.equalTo(250)
        }
        
        formView.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-44)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        btn.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).inset(-44)
            $0.bottom.equalTo(-40)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(60)
        }
        
        sendRequest()
    }
    
    @objc
    func nextTap() {
        navigationController?.pushViewController(CodableVC(), animated: true)
        //        present(CodableVC(), animated: true)
    }
    
    //    func sendRequest() {
    //        let config = URLSessionConfiguration.default
    //        config.httpAdditionalHeaders = ["Content-Type": "json"]
    //
    //        let session = URLSession(configuration: config)
    //
    //        let url = URL(string: "https://itea-test.free.beeceptor.com/todos")!
    //
    //        var urlRequest = URLRequest(url: url)
    //        urlRequest.httpMethod = "POST"
    //
    //        // your post request data
    //        let postDict: [String: Any] = ["name": "axel",
    //                                        "favorite_animal": "fox"]
    //
    //        guard let postData = try? JSONSerialization.data(withJSONObject: postDict, options: []) else {
    //            return
    //        }
    //
    //        urlRequest.httpBody = postData
    //
    //        let task = session.dataTask(with: urlRequest) { data, response, error in
    //            guard error == nil else {
    //                print ("error: \(error!)")
    //                return
    //            }
    //            guard let content = data else {
    //                print("No data")
    //                return
    //            }
    //
    //            guard let json = (try? JSONSerialization.jsonObject(
    //                with: content,
    //                options: JSONSerialization.ReadingOptions.mutableContainers)
    //            ) as? [String: Any] else {
    //                print("Not containing JSON")
    //                return
    //            }
    //
    //            print("gotten json response dictionary is \n \(json)")
    //        }
    //
    //        task.resume()
    //    }
    
    //    func sendRequest() {
    //        let request1: NSURLRequest = NSURLRequest(url: URL(string: "https://itea-test.free.beeceptor.com/todos")!)
    //
    //        let queue = OperationQueue()
    //
    //        NSURLConnection.sendAsynchronousRequest(
    //            request1 as URLRequest,
    //            queue: queue
    //        ) { response, data, error in
    //
    //            do {
    //                if let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: []) as? [String: Any] {
    //                    print("data: \(jsonResult)")
    //                }
    //            } catch let error as NSError {
    //                print(error.localizedDescription)
    //            }
    //
    //            let data_ = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [String: Any]
    //            print("data: \(data_)")
    //        }
    //    }
    
    func sendRequest() {
        AF.request(
            "https://itea-test.free.beeceptor.com/ping",
            method: .get,
//            parameters: Parameters(dictionaryLiteral: <#T##(String, Any)...##(String, Any)#>)
            headers: HTTPHeaders(["Content-Type": "json"])
        ).responseJSON { response in
            print(response)
        }
    }
}



class UserDefaultsWrapper {
    enum Keys: String {
        case age
        case name
        case surname
    }
    
    func set(_ value: Any, key: Keys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func get(_ key: Keys) -> Any? {
        switch key {
        case .age:
            return UserDefaults.standard.integer(forKey: key.rawValue)
        case .name, .surname:
            return UserDefaults.standard.string(forKey: key.rawValue)
        }
    }
}

class UserRealm: Object {
//    @objc dynamic var age: Int = 0
    @Persisted
    private var name: String
    
    @Persisted var surname: String
    @Persisted(primaryKey: true) var email: String
    @Persisted var age: Double = 0
    
//    override class func primaryKey() -> String? {
//        return name + surname
//    }
}

// String
// Data
// Int
// Double
// Float
// Bool
// Date
