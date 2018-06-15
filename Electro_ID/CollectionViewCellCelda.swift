//
//  CollectionViewCellCelda.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 5/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit
import FirebaseStorage

class CollectionViewCellCelda: UICollectionViewCell {
    @IBOutlet
    var miLabel2:UILabel?
    
    @IBOutlet
    var miImg:UIImageView?
    
    func cargarImg(url:String){
        print("Cargando imagenes")
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(url)
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        print("************************** ",islandRef,"              ",DataHolder.sharedInstance.firStorageRef)
        islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
                print("ERROR ",error)
            } else {
                // Data for "images/island.jpg" is returned
                print("Imagen descargada, voy a meter la imagen")
                let image = UIImage(data: data!)
                self.miImg?.image=image
            }
        }
    }
}
