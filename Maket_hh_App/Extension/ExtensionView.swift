//
//  ExtensionView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 21.03.2024.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func disbleWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
    
    @ViewBuilder
    func borderRectangle(activeState: Bool, text: String) -> some View {
        
        if activeState == false {
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(Color(.gray))
                .shadow(color: .black, radius: 5, x: 2, y: 2)
        }
        if text.isValidEmail == false && text != "" {
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(Color.clear)
                .border(Color.red, width: 2)
        } else {
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(Color.clear)
                .border(Color.black, width: 2)
        }
    }

}

extension NavigationLink {
    
    @ViewBuilder
    func disble(_ condition: Bool) -> some View {
        self
            .disabled(condition)
    }
}

