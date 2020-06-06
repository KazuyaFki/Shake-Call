//
//  NextViewController.swift
//  hotlineApp
//
//  Created by Kazuya Fukui on 2020/05/07.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import CoreData

class NextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var nextImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var address:[Address] = []
    
    var telNum = String()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 120
        
        nextImageView.image = UIImage(named: "sky")
        
        nextImageView.contentMode = .scaleAspectFill
        
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2232067585, green: 0.714556694, blue: 1, alpha: 1)
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        getData()
        tableView.reloadData()
        
        
    }
    
    
    @IBAction func tapAdd(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: NSLocalizedString("Add contact", comment: ""), message: NSLocalizedString("Please enter your name and phone number.", comment: ""), preferredStyle:.alert)
        
        //OKボタンを生成
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            //複数のtextFieldのテキストを格納
            guard let textFields:[UITextField] = alert.textFields else {return}
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let add = Address(context: context)
            for textField in textFields {
                //textからテキストを取り出していく
                switch textField.tag {
                case 1: add.name = textField.text!
                case 2: add.telNumber = textField.text!
                self.address.append(add)
                self.tableView.reloadData()
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    
                default: break
                    
                }
            }
            
            
        }
        //OKボタンを追加
        alert.addAction(okAction)
        
        
        //Cancelボタンを生成
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //Cancelボタンを追加
        alert.addAction(cancelAction)
        
        //TextFieldを２つ追加
        alert.addTextField { (text:UITextField!) in
            text.placeholder = NSLocalizedString("Name", comment: "")
            //１つ目のtextFieldのタグ
            text.tag = 1
        }
        alert.addTextField { (text:UITextField!) in
            text.placeholder = NSLocalizedString("Phone number (without hyphen)", comment: "")
            //2つ目のtextFieldのタグ
            text.tag = 2
        }
        
        //アラートを表示
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return address.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 30)
        nameLabel.numberOfLines = 1
        let add = address[indexPath.row]
        nameLabel.text = add.name
        let telNumberLabel = cell.viewWithTag(2) as! UILabel
        telNumberLabel.textColor = .black
        telNumberLabel.font = .boldSystemFont(ofSize: 24)
        telNumberLabel.numberOfLines = 1
        telNumberLabel.text = add.telNumber
        
        let checkImageView = UIImageView(image: UIImage(named: "check2"))
        checkImageView.contentMode = .scaleAspectFit
        //        cellSelectedBgView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1988976884)
        cell.selectedBackgroundView = checkImageView
        
        
        
        return cell
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            address = try context.fetch(Address.fetchRequest())
        }
        catch {
            print("読み込み失敗")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let add = address[indexPath.row]
        telNum = add.telNumber!
        name = add.name!
        
        
        if telNum != nil {
            UserDefaults.standard.set(telNum, forKey: "textNumber")
        }
        
        if name != nil {
            UserDefaults.standard.set(name, forKey: "name")
        }
        
    }
    
    //リストの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let add = address[indexPath.row]
            context.delete(add)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                address = try context.fetch(Address.fetchRequest())
            }
            catch {
                print("読み込み失敗")
            }
        }
        tableView.reloadData()
        
    }
    
    
    
    
}
