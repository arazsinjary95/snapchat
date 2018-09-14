//
//  UserVC.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/13/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var users = [User]()
    private var selectedUsers = Dictionary<String, User>()
    
    private var _snapData: Data?
    private var _videoRUL: URL?
    
    var snapData: Data? {
        set {
            _snapData = newValue
        } get {
         return _snapData
        }
    }
    
    var videoURL: URL? {
        set {
            _videoRUL = newValue
        } get {
            return _videoRUL
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true

        navigationItem.rightBarButtonItem?.isEnabled = false
        
        DataService.instance.usersRef.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            //print("Snap: \(snapshot.debugDescription)")
            
            if let users = snapshot.value as? Dictionary<String, AnyObject> {
                for (key, value) in users {
                    if let dict = value as? Dictionary<String, AnyObject> {
                        if let profile = dict["profile"] as? Dictionary<String, AnyObject> {
                            if let firstName = profile["firstName"] as? String {
                                let uid = key
                                let user = User(firstName: firstName, uid: uid)
                                self.users.append(user)
                            }
                        }
                    }
                }
            }
            
            self.tableView.reloadData()
            print("Users:\(self.users)")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        let user = users[indexPath.row]
        cell.updateUI(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.rightBarButtonItem?.isEnabled = true
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckMark(selected: true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckMark(selected: false)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = nil
        
        if selectedUsers.count <= 0 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @IBAction func sendPRBtnPressed(sender: AnyObject) {
        
        if let url = _videoRUL {
            let videoName = "\(NSUUID().uuidString)\(url)"
            let ref = DataService.instance.videoStorageRef.child(videoName)
            
            _ = ref.putFile(from: url, metadata: nil) { (meta: StorageMetadata?, err:Error?) in
                
                    guard let meta = meta else {
                        return print("Error uploading video: \(err?.localizedDescription)")
                    }
                ref.downloadURL(completion: { (url, error) in
                    guard let downloadURL = url else {
                        //as error occurred!
                        //save this somewhere
                        print("Download URL: \(url!)")
                        
                        DataService.instance.sendMediaPullRequest(senderUID: Auth.auth().currentUser!.uid, sendingTo: self.selectedUsers, mediaURL: url!, textSnippet: "Coding today was LEGIT!")
                        
                        return
                    }
                })
            }
            self.dismiss(animated: true, completion: nil)
            
        } else if let snap = _snapData {
            let ref = DataService.instance.imagesStorageRef.child("\(NSUUID().uuidString).jpg")
            
            _ = ref.putData(snap, metadata: nil, completion: { (meta: StorageMetadata?, err: Error?) in
                guard let meta = meta else {
                    return print("Error uploading snapshot: \(err?.localizedDescription)")
                }
                
                ref.downloadURL(completion: { (url, error) in
                    guard let downloadURL = url else {
                        
                        return
                    }
                })
            })
            self.dismiss(animated: true, completion: nil)
        }
    }
}













