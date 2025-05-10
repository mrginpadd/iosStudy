//
//  CusExtensionViewController.swift
//  ios_study_bool
//
//  Created by xushihao on 2025/1/1.
//

import UIKit

class CusExtensionViewController: UIViewController, IntroductionViewControllerDelegate {
    func buttonClicked(withTitle title: String) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        let vc = IntroductionViewController.init();
        self.view.addSubview(vc.view);
        vc.didMove(toParent: self);
        self.addChild(vc);
        vc.delegate = self;
        
        vc.introTitleLabel.text = "Extension介绍";
        vc.introContentLabel.text = """
        
        """;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
