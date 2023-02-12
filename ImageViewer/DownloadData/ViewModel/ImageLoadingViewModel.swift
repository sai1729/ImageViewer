//
//  ImageLoadingViewModel.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/11/23.
//

import Foundation
import SwiftUI
import Combine
class ImageLoadingViewModel: ObservableObject {
//    let manager = PhotoModelCacheManager.instance
    let manager = PhotoModelFileManager.instance
    @Published var image:UIImage? = nil
    @Published var isLoading:Bool = false
    var cancellables = Set<AnyCancellable>()
    let urlString:String
    let imageKey:String
    init(url:String,key:String){
        urlString = url
        imageKey = key
        downloadImage()
    }
    
    func getImage(){
        if let savedImage = manager.get(key: imageKey){
            image = savedImage
        }else{
            downloadImage()
        }
    }
    
    func downloadImage(){
        guard
            let url = URL(string: urlString) else{ return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self](returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else { return }
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
}
