//
//  OTPViewModel.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

final class OTPViewModel: ObservableObject {
    
    @Published var fields: [String] = Array(repeating: "", count: 4)
}
