//
//  ViewController.swift
//  TableViewTransition
//
//  Created by Artur on 31/08/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellHeight: CGFloat = 110
    var yOffset: CGFloat = 0
    var actors = [Actor]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actors = readActorsPlist()
        tableView.register(UINib(nibName: "ActorTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "actorCell")
        animatedAppearence()
    }
    
    func readActorsPlist() -> [Actor] {
        var actors = [Actor]()
        if let path = Bundle.main.path(forResource: "Actors", ofType: "plist"), let plistArray = NSArray(contentsOfFile: path) as? [[String: Any]] {
            for dict in plistArray {
                let actor = Actor(dict as NSDictionary)
                actors.append(actor)
            }
        }
        return actors
    }
    
    func animatedAppearence() {
        let trans = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
        tableView.transform = trans
        UIView.animate(withDuration: 1) {
            let trans = CGAffineTransform(translationX: 0, y: 0)
            self.tableView.transform = trans
        }
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        detailedVC.cellHeight = cellHeight
        detailedVC.actor = actors[indexPath.row]
        detailedVC.yOffset = tableView.rectForRow(at: indexPath).minY - yOffset
        present(detailedVC, animated: false, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorTableViewCell
        cell.configure(with: actors[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        yOffset = scrollView.contentOffset.y
    }
    
    
}
