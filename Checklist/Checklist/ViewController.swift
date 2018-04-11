//
//  ViewController.swift
//  Checklist
//
//  Created by Jannie on 3/2/18.
//  Copyright © 2018 Jannie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddButtonDelegate {
    
    let firstItem = Item(title: "ecaft work", isCompleted: false)
    let secondItem = Item(title: "laundry", isCompleted: false)
    let reuseIdentifier = "checklistCell"
    
    var items: [Item] = []
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Checklist"
        view.backgroundColor = .white
        
        items.append(firstItem)
        items.append(secondItem)
        
        tableView = UITableView()
        tableView.bounces = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChecklistTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(tableView)
        setupConstraints()
        
        //add navigation bar + button
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(plusButtonPressed))
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.width.height.bottom.equalTo(view)
        }
    }
    
    @objc func plusButtonPressed() {
        let mpVC = ModalPopViewController()
        mpVC.delegate = self
        present(mpVC, animated: true, completion: nil)
    }
    
    func addButtonPressed(withName name: String) {
        let newItem = Item(title: name, isCompleted: false)
        items.append(newItem)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! ChecklistTableViewCell
        
        cell.checklistLabel.text = items[indexPath.row].title
        cell.checklistButton.setTitle("check", for: .normal)
        cell.checklistButton.setTitleColor(.blue, for: .normal)
        
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    //delegate function that will work when we select the row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row].title)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //delete by swipe stuff
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}


