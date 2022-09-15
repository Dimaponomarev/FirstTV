//
//  cellForFirstViewControllerTableViewCell.swift
//  FirstTableView
//
//  Created by Дмитрий Пономарев on 06.09.2022.
//

import UIKit

class cellForFirstViewControllerTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //MARK: - UI properties
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    var image = UIImageView()
    
    
    
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureView(_ model: DataForCell) {
        nameLabel.text = model.mainTitle
        surnameLabel.text = model.subTitle
        image.image = UIImage(named: "\(model.image)")
        
    }
    
}

//MARK: - Private methods

private extension cellForFirstViewControllerTableViewCell {
    
    //MARK: - Setup
    
    func setup() {
        addViews()
        makeConstraints()
        setupViews()
    }
    
    //MARK: - addViews
    
    func addViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(surnameLabel)
        contentView.addSubview(image)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        nameLabel.snp.makeConstraints {
            $0 .top.equalToSuperview().inset(20)
            $0 .left.equalTo(image.snp.right).offset(20)
            $0 .right.equalToSuperview().inset(20)
        }
        surnameLabel.snp.makeConstraints{
            $0 .top.equalTo(nameLabel.snp.bottom).offset(5)
            $0 .bottom.equalToSuperview().inset(10)
            $0 .left.equalTo(image.snp.right).offset(20)
            $0 .right.equalToSuperview().inset(20)
        }
        image.snp.makeConstraints{
            $0 .left.equalTo(10)
            $0 .size.equalTo(70)
            $0 .centerY.equalToSuperview()
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 30)
        surnameLabel.font = .systemFont(ofSize: 20)
        surnameLabel.textColor = .black
        surnameLabel.numberOfLines = 0
        surnameLabel.textAlignment = .center
        image.layer.cornerRadius = bounds.height / 1.3
        image.clipsToBounds = true
    }
}
