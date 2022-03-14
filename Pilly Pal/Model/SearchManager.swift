//
//  SearchManager.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/27/21.
//

import Foundation

protocol SearchManagerDelegate {
    func didSearchedDrug(searched: SearchModel)
    
}

struct SearchManager {
    
    var deleagte: SearchManagerDelegate?
    
    let searchURL = "https://api.fda.gov/drug/drugsfda.json"
    
    func searchDrug (drugName: String){
        let urlString = "\(searchURL)?search=\(drugName)"
        performResquest(urlString: urlString)
    }
    
    func performResquest (urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let searched = parsJSON(drugData: safeData){
                        self.deleagte?.didSearchedDrug(searched: searched)
                    }
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parsJSON(drugData: Data) -> SearchModel?{
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(SearchData.self, from: drugData)
            let brandName = decodedData.results[0].openfda.brand_name[0]
            let genericName = decodedData.results[0].openfda.generic_name[0]
            let manufactorerName = decodedData.results[0].openfda.manufacturer_name[0]
            let productType = decodedData.results[0].openfda.product_type[0]
            let route = decodedData.results[0].openfda.route[0]
            
            let searched = SearchModel(brandName: brandName, genericName: genericName, manunfactorerName: manufactorerName, productType: productType, route: route)
            return searched
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
    
}
