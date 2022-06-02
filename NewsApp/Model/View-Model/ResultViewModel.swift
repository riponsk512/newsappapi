//
//  ResultViewModel.swift
//  NewsApp
//
//  Created by Ripon sk on 01/06/22.
//

import Foundation
import UIKit
import Alamofire
class ResultViewModel{
    weak var vc:ViewController!
    var articles = [Articles]()
    let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e115e6ab261f450f96461da99307275c"

    func getalldatausingalamo(){
        
//        if vc.table.refreshControl?.isRefreshing == true{
//            print("refreshing data")
//        }
//        else{
//            print("frtching data")
//        }
        AF.request(url).responseJSON { [self] (response) in
            // Mark
            do{
                let result = try JSONDecoder().decode(Results.self, from: response.data!)
                articles = result.articles!
             
                  
                    self.articles.append(contentsOf: articles)
                    
                DispatchQueue.main.async {
                  
                    vc.table.reloadData()
                }
                
            }
            catch{
                
            }
        }
    }
    
    
    
    
}
