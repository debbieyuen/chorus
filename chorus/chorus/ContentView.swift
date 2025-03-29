//
//  ContentView.swift
//  chorus
//
//  Created by Debbie Yuen on 3/26/25.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    // variable for dark/light modes
    @Environment(\.colorScheme) var colorScheme
    
    // For caching
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userID: String = ""
    
    var body: some View {
//        NavigationView {
//            VStack {
//            }
//            .navigationTitle("Sign In")
//        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Chorus")
            // check if there is a userID
            if userID.isEmpty {
                // display the homescreen if not signed in
                SignInWithAppleButton(
                    onRequest: { request in
                        // we want user's email and full name
                        request.requestedScopes = [.email, .fullName]
                    },
                    onCompletion: { result in
                        // handle success and failure cases
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let authAppleCredential as ASAuthorizationAppleIDCredential:
                                // save email and name. You only get this the first time user signs in. Should cache these.
                                let email = authAppleCredential.email
                                let firstName = authAppleCredential.fullName?.givenName
                                let lastName = authAppleCredential.fullName?.familyName
                                
                                // user ID. You can get every time they sign in
                                let userID = authAppleCredential.user
                                
                                // Assign it to cache
                                self.email = email ?? ""
                                self.userID = userID
                                self.firstName = firstName ?? ""
                                self.lastName = lastName ?? ""
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                )
                .frame(height: 50)
                .padding()
                .cornerRadius(8)
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black)
                
            }
            else {
                // open up the homepage
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
