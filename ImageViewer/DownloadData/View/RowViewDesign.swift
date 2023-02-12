//
//  RowViewDesign.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/11/23.
//

import SwiftUI

//"albumId": 1,
//"id": 1,
//"title": "accusamus beatae ad facilis cum similique qui sunt",
//"url": "https://via.placeholder.com/600/92c952",
//"thumbnailUrl": "https://via.placeholder.com/150/92c952"

struct RowViewDesign: View {
    var photoModel:PhotoModel
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(photoModel.albumId)")
                Text(photoModel.title)
            }
            Spacer()
            ImageView(url: photoModel.thumbnailUrl,key: "\(photoModel.id)")
                .scaledToFit()
                .frame(width: 50,height: 50)
            Spacer()
            ImageView(url: photoModel.url,key: "\(photoModel.id)")
                .scaledToFit()
                .frame(width: 60,height: 60)
        }
        .padding(.horizontal)
        .frame(width: .infinity,height: 80)
        .background(Color.teal)
        .cornerRadius(25.0)
    }
    
}

struct RowViewDesign_Previews: PreviewProvider {
    static var previews: some View {
        RowViewDesign(photoModel: PhotoModel(albumId: 1, id: 1, title: "Hello World", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
            .previewLayout(.sizeThatFits)
    }
}
