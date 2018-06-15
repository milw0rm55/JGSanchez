//
//  ViewControllerRegistro.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 3/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import Firebase


class ViewControllerRegistro: UIViewController, DataHolderDelegate {
    @IBOutlet var
    nombre:UITextField?
    
    @IBOutlet var
    Edad:UITextField?
    
    @IBOutlet var
    email:UITextField?
    
    @IBOutlet var
    pass:UITextField?
    
    @IBOutlet var
    passconfirm:UITextField?
    
    @IBOutlet var
    button:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction
    func confirmar(){
        if pass?.text == passconfirm?.text {
            registrar()
        }
    }
    func registrar(blnFin: Bool) {
        if blnFin{
            self.performSegue(withIdentifier: "transicionregistro", sender: self)
        }
    }
    func registrar(){
        DataHolder.sharedInstance.registrar(user: (email?.text)!, pass: (pass?.text)!, Delegate: self)
        DataHolder.sharedInstance.miPerfil.sNombre = self.nombre?.text
        DataHolder.sharedInstance.miPerfil.iEdad = Int((self.Edad?.text)!)
        DataHolder.sharedInstance.miPerfil.sMail = self.email?.text
      // DataHolder.sharedInstance.miPerfil.sId = (user?.uid)
        /*
        Auth.auth().createUser(withEmail: (email?.text)!, password: (pass?.text)!){ (user, error) in
            if (user != nil){
                // Add a new document with a generated ID
                DataHolder.sharedInstance.miPerfil.sNombre = self.nombre?.text
                DataHolder.sharedInstance.miPerfil.iEdad = Int((self.Edad?.text)!)
                DataHolder.sharedInstance.miPerfil.sMail = self.email?.text
                DataHolder.sharedInstance.miPerfil.sId = (user?.uid)
                DataHolder.sharedInstance.firestoreDB?.collection("users").document(DataHolder.sharedInstance.miPerfil.sId!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                self.performSegue(withIdentifier: "transicionregistro", sender: self)
 
                
            }else{
                print("Error: ")
                print(error!)
                
            }
        }
         */
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


