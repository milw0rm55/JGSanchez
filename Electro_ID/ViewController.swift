//
//  ViewController.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 15/3/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, DataHolderDelegate {

    @IBOutlet var
    user:UITextField?
    
    @IBOutlet var
     code:UITextField?
    
    @IBOutlet var
     btn:UIButton?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user != nil{
                
            }
        }
        //code?.placeholder = "Codigo"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func descargarLogin(blnFin: Bool) {
        if blnFin{
            self.performSegue(withIdentifier: "tlogin", sender: self)
            
        }
    }
    
    func loguearse() {
        DataHolder.sharedInstance.descargaLogin(user: (user?.text)!, code:(code?.text)!, delegate: self)
        
    }

    @IBAction
    func login(){
       loguearse()
      /*
        Auth.auth().signIn(withEmail: (user?.text)!, password:(code?.text)!){ (user, error) in
            if (user != nil){
                print("Registrado")
                self.performSegue(withIdentifier: "trlogin", sender: self)
                DataHolder.sharedInstance.sId = (user?.uid)!
                let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("users").document((user?.uid)!)
                refPerfil?.getDocument{ (document, error) in
                    if(document != nil){
                        print(document?.data())
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(DataHolder.sharedInstance.miPerfil.sNombre)
                    }
                }
            }else{
                print("Error: ")
                print(error!)
                
            }
}
*/

}
}
