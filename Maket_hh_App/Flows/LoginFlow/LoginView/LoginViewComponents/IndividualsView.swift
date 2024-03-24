//
//  IndividualsView.swift
//  Maket_hh_App
//
//  Created by Александр Коротков on 18.03.2024.
//

import SwiftUI
enum StateButton: Hashable {
    case active
    case disactive
}

struct IndividualsView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    @State var emailText: String = ""
    @State var disactiveState: Bool = true
    @FocusState var focusState: StateButton?
    @EnvironmentObject private var coordinatro: Coordinator

    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Поиск работы")
                .font(.title)
                .foregroundStyle(.white)
                .padding([.top, .leading])
            
            HStack(alignment: .center) {
                ZStack {
                    Rectangle()
                        .borderRectangle(activeState: disactiveState, text: emailText )
                    
                    HStack {
                        if disactiveState == true  {
                            Image("MailImage")
                                .padding(.leading, 10)
                        }
                        
                        TextField("", text: $emailText, prompt: Text("Электронная почта или телефон")
                            .foregroundStyle(Color(.lightGray))
                            .font(.system(size: 14)))
                        .foregroundStyle(.white)
                        .padding()
                        .onChange(of: emailText) { newValue in
                            if emailText == "" {
                                disactiveState = true
                            } else {
                                disactiveState = false
                            }
                        }
                        
                        
                        if disactiveState == false   {
                            
                            Button("", image: .control) {
                                emailText = ""
                                disactiveState.toggle()
                            }
                        }
                    }
                }
            }
            .padding()
            
            HStack{
                Button {
                    coordinator.pagePresent(.verify)
                } label: {
                    Text("Продолжить")
                        .frame(width: 170, height: 40)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding()
                        .disbleWithOpacity(disactiveState)
                }

                
                NavigationLink(destination: LegalEntitiesView()) {
                    Text("Войти с паролем")
                        .foregroundStyle(.blue)
                }
            }
        }
        .background(Color(hex: "222325"))
    }
    

}

#Preview {
    IndividualsView()
}



