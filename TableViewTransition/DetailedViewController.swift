//
//  DetailedViewController.swift
//  TableViewTransition
//
//  Created by Artur on 31/08/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var actor: Actor?
    var cellHeight: CGFloat = 0

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var wikiButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupButtons()
        textView.isEditable = false
    }
    
    func setupTableView() {
        tableViewHeight.constant = cellHeight
        tableView.isUserInteractionEnabled = false
        tableView.register(UINib(nibName: "ActorTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "actorCell")
    }
    
    func setupButtons() {
        for button in buttons {
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1.5
            button.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

    @IBAction func backTapped(_ sender: Any) {
         self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func wikiTapped(_ sender: Any) {
        guard let actor = actor else { return }
        guard let url = actor.wikiUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
}


extension DetailedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorTableViewCell
        if let actor = actor {
            cell.configure(with: actor)
            textView.text = actor.biography
        }
        return cell
    }
    
    
}



