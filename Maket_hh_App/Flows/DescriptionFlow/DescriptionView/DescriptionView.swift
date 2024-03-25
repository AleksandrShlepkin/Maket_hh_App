//
//  DescriptionView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 24.03.2024.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack {
            DescriptionViewHeader()
            DescriptionViewFooter()
        }
        .background(Color.black)
    }
}

#Preview {
    DescriptionView()
}
