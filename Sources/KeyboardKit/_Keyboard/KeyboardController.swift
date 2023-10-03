//
//  KeyboardActionTrigger.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-01-23.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol is used to make using the keyboard input view
 controller more abstract and available to more platforms.

 ``KeyboardInputViewController`` implements this protocol by
 calling itself, its document proxy, or its keyboard context.

 The protocol currently defines what's currently required to
 trigger controller-specific actions within the library, but
 it may add functionality over time. Note that this protocol
 should only specify operations and not state.
 */
public protocol KeyboardController: AnyObject {
    
    /// The controller's keyboard-specific services
    var services: Keyboard.KeyboardServices{ get }
    
    /// The controller's keyboard-specific state
    var state: Keyboard.KeyboardState { get }
    

    /// Adjust the text input cursor position.
    func adjustTextPosition(byCharacterOffset: Int)

    /// Delete backwards.
    func deleteBackward()

    /// Delete backwards a certain number of times.
    func deleteBackward(times: Int)

    /// Dismiss the keyboard.
    func dismissKeyboard()

    /// Insert the provided autocomplete suggestion.
    func insertAutocompleteSuggestion(_ suggestion: Autocomplete.Suggestion)

    /// Insert the provided text.
    func insertText(_ text: String)

    /// Perform an autocomplete operation.
    func performAutocomplete()

    /// Perform a keyboard-initiated dictation operation.
    func performDictation()

    /// Reset the current autocomplete state.
    func resetAutocomplete()

    /// Select the next keyboard, if any.
    func selectNextKeyboard()

    /// Select the next locale, if any.
    func selectNextLocale()

    /// Set a certain keyboard type.
    func setKeyboardType(_ type: Keyboard.KeyboardType)

    /// Open a certain URL
    func openUrl(_ url: URL?)
}
