//
//  ViewController.swift
//  User Default Login Uygulamasi
//
//  Created by Şimal Çeler on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfieldkullaniciAdi: UITextField!
    
    @IBOutlet weak var textfieldsifre: UITextField!
    
    let d = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ka = d.string(forKey: "kullaniciAdi") ?? "bos"
        let s = d.string(forKey: "sifre") ?? "bos"
        
        if ka != "bos" && s != "bos" {
            performSegue(withIdentifier: "girisToanasayfa", sender: nil)
        }
        
    }

    @IBAction func girisYap(_ sender: Any) {
        
        if let ka = textfieldkullaniciAdi.text , let s = textfieldsifre.text {
            
            if ka == "admin" && s == "123456" {
                
                d.set(ka, forKey: "kullaniciAdi")
                d.set(s, forKey: "sifre")
                
                performSegue(withIdentifier: "girisToanasayfa", sender: nil)
                
            }else{
                print("Hatalı Giriş")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

