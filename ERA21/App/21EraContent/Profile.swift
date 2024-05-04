import SwiftUI


struct Profile: View {
    @State private var userData = UserData(username: "Nsreen", personalType: "Cr", phone: "0555555555", password: "12345678", Character: "Character")

    var body: some View {
    
        ScrollView(showsIndicators: false){
        ZStack {
            
                Rectangle()
                    .frame(width: 320, height: 520)
                    .foregroundColor(Color("MainColor").opacity(0.7))
                    .cornerRadius(26.61)
                
            
                VStack(spacing: 20) {
                    ZStack {
                        Image("CharacterBackground")
                            .frame(width: 280, height: 230)
                            .foregroundColor(Color.white)
                            .cornerRadius(26.61)
                            .overlay(
                                VStack{
                                    
                                    Image(userData.Character)
                                        .resizable()
                                        .frame(width: 250, height: 210)
                                        .padding(.top , 30)
                                    
                                }
                            )
                        
                        
                    }
                    
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Username")
                                .font(.custom("basecoat", size: 18))

                                .foregroundColor(Color.white)
                                .bold()
                            TextField("UserName", text: $userData.username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 280)
                                .cornerRadius(8)
                                .opacity(0.6)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Phone")
                                .font(.custom("basecoat", size: 18))
                                .foregroundColor(Color.white)
                                .bold()
                            TextField("Phone", text: $userData.phone)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 280)
                                .cornerRadius(8)
                                .opacity(0.6)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Password")
                                .font(.custom("basecoat", size: 18))
                                .foregroundColor(Color.white)
                                .bold()
                            SecureField("Password", text: $userData.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 280)
                                .cornerRadius(8)
                                .opacity(0.6)
                        }
                        
                    }
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
