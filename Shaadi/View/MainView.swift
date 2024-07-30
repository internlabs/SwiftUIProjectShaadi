import SwiftUI

struct MainView: View {
    //MARK: State variables to store the full name and control the navigation to the registration view.
    @State private var fullName: String = ""
    @State private var isRegistrationViewActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: Heading
                HStack {
                    //MARK: Display "Match" with custom font and color
                    Text("Match")
                        .font(.custom(FontsManager.KumbhSans.SemiBold, size: 24))
                        .foregroundColor(.black) +
                    //MARK: Display "." with large title font and bold weight
                    Text(".")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black) +
                    //MARK: Display "Mingle" with custom font and red color
                    Text("Mingle")
                        .font(.custom(FontsManager.KumbhSans.SemiBold, size: 24))
                        .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29))
                }
                .padding(.trailing, 190)
                
                // MARK: Circles
                GeometryReader { geometry in
                    ZStack {
                        //MARK: Display images in circular frames positioned within the GeometryReader
                        Image("img1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.82, y: geometry.size.height * -0.1)
                        Image("img2")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.18, y: geometry.size.height * 0.12)
                        Image("img3")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.6, y: geometry.size.height * 0.4)
                        Image("img4")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.8)
                        Image("img5")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.65)
                        Image("img6")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.4, y: geometry.size.height * 0.9)
                        Image("img7")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.99)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .frame(maxHeight: 300)
                .padding(.vertical, 30)
                
                // MARK: Middle Body Text
                VStack(spacing: 8) {
                    //MARK: Display "Find you first" with custom fonts and colors
                    (Text("Find you ")
                        .font(.custom(FontsManager.KumbhSans.Bold, size: 40))
                        .foregroundColor(Color.black) +
                     Text("first")
                        .font(.custom(FontsManager.KumbhSans.Bold, size: 40))
                        .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29)))
                    
                    //MARK: Display "Meta Matches" with custom fonts and colors
                    (Text("Meta")
                        .font(.custom(FontsManager.KumbhSans.Bold, size: 40))
                        .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29)) +
                     Text(" Matches")
                        .font(.custom(FontsManager.KumbhSans.Bold, size: 40))
                        .foregroundColor(Color.black))
                    
                    //MARK: Display descriptive text with custom font and multiline alignment
                    Text("Join us and socialize with millions \nof meta humans")
                        .font(.custom(FontsManager.KumbhSans.Regular, size: 20))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                VStack {
                    HStack {
                        // MARK: Get Started Button
                        NavigationLink(destination: RegistrationView()) {
                            HStack {
                                Text("Get Started")
                                    .font(.custom(FontsManager.KumbhSans.SemiBold, size: 20))
                                    .foregroundColor(.white)
                                Image(systemName: "arrow.up.right")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.94, green: 0.29, blue: 0.29))
                            .cornerRadius(20)
                            .padding(.horizontal, 10)
                        }
                        
                        // MARK: Google Button
                        Button(action: {
                            // MARK: Action for Google button
                        }) {
                            Image("google")
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(15)
                        }
                        
                        // MARK: Apple Button
                        Button(action: {
                            // MARK: Action for Apple button
                        }) {
                            Image("apple")
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                    
                    // MARK: Footer
                    HStack {
                        Text("Already have an account? ")
                            .font(.custom(FontsManager.KumbhSans.Medium, size: 16))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                        
                        Button(action: {
                            // MARK: Action for Log In button
                        }) {
                            Text("Log In")
                                .font(.custom(FontsManager.KumbhSans.Medium, size: 16))
                                .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29))
                        }
                    }
                    .padding()
                }
                
                // Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
