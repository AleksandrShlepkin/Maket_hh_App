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
    @EnvironmentObject var emailText: LoginViewModel
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
                        .borderRectangle(activeState: disactiveState, text: emailText.textEmail ?? "" )
                    
                    HStack {
                        if disactiveState == true  {
                            Image("MailImage")
                                .padding(.leading, 10)
                        }
                        
                        TextField("", text: Binding(get: {emailText.textEmail ?? ""}, set: {emailText.textEmail = $0 }), prompt: Text("Электронная почта или телефон")
                            .foregroundStyle(Color(.lightGray))
                            .font(.system(size: 14)))
                        .foregroundStyle(.white)
                        .padding()
                        .onChange(of: emailText.textEmail) { newValue in
                            if emailText.textEmail == "" {
                                disactiveState = true
                            } else {
                                disactiveState = false
                            }
                        }
                        
                        if disactiveState == false   {
                            
                            Button("", image: .control) {
                                emailText.textEmail = ""
                                disactiveState.toggle()
                            }
                        }
                    }
                }
            }
            .padding()
            
            HStack{
                
                if disactiveState == true {
                        Text("Продолжить")
                            .frame(width: 170, height: 40)
                            .foregroundStyle(.white)
                            .background(Color.blue.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding()
                            .disbleWithOpacity(disactiveState)
                    
                } else {
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



