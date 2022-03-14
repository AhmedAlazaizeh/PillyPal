//
//  PillSearchManager.swift
//  Pilly Pal
//
//  Created by ΛZ on 8/14/21.
//

import Foundation

protocol PillSearchManagerDelegate {
    func didSearchedPill(searched: PillSearchModel)
    
}

struct PillSearchManager {
    
    var deleagte: PillSearchManagerDelegate?
    
    let searchURL = "https://rximage.nlm.nih.gov/api/rximage/1/rxnav"
    
    func searchPill (imprint: String, color: String, shape: String){
        let urlString = "\(searchURL)?color=\(color)&imprint=\(imprint)&shape=\(shape)"
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
                    if let searched = parsJSON(pillData: safeData){
                        self.deleagte?.didSearchedPill(searched: searched)
                    }
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parsJSON(pillData: Data) -> PillSearchModel?{
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PillSearchData.self, from: pillData)
            let name = decodedData.nlmRxImages[0].name
            let imageUrl = decodedData.nlmRxImages[0].imageUrl
            
            let searched = PillSearchModel(name: name, imageUrl: imageUrl)
            return searched
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
    
}
