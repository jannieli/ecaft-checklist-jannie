//
//  ChecklistTableViewCell.swift
//  Checklist
//
//  Created by Jannie on 3/7/18.
//  Copyright © 2018 Jannie. All rights reserved.
//

import SnapKit
import UIKit

class ChecklistTableViewCell: UITableViewCell {
    
    var checklistLabel: UILabel!
    var checklistButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        checklistLabel = UILabel()
        checklistButton = UIButton()
        
        checklistLabel.translatesAutoresizingMaskIntoConstraints = false
        checklistButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(checklistLabel)
        contentView.addSubview(checklistButton)
    }
    
    override func updateConstraints() {
        checklistLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
            make.width.equalTo(checklistLabel.intrinsicContentSize.width)
        }
        
        checklistButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.width.equalTo(checklistButton.intrinsicContentSize.width)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        super.updateConstraints()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
