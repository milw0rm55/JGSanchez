//
//  ViewControllerCarga.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 10/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewControllerCarga: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       Auth.auth().addStateDidChangeListener  { (auth, user) in
            if((user) != nil){
                DataHolder.sharedInstance.sId = (user?.uid)!
                self.performSegue(withIdentifier: "trExito", sender: self)
                print(user?.uid)
                let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("users").document((user?.uid)!)
                refPerfil?.getDocument{ (document, error) in
                    if(document != nil){
                        print(document?.data())
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(DataHolder.sharedInstance.miPerfil.sNombre)
                        
                    }
                }
            }else{
                self.performSegue(withIdentifier: "trError", sender: self)
            }
 
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
