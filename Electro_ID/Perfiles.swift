//
//  Perfiles.swift
//  Electro_ID
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 17/4/18.
//  Copyright © 2018 Gebulot. All rights reserved.
//

import UIKit

class Perfiles: NSObject {
    
    var sId:String?
    var sNombre:String?
    var iEdad:Int?
    var sMail:String?
    var sRutaImagenP:String?
    
    func setMap(valores:[String:Any]){
        
        sNombre = valores["nombre"] as! String?
        
    }
    
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any]=[:]
        mapTemp["nombre"] = sNombre
        mapTemp["mail"] = sMail
        mapTemp["edad"] = iEdad
        mapTemp["ruta"] = sRutaImagenP
        return mapTemp
    }

}
