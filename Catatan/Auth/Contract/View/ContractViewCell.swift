//
//  ContractViewCell.swift
//  Catatan
//
//  Created by apple on 2024/3/11.
//

import UIKit

class ContractViewCell: UITableViewCell {

    var model: IncomesModel! {
        didSet {
            nameLabel.text = model.yearly
            nameLabel1.text = "Relasi"
            nameLabel2.text = "Nama"
            nameLabel3.text = "Nomor telepon"
            nameLabel4.text = "Sila Pilih"
            nameLabel5.text = "Silakan Masukkan"
            nameLabel6.text = "Silakan Masukkan"
        }
    }
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 18.pix()
        return bgView
    }()
    
    lazy var lineView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(TITLE_COLOR)
        return bgView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .medium), textColor: .black, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var nameLabel1: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: .black, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var nameLabel2: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: .black, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var nameLabel3: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: .black, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var nameLabel4: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .right)
        return nameLabel
    }()
    
    lazy var nameLabel5: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .right)
        return nameLabel
    }()
    
    lazy var nameLabel6: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .right)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(nameLabel1)
        bgView.addSubview(lineView)
        bgView.addSubview(nameLabel2)
        bgView.addSubview(nameLabel3)
        bgView.addSubview(nameLabel4)
        bgView.addSubview(nameLabel5)
        bgView.addSubview(nameLabel6)
        
        bgView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView).offset(16.pix())
            make.centerX.equalTo(contentView)
            make.height.equalTo(163.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(16.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(22.pix())
        }
        nameLabel1.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(14.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(22.pix())
        }
        lineView.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(1.pix())
            make.top.equalTo(nameLabel1.snp.bottom).offset(14.pix())
        }
        nameLabel2.snp.makeConstraints { make in
            make.top.equalTo(nameLabel1.snp.bottom).offset(29.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(22.pix())
        }
        nameLabel3.snp.makeConstraints { make in
            make.top.equalTo(nameLabel2.snp.bottom).offset(6.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(22.pix())
        }
        nameLabel4.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(14.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.height.equalTo(22.pix())
        }
        nameLabel5.snp.makeConstraints { make in
            make.top.equalTo(nameLabel1.snp.bottom).offset(29.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.height.equalTo(22.pix())
        }
        nameLabel6.snp.makeConstraints { make in
            make.top.equalTo(nameLabel2.snp.bottom).offset(6.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.height.equalTo(22.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
