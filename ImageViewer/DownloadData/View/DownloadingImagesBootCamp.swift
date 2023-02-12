//
//  DataDisplayView.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/10/23.
//

import SwiftUI

struct DownloadingImagesBootCamp: View {
    @StateObject var viewModel = DownloadingImagesViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.dataArray) { model in
                    RowViewDesign(photoModel: model)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Combine and Swiftui")
        }
    }
}

struct DataDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootCamp()
    }
}
