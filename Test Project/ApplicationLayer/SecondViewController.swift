//
//  SecondViewController.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController, IRepoServices {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bioInfo: UILabel!
    @IBOutlet weak var emailInfo: UILabel!
    @IBOutlet weak var companyInfo: UILabel!
    @IBOutlet weak var repositoryList: UITableView!
    
    var userNamePassed: String = "";
    var receivedData: [RepoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repositoryList.delegate = self;
        self.repositoryList.dataSource = self;
        self.repositoryList.registerCellNib(RepositoryTableViewCell.self);
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        RepoServices().GetProfile(userNamePassed, self);
        RepoServices().GetRepos(userNamePassed, self);
    }
    
    //fill repository Info
    func repoListReceived(_ result: [RepoModel]) {
        self.receivedData = result;
        self.repositoryList.reloadData();
    }
    
    //fill profile Info
    func profileReceived(_ result: ProfileModel) {
        
        self.userName.text = result.username;
        self.bioInfo.text = result.bio;
        self.emailInfo.text = result.email;
        self.companyInfo.text = result.company;
        
        let url = URL(string: result.profileImage)
        self.profileImage.kf.setImage(with: url)
    }
    
    func errorReceived(_ result: String) {
        print(result);
    }

}

//MARK: TableView Delegate and Data source

extension SecondViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return RepositoryTableViewCell().height();
    }
}

extension SecondViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.receivedData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier) as! RepositoryTableViewCell
        
        cell.setData(receivedData[indexPath.row].repoName, receivedData[indexPath.row].creationDate);
        return cell
    }
}
