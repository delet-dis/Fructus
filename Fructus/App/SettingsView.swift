//
//  SettingsView.swift
//  Fructus
//
//  Created by Igor Efimov on 27.09.2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox(
                        label:
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")) {
                            Divider().padding(.vertical, 4)

                            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, spacing: 10) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                Text("Most fruits are naturally low in fat, sodium, and calories. None have cholestirol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                    .font(.footnote)
                            }
                    }

                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
                        Divider().padding(.vertical, 4)

                        Text("If you wish, you can restart the application by toggle this switch in the box. That way it starts the onboarding process ansd you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)

                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(
                            UIColor.tertiarySystemBackground
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                    }

                    GroupBox(label: SettingsLabelView(labelText: "Application info", labelImage: "apps.iphone")) {
                        SettingsRowView(name: "Developer", content: "delet-dis")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Project github", linkLabel: "delet-dis", linkDestination: "github.com/delet-dis")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .padding()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
