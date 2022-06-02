//
//  ViewController.swift
//  NewsApp
//
//  Created by Ripon sk on 01/06/22.
//

import UIKit
import Alamofire
import SDWebImage


class ViewController: UIViewController {
    
    let refersh = UIRefreshControl()
    @IBOutlet weak var table: UITableView!
    var resultmodelview = ResultViewModel()
    override func viewDidLoad() {
        table.tableFooterView = UIView()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        resultmodelview.vc = self
        resultmodelview.getalldatausingalamo()
        refreshcontrollersetup()
        
    }
   
       
       
        
        
    }


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultmodelview.articles.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell
        let arr = resultmodelview.articles[indexPath.row]
        let url = URL(string: arr.urlToImage!)
        cell?.author.text = arr.author?.description
        cell?.title.text = arr.title
        cell?.newsdes.text = arr.descriptions?.description
        cell?.imgv.loadimage(from: url!)
                
                
            
        
            
        return cell!;
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrdata = resultmodelview.articles[indexPath.row]
        let descriptionviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "descriptiondetails") as? DescriptionViewController
        descriptionviewcontroller?.decriptionurl = arrdata.url!
       
        self.navigationController?.pushViewController(descriptionviewcontroller!, animated: true)
        
        
    }
        
}
extension ViewController{
    func refreshcontrollersetup(){
        table.refreshControl = refersh
        refersh.tintColor = .green
        refersh.attributedTitle = NSAttributedString(string: "Loading", attributes: [.font:UIFont(name: "kefa", size: 20)])
        refersh.addTarget(self, action: #selector(pulltorefresh), for: .valueChanged)
        
    }
    @objc func pulltorefresh(){
        resultmodelview.articles.removeAll()
        //print("start refreshing")
        refersh.beginRefreshing()
       
            DispatchQueue.main.async{[self] in
                resultmodelview.getalldatausingalamo()
                table.reloadData()
                refersh.endRefreshing()
            
        }
}
}


       

    
   

