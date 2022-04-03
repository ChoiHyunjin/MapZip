//
//  HeaderView.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/09.
//

import UIKit

class HeaderView: UIView {
    
    private let detailButton : UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        button.configuration = config
        button.tintColor = .white
        button.setTitle("자세히 보기", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let headerView: UIImageView = {
        let iu = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MjdfNTMg%2FMDAxNjIyMDY4NTY2NjE1.gruqSPjmPfwMvnSzcxwgmFJM7hvYhhMIF9IjJIessr0g.TUlj5g91X1cpdQlO2KwlrdlHwijEvw1J57CEDLRxl4Yg.JPEG.chaechae0517%2F20200921%25A3%25DF161727.jpeg&type=sc960_832"
        let shortcut = "https://mblogthumb-phinf.pstatic.net/MjAxODAzMjZfNDQg/MDAxNTIyMDUxNDM3MzI3.PPoUVA8HHdm_NpVU9qE02VuPb5MbBMGvkzYgKVNjpqog.nmc1TR8R8r-bik5iAJuNafCXlOPo0oZbWX0PAto-boog.PNG.vneld97/%25E3%2585%258E6.png?type=w800"
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if let url = URL(string: shortcut) {
            imageView.sd_setImage(with: url, completed: .none)
        }
        return imageView
    }()
    
    private func addGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor,
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        addGradient()
        
        addSubview(detailButton)
        detailButton.contentHorizontalAlignment = .center
        applyContraints()
    }
    
    func applyContraints(){
        let detailButtonContraints = [
            detailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
//            detailButton.widthAnchor.constraint(equalToConstant: 100)
            detailButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(detailButtonContraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerView.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func load(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.reloadInputViews()
                    }
                }
            }
        }
    }
}
