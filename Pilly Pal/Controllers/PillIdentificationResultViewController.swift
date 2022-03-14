//
//  PillIdentificationResultViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 8/14/21.
//

import UIKit

class PillIdentificationResultViewController: UIViewController, PillSearchManagerDelegate {
    func didSearchedPill(searched: PillSearchModel) {
        DispatchQueue.main.async{
            self.nameLabel.text = searched.name
            self.imageName = searched.imageUrl
            self.loadImage(with: self.imageName)
        }
    }
    

    var imprint = ""
    var color = ""
    var shape = ""
    var imageName = ""
    var pillSearchManager = PillSearchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pillSearchManager.deleagte = self
        pillSearchManager.searchPill(imprint: imprint, color: color, shape: shape)
        
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pillImage: UIImageView!
    


    func loadImage(with address: String) {

        // Perform on background thread
        DispatchQueue.global().async {

            // Create url from string address
            guard let url = URL(string: address) else {
                return
            }

            // Create data from url (You can handle exeption with try-catch)
            guard let data = try? Data(contentsOf: url) else {
                return
            }

            // Create image from data
            guard let pImage = UIImage(data: data) else {
                return
            }

            // Perform on UI thread
            DispatchQueue.main.async {
                self.pillImage.image = pImage
            }
        }
    }

}
