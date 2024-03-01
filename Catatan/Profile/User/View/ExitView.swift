//
//  ExitView.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

class ExitView: UIView {
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12.pix()
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let label =  UILabel.createLabel(font: UIFont.systemFont(ofSize: 16, weight: .semibold), textColor: UIColor("#000000"), textAlignment: .center)
        label.text = "Apakah Anda yakin untuk logout?"
        return label
    }()
    
    lazy var sureBtn: UIButton = {
        let button = UIButton()
        button.tag = 100
        button.layer.cornerRadius = 20.pix()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor("#FFFFFF")
        button.setTitle("Konfirmasi", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(sureBtnClick(_:)), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor("#BBD598").cgColor
        return button
    }()
    
    lazy var cancelBtn: UIButton = {
        let button = UIButton()
        button.tag = 101
        button.layer.cornerRadius = 20.pix()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor("#BBD598")
        button.setTitle("Batal", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(sureBtnClick(_:)), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor("#BBD598").cgColor
        return button
    }()
    
    var block: (() -> Void)?
    var cblock: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(descLabel)
        bgView.addSubview(sureBtn)
        bgView.addSubview(cancelBtn)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.left.equalTo(self).offset(26.pix())
            make.height.equalTo(190.pix())
        }
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(bgView).offset(46)
            make.left.equalTo(bgView).offset(33)
        }
        cancelBtn.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(48)
            make.left.equalTo(bgView).offset(20)
            make.size.equalTo(CGSize(width: 128, height: 40))
        }
        sureBtn.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(48)
            make.right.equalTo(bgView).offset(-20)
            make.size.equalTo(CGSize(width: 128, height: 40))
        }
    }
    
    //确认点击方法
    @objc func sureBtnClick(_ mbtn: UIButton) {
        let sbtn = viewWithTag(100) as! UIButton
        let btn = viewWithTag(101) as! UIButton
        if mbtn.tag == 100 {
            mbtn.backgroundColor = UIColor("#BBD598")
            mbtn.setTitle("Konfirmasi", for: .normal)
            mbtn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor("#FFFFFF")
            btn.setTitle("Batal", for: .normal)
            btn.setTitleColor(UIColor("#000000"), for: .normal)
            block?()
        } else {
            mbtn.backgroundColor = UIColor("#BBD598")
            mbtn.setTitle("Batal", for: .normal)
            mbtn.setTitleColor(UIColor.white, for: .normal)
            sbtn.backgroundColor = UIColor("#FFFFFF")
            sbtn.setTitle("Konfirmasi", for: .normal)
            sbtn.setTitleColor(UIColor("#000000"), for: .normal)
            cblock?()
        }
    }
}
