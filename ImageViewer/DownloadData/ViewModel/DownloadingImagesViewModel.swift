//
//  dataViewModel.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/10/23.
//

import Foundation
import Combine
class DownloadingImagesViewModel: ObservableObject{
    @Published var dataArray:[PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService = PhotoModelDataService.instance
    
    init(){
        addSubcribers()
    }
    
    func addSubcribers(){
        dataService.$photoModel
            .sink { [weak self](returnedPhotoModel) in
                self?.dataArray = returnedPhotoModel
            }
            .store(in: &cancellables)
    }
}
