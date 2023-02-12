//
//  ImageView.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/11/23.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageLoader:ImageLoadingViewModel
    
    init(url:String,key:String){
        _imageLoader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    var body: some View {
        ZStack{
            if imageLoader.isLoading {
                ProgressView()
            } else if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://via.placeholder.com/600/92c952",key: "\(1)")
            .frame(width: 60,height: 60)
            .previewLayout(.sizeThatFits)
    }
}
