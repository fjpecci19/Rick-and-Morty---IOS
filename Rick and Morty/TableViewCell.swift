//
//  TableViewCell.swift
//  Rick and Morty
//
//  Created by Franco Pecci on 2023-08-23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    
    func configure(with character: Character) {
        name.text = character.name
        status.text = character.status
        species.text = character.species
        
        DispatchQueue.global().async {
            if let imageURL = URL(string: character.image), let imageData = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.imagen.image = UIImage(data: imageData)
                }
            }
        }
    }
}
