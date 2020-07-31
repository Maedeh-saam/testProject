//
//  RepositoryTableViewCell.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    class var identifier: String { return String.className(self) }
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func height() -> CGFloat {
        return 90;
    }
    
    func setData(_ repoName: String, _ creationDate: String){
        self.repoName.text = repoName;
        self.creationDate.text = creationDate;
    }
    
}
