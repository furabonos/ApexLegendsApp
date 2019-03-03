//
//  SearchViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 2..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    //UI
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var platformBtn: UIButton!
    @IBOutlet weak var seasonBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    //VC
    var platformViewController = PlatformViewController()
    var seasonViewController = SeasonViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func setupInitialize() {
        
        platformBtn.layer.cornerRadius = 10
        seasonBtn.layer.cornerRadius = 10
        searchBtn.layer.cornerRadius = 10
        
        platformBtn.backgroundColor = .red
        seasonBtn.backgroundColor = .red
        searchBtn.backgroundColor = .red
        
        NotificationCenter.default.addObserver(self, selector: #selector(setPlatformTitle(notification:)), name: Notification.Name("platformTitle"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSeasonTitle(notification:)), name: Notification.Name("seasonTitle"), object: nil)
        
        platformBtn.snp.makeConstraints { (m) in
            m.width.equalTo(80)
            m.height.equalTo(30)
            m.top.equalTo(bgImageView.snp.top).offset(40)
            m.left.equalTo(view.snp.left).offset(10)
        }
        seasonBtn.snp.makeConstraints { (m) in
            m.width.equalTo(80)
            m.height.equalTo(30)
            m.top.equalTo(bgImageView.snp.top).offset(40)
            m.left.equalTo(platformBtn.snp.right).offset(10)
        }
        
        textField.snp.makeConstraints { (m) in
            m.width.equalTo(120)
            m.height.equalTo(30)
            m.top.equalTo(seasonBtn.snp.top)
            m.left.equalTo(seasonBtn.snp.right).offset(10)
        }
        
        searchBtn.snp.makeConstraints { (m) in
            m.width.equalTo(80)
            m.height.equalTo(30)
            m.top.equalTo(textField.snp.top)
            m.left.equalTo(textField.snp.right).offset(10)
        }
        
        
    }
    
    //Popover Notification
    @objc func setPlatformTitle(notification: Notification) {
        guard let notificationInfo = notification.userInfo as? [String: String] else { return }
        guard let platformTitle = notificationInfo["title"] else { return }
        platformBtn.setTitle(platformTitle, for: .normal)
        
    }
    
    @objc func setSeasonTitle(notification: Notification) {
        guard let notificationInfo = notification.userInfo as? [String: String] else { return }
        guard let platformTitle = notificationInfo["title"] else { return }
        seasonBtn.setTitle(platformTitle, for: .normal)
        
    }

    //Button Action
    @IBAction func platformBtnClick(_ sender: Any) {
        DispatchQueue.main.async {
            self.platformViewController.makePopover(sender: self.platformBtn)
        }
    }
    
    @IBAction func seasonBtnClick(_ sender: Any) {
        DispatchQueue.main.async {
            self.seasonViewController.makePopover(sender: self.seasonBtn)
        }
    }
    
    @IBAction func searchBtnClick(_ sender: Any) {
        guard let platform = platformBtn.title(for: .normal) else { return }
//        guard let season = seasonBtn.title(for: .normal) else { return }
        guard let id = textField.text else { return }
//        print("platform = \(platform), season = \(season), id = \(id)")
    }
    
}