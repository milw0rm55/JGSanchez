//
//  ViewControllerTable.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 5/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewControllerTable: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
   
    @IBOutlet
    var tabla:UITableView?
  
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarUsuarios(delegate: self)
        //in
        //    if err != nil{
        //        print("Error consiguiendo los documentos")
        //    }else{
        //        for document in querySnapshot!.documents{
        //            perfil.setMap(valores: document.data())
        //            self.arPerfiles.append(perfil)
         //
           //         print("\(document.documentID) => \(document.data())")
            //
              //  }
              //  print("----->>>>>  ",self.arPerfiles.count)
               // self.tabla?.reloadData()
            }
    
        // Do any additional setup after loading the view.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("CONSULTA CANTIDAD DATOS A PINTAR ",DataHolder.sharedInstance.arPerfiles.count)
        let miCelda:CeldaTableViewCell = tableView.dequeueReusableCell(withIdentifier:"miCelda") as! CeldaTableViewCell
        miCelda.miLabel?.text = DataHolder.sharedInstance.arPerfiles[indexPath.row].sNombre
        return miCelda
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Contando " , DataHolder.sharedInstance.arPerfiles.count)
     return DataHolder.sharedInstance.arPerfiles.count
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DescargarUsuario(blnFin: Bool) {
        if blnFin == true {
            self.refreshUI()
        }
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tabla?.reloadData()
            
        })
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


