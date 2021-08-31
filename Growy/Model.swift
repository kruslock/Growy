//
//  Model.swift
//  Growy
//
//  Created by Christoffer Carlsson on 2021-08-16.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadcompletion in
            // Handel our error
                print("DEBUG: Unabole to load modelEntity for model name \(self.modelName)")
            }, receiveValue: { modelEntity in
                // Get our model entity
                self.modelEntity = modelEntity
                print("DEBUG: Successfully loaded modelEntiyt for modelname \(self.modelName)")
            })

    }
}

