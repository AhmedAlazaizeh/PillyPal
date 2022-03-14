//
//  SearchResultViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/27/21.
//

import UIKit

class SearchResultViewController: UIViewController, SearchManagerDelegate {
    func didSearchedDrug(searched: SearchModel) {
        DispatchQueue.main.async{
            
            self.brandNameLabel.text = searched.brandName
            self.genericNameLabel.text = searched.genericName
            self.productTypeLabel.text = searched.productType
            self.routeLabel.text = searched.route
            self.manufactorerNameLabel.text = searched.manunfactorerName
            
        }
    }
    
    var searchManager = SearchManager()
    var drugName = ""
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var genericNameLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var manufactorerNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchManager.deleagte = self
        searchManager.searchDrug(drugName: drugName)
    }
}
