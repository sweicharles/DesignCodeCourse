//
//  CourseItem.swift
//  DesignCodeCourse
//
//  Created by charles swei on 15/7/21.
//

import SwiftUI

struct CourseItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0){
            Spacer()
            HStack {
                HStack {
                    Spacer()
                    Image("Illustration 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
            }
            Text("SwiftUI for iOS 14!").fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("20 Sections").font(.footnote).foregroundColor(Color.white)

        }
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(20.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
