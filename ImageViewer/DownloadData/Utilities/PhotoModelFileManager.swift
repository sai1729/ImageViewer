//
//  PhotoModelFileManager.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/11/23.
//

import Foundation
import SwiftUI

class PhotoModelFileManager {
    static let instance  = PhotoModelFileManager()
    let folderName = "downloaded_Photos"
    private init() { }
    
    func createFolderIfNeeded(){
        guard let url = getFolderPath() else {return}
        
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error creating folder \(error.localizedDescription)")
            }
        }
    }
    
    private func getImagePath(key:String) -> URL? {
        guard let path = getFolderPath() else {
            return nil
        }
        return path.appendingPathComponent(key+".png")
    }
    
    func getFolderPath() -> URL? {
        let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
        
        return path
    }
    
    func add(key:String, value:UIImage){
        guard
            let data = value.pngData(),
            let url = getImagePath(key: key) else { return }
        
        do{
            try data.write(to:url)
        }catch let error{
            print("error \(error.localizedDescription)")
        }
    }
    
    func get(key:String) -> UIImage? {
        guard
            let url = getImagePath(key: key), FileManager.default.fileExists(atPath: url.path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
}
