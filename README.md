# Sample-SendMoney

Sample-SendMoney app is built using Swift and SwiftUI with an MVVM architecture.

## Overview

Sample-SendMoney is specifically made to practice my skills especially on SwiftUI and MVVM architecture.

## Features

- Login
- Dashboard
- Send Money
- Transactions List

## Requirements

- macOS Sequoia or later
- Xcode 16+
- iOS 18+
- Swift 6

## Technologies

- Swift
- SwiftUI
- Swift Testing

## Architecture

It is encouraged to use the MVVM architecture in SwiftUI due to its reactive pattern that's why Sample-SendMoney's architecture revolves around the MVVM pattern. 

Project structure:

```
Sample-SendMoney
├── Data
├── Network
├── UIComponents
├── Preview Content
├── Resources
├── Utils
├── Views
   ├── Dashboard
   ├── Login
   ├── SendMoney
   ├── TransactionHistory
└── Sample-SendMoneyTests
```
## Setup

1. Clone the repository.
2. Open `Sample-SendMoney.xcodeproj`.
3. Build and run using Xcode.

## Running Tests

Press **⌘U** in Xcode or go to Product > Test

## Assumptions

- Loading, Empty and Error States are handled for screens.
- Page error displays a generic error.
- Data local caching wasn't managed.
- Authentication is mocked.

## Known Limitations

- Refine and enchance tests where it should be very similar to real life scenarios.
- Fix issue on the authentication to be able to cross-match the password saved in the keychain access.
- Refine usage of the local storage. (@AppStorage)
- Better design and user prompts.
- No persistence of data when offline.
- No pagination on Transaction History list. (Since API is mocked)

## Future Improvements

If given additional time, I would:

- Improve UI polish.
- Increase unit test coverage.
