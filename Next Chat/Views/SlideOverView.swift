import SwiftUI

struct SlideOverView<Content: View, Background: View>: View {
    @Binding var isRevealed: Bool
    @State private var offset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0 // Store the last offset to continue the drag smoothly
    @State private var dragStartTime: Date? = nil // Track the start time of the drag
    @State private var dragEndTime: Date? = nil // Track the end time of the drag
    let content: Content
    let background: Background

    init(isRevealed: Binding<Bool>, content: Content, background: Background) {
        self._isRevealed = isRevealed
        self.content = content
        self.background = background
        self._offset = State(initialValue: isRevealed.wrappedValue ? 0 : UIScreen.main.bounds.width)
    }

    var body: some View {
        ZStack {
            // Background view
            background
                .edgesIgnoringSafeArea(.all)
                .zIndex(1)
            
            // Foreground view
            content
                .zIndex(2)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if dragStartTime == nil {
                                dragStartTime = Date()
                            }
                            let dragOffset = value.translation.width + lastOffset
                            if dragOffset <= UIScreen.main.bounds.width && dragOffset >= 0 {
                                offset = dragOffset
                            }
                        }
                        .onEnded { value in
                            dragEndTime = Date()
                            let swipeSpeed = calculateSwipeSpeed(startTime: dragStartTime, endTime: dragEndTime, translation: value.translation.width)
                            print("Swipe Speed: \(swipeSpeed) points/second")
                            
                            withAnimation {
                                if (detectSwipeDirection(value: value) == "Left" && isRevealed == false) || (detectSwipeDirection(value: value) == "Right" && isRevealed == true){
                                    
                                    if offset > UIScreen.main.bounds.width / 2 {
                                        if (isRevealed == true && swipeSpeed > 500){
                                            offset = UIScreen.main.bounds.width
                                            isRevealed = false
                                        } else if (isRevealed == false && swipeSpeed > 500){
                                            offset = 0
                                            isRevealed = true
                                        } else {
                                            offset = UIScreen.main.bounds.width
                                            isRevealed = false
                                        }
                                    } else {
                                        offset = 0
                                        isRevealed = true
                                    }
                                }
                            }
                            lastOffset = offset
                            dragStartTime = nil
                            dragEndTime = nil
                        }
                )
        }
        .onChange(of: isRevealed) { newValue in
            withAnimation {
                offset = newValue ? 0 : UIScreen.main.bounds.width
                lastOffset = offset
            }
        }
    }

    private func calculateSwipeSpeed(startTime: Date?, endTime: Date?, translation: CGFloat) -> CGFloat {
        guard let start = startTime, let end = endTime else { return 0 }
        let timeInterval = end.timeIntervalSince(start)
        let speed = translation / CGFloat(timeInterval)
        return abs(speed) // Return the absolute value of the speed
    }
}
