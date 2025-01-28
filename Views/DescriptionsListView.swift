//
//  DescriptionsListView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-12-08.
//

import SwiftUI

struct DescriptionsListView: View {
    @ObservedObject var yearInfoModel: YearInfoModel

    var body: some View {
        NavigationStack { // Wrap the list in a NavigationStack
            List {
                ForEach(yearInfoModel.days.indices, id: \.self) { index in
                    let day = yearInfoModel.days[index]
                    if !day.description.isEmpty || day.photo != nil {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("\(day.dayNumber) \(day.monthName) \(day.yearNumber)")
                                        .font(.headline)

                                    if !day.description.isEmpty {
                                        Text(day.description)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }

                                Spacer()

                                if let photo = day.photo {
                                    NavigationLink(
                                        destination: PhotoPreviewView(
                                            photo: photo,
                                            date: "\(day.dayNumber) \(day.monthName) \(day.yearNumber)"
                                        ),
                                        label: {
                                            Image(uiImage: photo)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Memories")
            
        }
    }
}



#Preview {
    DescriptionsListView(yearInfoModel: YearInfoModel(year: 2024))
}
