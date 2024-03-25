//
//  VerificationCodeTextFieldView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 20.03.2024.
//

import SwiftUI

public enum VerificationCodeFocusField: Hashable {
    case cell1
    case cell2
    case cell3
    case cell4
}

struct VerificationCodeTextFieldView: View {
    
    @EnvironmentObject var model: OTPViewModel
    @FocusState var activeField: VerificationCodeFocusField?
    @State var cells: Int
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<cells, id: \.self) { index in
                    TextField("", text: $model.fields[index])
                        .frame(width: 50, height: 50)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .background(Color(.lightGray))
                        .tag(index)
                        .focused($activeField, equals: activeFocus(index: index))
                        .onChange(of: model.fields) { newValue in
                            conditions(value: newValue)
                        }
                }
            }
            
            Button {
                
            } label: {
                Text("Подтвердить")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
            }
        }
    }
    
    func conditions(value: [String]){
        
        //MARK: move next field
        for index in 0..<cells {
            if value[index].count == 1 && activeFocus(index: index) == activeField {
                activeField = activeFocus(index: index + 1)
            }
        }
        
        for index in 0..<cells{
            if value[index].count > 1 {
                model.fields[index] = String(value[index].last!)
            }
        }
        
        if value == ["1", "2", "3", "4"] {
            coordinator.pagePresent(.tab)
            coordinator.goToRoot()
        }
    }
    
    func activeFocus(index: Int) -> VerificationCodeFocusField {
        switch index {
        case 0:
            return .cell1
        case 1:
            return .cell2
        case 2:
            return .cell3
        default:
            return .cell4
        }
    }
}


#Preview {
    VerificationCodeTextFieldView(cells: 4)
}
