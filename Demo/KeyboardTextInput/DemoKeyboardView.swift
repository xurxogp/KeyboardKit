//
//  DemoKeyboardView.swift
//  KeyboardTextInput
//
//  Created by Daniel Saidi on 2023-03-10.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import KeyboardKitPro
import SwiftUI

/**
 This view adds a `SystemKeyboard` and two text input fields
 to a `VStack`.

 The text fields use a custom `focused` modifier that can be
 used to also automatically show a "done" button when a text
 field receives input.
 */
struct DemoKeyboardView: View {

    @State
    private var text1 = ""

    @State
    private var text2 = ""

    @FocusState
    private var isFocused1: Bool

    @FocusState
    private var isFocused2: Bool

    unowned var controller: KeyboardInputViewController

    var body: some View {
        VStack(spacing: 0) {
            KeyboardTextField("Type text here...", text: $text1, controller: controller)
                .focused($isFocused1, doneButton: doneButton)
                .padding(3)

            KeyboardTextView(text: $text2, controller: controller)
                .focused($isFocused2, doneButton: doneButton)
                .frame(height: 80)
                .padding(3)

            SystemKeyboard(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { $0.view }
            )
        }.buttonStyle(.plain)
    }

    func doneButton() -> some View {
        Image(systemName: "x.circle.fill")
    }
}
