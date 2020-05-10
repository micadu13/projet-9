//
//  TranslateVC.swift
//  Projet 9
//
//  Created by Michael Aidan on 31/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import UIKit

class TranslateVC: UIViewController {
    
    func showerror() {
        
        let alert = UIAlertController(title: "Erreur", message: "Nothing to translate", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var textToBeTranslated: UITextField!
    
    @IBAction func Totranslate(_ sender: Any) {
        guard let text = textToBeTranslated.text else {
            return
        }
        let whenFinish: (Bool, Translate?) -> Void = { (success, translate) in
            
            if success == true{
                let theText = translate?.data.translations[0].translatedText
                self.textTranslated.text = theText
            }
            else {
                self.showerror()
            }
        }
        TranslateService.gettranslation(textToTranslate: text, completionHandler: whenFinish)
        
    }
    @IBOutlet weak var textTranslated: UITextField!
    
    
    
    
}

