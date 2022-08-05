//
//  SearchTableViewCell.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/04/10.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    var image = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MjdfNTMg%2FMDAxNjIyMDY4NTY2NjE1.gruqSPjmPfwMvnSzcxwgmFJM7hvYhhMIF9IjJIessr0g.TUlj5g91X1cpdQlO2KwlrdlHwijEvw1J57CEDLRxl4Yg.JPEG.chaechae0517%2F20200921%25A3%25DF161727.jpeg&type=sc960_832"
    
    var thumbnailImageView: UIImageView?
    var playImage: UIImageView?
    var titleLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImage()
        configurePlay()
        configureTitle()
    }
    
    private func configureImage(){
        let imageView = UIImageView()
        self.addSubview(imageView)
        self.thumbnailImageView = imageView
        if let url = URL(string: self.image) {
            imageView.sd_setImage(with: url, completed: .none)
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        imageView.layer.cornerRadius = 8
    }
    
    private func configurePlay(){
        let imageView = UIImageView(image: UIImage(systemName: "play.circle"))
        self.playImage = imageView
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 44),
            imageView.heightAnchor.constraint(equalToConstant: 44),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func configureTitle(){
        let label = UILabel()
        label.text = "dddddd"
        addSubview(label)
        self.titleLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.imageView?.trailingAnchor ?? self.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.playImage?.trailingAnchor ?? self.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        label.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
