//
//  PasswordViews.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 2/9/23.
//

import SwiftUI
import Combine

class passwordViewModel:ObservableObject{
    let capitalLetterRegEx:String?  = ".*[A-Z]+.*"
    let numberRegEx:String?  = ".*[0-9]+.*"
    let specialCharacterRegEx:String?  = ".*[!&^%$#@()/_*+-]+.*"
    @Published var passwordText:String = ""
    @Published var eightCount: Bool = false
    @Published var oneUpper: Bool = false
    @Published var oneNumber: Bool = false
    @Published var oneSpecial: Bool = false
    var cancellables = Set<AnyCancellable>()
    @Published var isValid = false
    
    init()
    {
        getValidation()
    }
    
    func getValidation(){
        $passwordText
            .map { [weak self](text) -> Bool in
                guard let self = self,
                      let capitalLetterRegEx = self.capitalLetterRegEx,
                      let numberRegEx = self.numberRegEx,
                      let specialCharacterRegEx = self.specialCharacterRegEx else{
                    return false
                }
                self.eightCount = text.count>=8
                self.oneUpper = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx).evaluate(with: text)
                self.oneNumber = NSPredicate(format:"SELF MATCHES %@", numberRegEx).evaluate(with: text)
                self.oneSpecial = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx).evaluate(with: text)
                
                return self.eightCount && self.oneSpecial && self.oneNumber && self.oneUpper
            }
            .sink(receiveValue: { [weak self](isValid) in
                self?.isValid = isValid
            })
            .store(in: &cancellables)
    }
    
}

struct PasswordViews: View {
    @StateObject var passwordViewmodel = passwordViewModel()
    @State var passwordText:String = ""
    @State var username:String = ""
    @State var imageBool: Bool = false
    @State var showPassword: Bool = false
    @State var buttonPressed: Bool = false

    
    var body: some View {
        ZStack{
            Image("Login")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .textInputAutocapitalization(.never)
                .textCase(.lowercase)

            VStack(spacing: 10){
                HStack{
                    Text("Password Validation")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: .infinity,height: 200,alignment: .center)
                }
                Spacer()
                VStack(alignment:.leading,spacing: 10){
                    TextField("Enter username", text: $username)
                        .padding()
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .background(Color.teal)
                        .cornerRadius(10)
                        .opacity(0.9)
                    
                    HStack(){
                        SecureField("Enter a password", text: $passwordViewmodel.passwordText)
                            .padding()
                            .frame(height: 50)
                            .foregroundColor(.black)
                            .background(Color.teal)
                            .cornerRadius(10)
                            .opacity(0.9)
                        Image(systemName: (showPassword) ? "eye.circle.fill" : "eye.circle")
                            .frame(width: 23,height: 23)
                            .onTapGesture {
                                buttonPressed = false
                                showPassword.toggle()
                            }
                        Image(systemName: (imageBool) ? "info.circle.fill" : "info.circle")
                            .frame(width: 23,height: 23)
                            .onTapGesture {
                                buttonPressed = false
                                imageBool.toggle()
                            }
                    }
                    if(showPassword){
                        Text("\(passwordViewmodel.passwordText)")
                            .padding()
                    }
                    
                    if(buttonPressed){
                        Text(passwordViewmodel.isValid ? "Valid Password" : "Enter a valid password")
                            .padding()
                    }

                    if(imageBool){
                        HStack{
                            Image(systemName: passwordViewmodel.eightCount ? "circle.fill":"circle")
                            Text("Must be 8 characters")
                        }
                        
                        HStack{
                            Image(systemName: passwordViewmodel.oneUpper ? "circle.fill":"circle")
                            Text("Must contain 1 Uppercase")
                        }
                        
                        HStack{
                            Image(systemName: passwordViewmodel.oneNumber ? "circle.fill":"circle")
                            Text("Must contain 1 Number")
                        }
                        
                        HStack{
                            Image(systemName: passwordViewmodel.oneSpecial ? "circle.fill":"circle")
                            Text("Must contain 1 Special Character")
                        }
                    }
                }
                HStack{
                    Button {
                        showPassword = false
                        imageBool = false
                        buttonPressed = true
                    } label: {
                        Text("Login")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity,maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }.frame(alignment: .leading)
            .padding()
            .padding()
            .foregroundColor(.white)
            
        }
    }
}

struct PasswordViews_Previews: PreviewProvider {
    static var previews: some View {
        PasswordViews()
    }
}
