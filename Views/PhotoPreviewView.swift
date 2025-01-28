//
//  PhotoPreviewView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-12-09.
//


import SwiftUI

struct PhotoPreviewView: View {
    let photo: UIImage
    let date: String

    var body: some View {
        VStack {
            Text(date)
                .font(.headline)
                .padding()

            Spacer()

            Image(uiImage: photo)
                .resizable()
                .scaledToFit()
                .padding()

            Spacer()
        }
        .navigationTitle("Photo Preview")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
  //  PhotoPreviewView()
//}
