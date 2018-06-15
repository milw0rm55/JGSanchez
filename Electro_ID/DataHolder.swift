//
//  DataHolder.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 10/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    
    var firestoreDB:Firestore?
    var sId:String? = nil
    var hmImg:[String:UIImage]=[:]
    var arPerfiles:[Perfiles] = []
    var firStorageRef:StorageReference?
    var firStorage:Storage?
    func initFireBase(){
            FirebaseApp.configure()
            firStorage = Storage.storage()
            firStorageRef=firStorage?.reference()
            firestoreDB=Firestore.firestore()
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ",firStorageRef)
        }
    
    var miPerfil:Perfiles = Perfiles()
    
    func descargarUsuarios(delegate:DataHolderDelegate){
        
        DataHolder.sharedInstance.firestoreDB?.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DescargarUsuario!(blnFin: false)
            } else {
                self.arPerfiles=[]
                for document in querySnapshot!.documents {
                    let usuario = Perfiles()
                    usuario.sId=document.documentID
                    usuario.setMap(valores: document.data())
                    self.arPerfiles.append(usuario)
                    print("\(document.documentID) => \(document.data())")
                    
                }
                
                print("----->>>> ",self.arPerfiles.count)
                delegate.DescargarUsuario!(blnFin: true)
            }
            //self.tbMiTabla?.reloadData()
        }
        
    }
    func registrar(user:String,pass:String,Delegate:DataHolderDelegate) {
        Auth.auth().createUser(withEmail: user, password: pass){ (user, error) in
            if (user != nil){
                // Add a new document with a generated ID
                Delegate.registrar!(blnFin: true)
                DataHolder.sharedInstance.miPerfil.sId = (user?.uid)
                DataHolder.sharedInstance.firestoreDB?.collection("users").document(DataHolder.sharedInstance.miPerfil.sId!).setData(DataHolder.sharedInstance.miPerfil.getMap())
                
                
                
            }else{
                print("Error: ")
                print(error!)
                
            }
        }
        
    }
  
    func descargaLogin(user:String,code:String,delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: (user), password:(code)){ (user, error) in
            if((user) != nil){
                DataHolder.sharedInstance.sId = (user?.uid)
                let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("users").document((user?.uid)!)
                refPerfil?.getDocument{ (document, error) in
                    if(document != nil){
                        print(document?.data())
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(DataHolder.sharedInstance.miPerfil.sNombre)
                        delegate.descargarLogin!(blnFin: true)
                    }
                }
            }else{
               print("Error al iniciar sesion")
            }
    }
}

}


@objc protocol DataHolderDelegate{
    @objc optional func DescargarUsuario(blnFin:Bool)
    @objc optional func registrar (blnFin: Bool)
    @objc optional func descargarLogin(blnFin:Bool)
}
