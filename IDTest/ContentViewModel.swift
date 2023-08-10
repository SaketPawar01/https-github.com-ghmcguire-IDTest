/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The view model that supports the document reader user interface.
*/

import Foundation
import ProximityReader

@MainActor
final class ContentViewModel: ObservableObject {
    var minAge: Int = 21
    
    private var cachedSession: MobileDocumentReaderSession?

    func verifyButtonTapped(minAge: Int) {
        self.minAge = minAge
        Task {
            // Check that the device supports mobile document reading.
            guard MobileDocumentReader.isSupported else {
                // This device doesn't support Tap to Present ID on iPhone.
                return
            }

            do {
                try await self.verifyAge()
            } catch MobileDocumentReaderError.cancelled {
                // The user dismissed the document reader user interface.
            } catch {
                print("An error occurred while reading a mobile document: \(error.localizedDescription)")
                print("Err: \(error)")
            }
        }
    }

    private func verifyAge() async throws {
        print("Requesting age:", minAge)
        // Create a driver's license display request containing the age over 21 element.
        let request = MobileDriversLicenseDisplayRequest(elements: [.ageAtLeast(minAge),.familyName,.givenName])
//        let request = MobileDriversLicenseDisplayRequest(elements: [.ageAtLeast(21)])

        // Perform the request using a previously cached reader session, if present.
        // If the cached session has expired, prepare the device for document reading again.
//        if let cachedSession = self.cachedSession {
//            do {
//                try await cachedSession.requestDocument(request)
//                return
//            } catch MobileDocumentReaderError.sessionExpired {
//                self.cachedSession = nil
//            }
//        }

        // To prepare the device for document reading, first create a mobile document reader object.
        let reader = MobileDocumentReader()

        // Then, call `prepare`. If successful, cache the returned reader session object.
//        let readerSession = try await reader.prepare(using: .init(String))
        let readerSession = try await reader.prepare()
        self.cachedSession = readerSession

        // Finally, request the document again with the newly created session.
        try await readerSession.requestDocument(request)
    }

}
