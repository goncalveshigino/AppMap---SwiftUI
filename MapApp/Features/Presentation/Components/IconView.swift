//
//  IconView.swift
//  MapApp
//
//  Created by Goncalves Higino on 04/03/24.
//

import SwiftUI

struct IconView: View {
    @Environment(\.colorScheme) var colorScheme
    var systemName: String
    var imageColor: Color?
    var rectangleColor: Color?
    var cornerRadius: CGFloat?
    
    init(
         systemName: String,
         imageColor: Color? = nil,
         rectangleColor: Color? = nil,
         cornerRadius: CGFloat? = nil
    ) {
        self.systemName = systemName
        self.imageColor = imageColor
        self.rectangleColor = rectangleColor
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Image(systemName: systemName)
            .foregroundStyle(imageColor ?? .init(colorScheme == .dark ? .white : .black))
            .font(.title3)
            .background(
              RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                .frame(width: 44, height: 46)
                .foregroundColor(rectangleColor ?? .init(.systemBackground))
            )
            .padding()
    }
}


