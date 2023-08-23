//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Franco Pecci on 2023-08-23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        getCharacters()
    }
            
    func getCharacters() {
        ApiProvider.shared.getAllCharacters { characters in
            self.characters = characters
            self.table.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Character", for: indexPath) as! TableViewCell
        let char = characters[indexPath.row]
        
        cell.configure(with: char)
        
        return cell
    }
}
