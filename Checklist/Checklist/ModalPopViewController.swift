//
//  ModalPopViewController.swift
//  Checklist
//
//  Created by Jannie on 3/28/18.
//  Copyright © 2018 Jannie. All rights reserved.
//

import SnapKit
import UIKit

protocol AddButtonDelegate {
    func addButtonPressed(withName name: String)
}

class ModalPopViewController: UIViewController {
    
    var companyNameLabel: UILabel!
    var companyName: UITextField!
    
    var companyTextLabel: UILabel!
    var companyText: UITextField!
    
    var addButton: UIButton!
    var cancelButton: UIButton!
    
    var delegate: AddButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        companyNameLabel = UILabel()
        companyName = UITextField()
        companyTextLabel = UILabel()
        companyText = UITextField()
        addButton = UIButton()
        cancelButton = UIButton()
        
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        companyText.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.green, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        companyName.backgroundColor = .white
        companyName.text = "enter a new task"
        
        view.addSubview(companyName)
        view.addSubview(companyText)
        view.addSubview(addButton)
        view.addSubview(cancelButton)
        
        //add constraints
        
        NSLayoutConstraint.activate([
            companyName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            companyName.widthAnchor.constraint(equalToConstant: companyName.intrinsicContentSize.width)
            ])
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 16),
            addButton.widthAnchor.constraint(equalToConstant: addButton.intrinsicContentSize.width)
            ])
        NSLayoutConstraint.activate([
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16),
            cancelButton.widthAnchor.constraint(equalToConstant: cancelButton.intrinsicContentSize.width)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addButtonPressed() {
        view.backgroundColor = .yellow
        if let name = companyName.text {
            delegate?.addButtonPressed(withName: name)
        }
    }
    
    @objc func cancelButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
