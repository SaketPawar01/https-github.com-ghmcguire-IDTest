/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The SwiftUI view that provides the document reader user interface.
*/

import SwiftUI
import PassKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    @State private var circle1X = -150
    @State private var circle1Y = -350
    @State private var circle2X = 150
    @State private var circle2Y = -55
    @State private var circle3X = -100
    @State private var circle3Y = 300
    @State private var circle4X = 150
    @State private var circle4Y = -300
    @State private var circle5X = 150
    @State private var circle5Y = 300
    @State private var circle6X = -150
    @State private var circle6Y = 0

    var body: some View {
        ZStack{
            //Background
//            ZStack{
//                Rectangle()
//                    .fill(Color(Color.white))
//                    .ignoresSafeArea()
//                Rectangle()
//                    .fill(Color(Color.clear))
//                    .background(
//                    LinearGradient(
//                    stops: [
//                    Gradient.Stop(color: Color(red: 1, green: 0, blue: 0.24).opacity(0.18), location: 0.00),
//                    Gradient.Stop(color: Color(red: 1, green: 0.95, blue: 0.67).opacity(0.38), location: 1.00),
//                    ],
//                    startPoint: UnitPoint(x: 0, y: 0),
//                    endPoint: UnitPoint(x: 1, y: 1)
//                    )
//                    ).ignoresSafeArea()
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 245, height: 261)
//                    .background(Color(red: 0.98, green: 0.64, blue: 0.64).opacity(0.75))
//                    .blur(radius: 80.5)
//                    .offset(x: CGFloat(circle1X), y: CGFloat(circle1Y))
//                    .onAppear(){
//                        withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                            circle1X = -100
//                        }
//                        withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                            circle1Y = -300
//                        }
//                    }.ignoresSafeArea()
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 258, height: 239)
//                    .background(Color(red: 0.96, green: 0.94, blue: 0.52).opacity(0.75))
//                    .offset(x: CGFloat(circle2X), y: CGFloat(circle2Y))
//                    .onAppear(){
//                        withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                            circle2X = 175
//                        }
//                        withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                            circle2Y = 0
//                        }
//                    }
//                    .blur(radius: 64.5)
//                    .ignoresSafeArea()
//                Circle()
//                  .foregroundColor(.clear)
//                  .frame(width: 300, height: 314)
//                  .background(Color(red: 0.98, green: 0.88, blue: 0.67).opacity(0.75))
//                  .offset(x: CGFloat(circle3X), y: CGFloat(circle3Y))
//                  .onAppear(){
//                      withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                          circle3X = -80
//                      }
//                      withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                          circle3Y = 270
//                      }
//                  }
//                  .blur(radius: 38.5)
//                  .ignoresSafeArea()
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 258, height: 239)
//                    .background(Color(red: 0.75, green: 0.5, blue: 1).opacity(0.75))
//                    .offset(x: CGFloat(circle4X), y: CGFloat(circle4Y))
//                    .onAppear(){
//                        withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                            circle4X -= 50
//                        }
//                        withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                            circle4Y += 50
//                        }
//                    }
//                    .blur(radius: 64.5)
//                    .ignoresSafeArea()
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 258, height: 239)
//                    .background(Color(red: 0.76, green: 1, blue: 0.75))
//                    .offset(x: CGFloat(circle5X), y: CGFloat(circle5Y))
//                    .onAppear(){
//                        withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                            circle5X -= 100
//                        }
//                        withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                            circle5Y -= 50
//                        }
//                    }
//                    .blur(radius: 64.5)
//                    .ignoresSafeArea()
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 258, height: 239)
//                    .background(Color(red: 0.52, green: 0.86, blue: 1).opacity(0.75))
//                    .offset(x: CGFloat(circle6X), y: CGFloat(circle6Y))
//                    .onAppear(){
//                        withAnimation(.default.speed(0.1).delay(1).repeatForever(autoreverses: true)) {
//                            circle6X += 50
//                        }
//                        withAnimation(.default.speed(0.1).delay(0.3).repeatForever(autoreverses: true)) {
//                            circle6Y += 20
//                        }
//                    }
//                    .blur(radius: 64.5)
//                    .ignoresSafeArea()
////                Image("background")
////                    .resizable()
////                    .aspectRatio(contentMode: .fill)
////                    .ignoresSafeArea()
//            }
//            PKIdentityButton(label: .verify, style: .black)
//                .addTarget(viewModel, action: viewModel.verifyButtonTapped(), for: .allTouchEvents)
            VStack {
                Spacer()
                Text("Minimum Age:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                SwipeGesture()
                Spacer()
                Spacer()
                Button(){
                    viewModel.verifyButtonTapped(minAge: UserDefaults.standard.integer(forKey: "minAge"))
                } label: {
                    Label("Read ID", systemImage: "person.text.rectangle")
                }
                .foregroundColor(.black)
                .font(.largeTitle)
//                VStack{
//                    Text("Minimum Age:")
////                    TextField("Age", value: $minAge, formatter: NumberFormatter())
////                        .keyboardType(.numberPad)
////                        .textFieldStyle(.roundedBorder)
////                        .multilineTextAlignment(.center)
////                        .frame(width: 50)
//                    Picker(selection: $minAge, label: Text("Age")) {
//                                Text("18").tag(18)
//                                Text("21").tag(21)
//                            }
//                    .pickerStyle(.segmented)
//                    
//                }


            }

        }
    }

}

struct SwipeGesture: View {
    @State private var minAge = UserDefaults.standard.integer(forKey: "minAge")
  @State private var isDragging = false

  var drag: some Gesture {
      DragGesture()
      .onChanged { value in
        // Check if the user is dragging right.
        if value.predictedEndTranslation.width > 10 {
          self.isDragging = true
        } else {
          self.isDragging = false
        }
        
      }
      .onEnded { value in
        // Check if the user swiped far enough to the right.
        if value.predictedEndTranslation.width > 0 && minAge == 21 {
          // Change the text to 18 with a nice animation.
          minAge = 18
          // Update the minAge int.
        UserDefaults.standard.set(minAge, forKey: "minAge")
        } else if value.predictedEndTranslation.width < 0 && minAge == 18 {
          // Change the text to 21 with a nice animation.
          minAge = 21
          // Update the minAge int.
            UserDefaults.standard.set(minAge, forKey: "minAge")
        }
        self.isDragging = false
      }
  }

  var body: some View {
    Text("\(minAge)")
          .font(.largeTitle)
          .bold()
      .gesture(drag)
//      .animation(.spring)
      .overlay(
        // Add a swiping signifier.
        Image(systemName: minAge == 21 ? "chevron.right" : "chevron.left")
          .foregroundColor(.gray)
          .offset(x: minAge == 21 ? 0 : -20)
          .rotationEffect(Angle(degrees: 180))          .opacity(isDragging ? 1 : 0)
      )
  }
}

struct SwipeGesture_Previews: PreviewProvider {
  static var previews: some View {
    SwipeGesture()
  }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}
