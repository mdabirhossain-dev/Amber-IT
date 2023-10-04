//
//  CalenderView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI


struct DatePickerView: View {
    // MARK: - Properties
    @State private var date = Date()
    @Binding var dateString: String
    
    // MARK: - Body
    var body: some View {
        Image("calendar")
            .resizable()
            .frame(width: 19/393 * DeviceInfos().deviceWidth, height: 19/393 * DeviceInfos().deviceWidth)
          .overlay ( //MARK: - Place the DatePicker in the overlay extension
             DatePicker("", selection: $date, displayedComponents: [.date])
              .blendMode(.destinationOver) // MARK: - use this extension to keep the clickable functionality
              .onChange(of: date, perform: { value in
                  dateString = dateFormatter(date: date)
                  print("Date: \(dateString)")
               })
          )
    }
}

// MARK: - Preview
struct DatePickerView_Previews: PreviewProvider {
    @State static var dateString = ""
    static var previews: some View {
        DatePickerView(dateString: $dateString)
    }
}



//struct FirstView: View {
//
//    @State var showDatePicker: Bool = false
//    @State var savedDate: Date? = nil
//
//    var body: some View {
//        ZStack {
//            HStack {
//                Text("Selected date: ")
//                Button(action: {
//                    showDatePicker.toggle()
//                }, label: {
//                    Text(savedDate?.description ?? "SELECT DATE")
//                })
//            }
//
//
//            if showDatePicker {
//                DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
//                    .animation(.linear)
//                    .transition(.opacity)
//            }
//        }
//
//    }
//}
//
//struct DatePickerWithButtons: View {
//
//    @Binding var showDatePicker: Bool
//    @Binding var savedDate: Date?
//    @State var selectedDate: Date = Date()
//
//    var body: some View {
//        ZStack {
//
//            Color.black.opacity(0.3)
//                .edgesIgnoringSafeArea(.all)
//
//
//            VStack {
//                DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
//                    .datePickerStyle(GraphicalDatePickerStyle())
//
//                Divider()
//                HStack {
//
//                    Button(action: {
//                        showDatePicker = false
//                    }, label: {
//                        Text("Cancel")
//                    })
//
//                    Spacer()
//
//                    Button(action: {
//                        savedDate = selectedDate
//                        showDatePicker = false
//                    }, label: {
//                        Text("Save".uppercased())
//                            .bold()
//                    })
//
//                }
//                .padding(.horizontal)
//
//            }
//            .padding()
//            .background(
//                Color.white
//                    .cornerRadius(30)
//            )
//
//
//        }
//
//    }
//}
//
//
//
//struct DatePickerWithButtons_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstView()
//    }
//}
