import XCTest
@testable import DesignPatterns

class VisitorPatternTests: XCTestCase {
  private let emergencyContact = MobileContact(phoneNumber: "123456 415 043", importance: .emergencyContact)
  private let standardContact = MobileContact(phoneNumber: "123456 415 111", importance: .standard)

  private let veryHighImportanceApp = MobileApp(appIdentifier: "sysApp", priority: .veryHigh)
  private let highImportanceApp = MobileApp(appIdentifier: "bankingApp", priority: .high)
  private let lowImportanceApp = MobileApp(appIdentifier: "twitter", priority: .low)

  func test_lowBatteryPolicy_handlesAsExpected() {
    let app = VisitorAppExample(policy: LowBatteryAlertPolicy(apps: [veryHighImportanceApp, highImportanceApp, lowImportanceApp]))
    
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: emergencyContact)))
    
    XCTAssertTrue(app.shouldNotifyUser(of: InstantMessage(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: InstantMessage(contact: emergencyContact)))
    
    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: veryHighImportanceApp)))
    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: highImportanceApp)))
    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: lowImportanceApp)))
  }
  
  func test_trainingPolicy_handlesAsExpected() {
    let app = VisitorAppExample(policy: TrainingModeAlertPolicy(contacts: [emergencyContact, standardContact], apps: [veryHighImportanceApp, highImportanceApp, lowImportanceApp]))
    
    XCTAssertFalse(app.shouldNotifyUser(of: IncomingCall(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: emergencyContact)))

    XCTAssertFalse(app.shouldNotifyUser(of: InstantMessage(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: InstantMessage(contact: emergencyContact)))

    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: veryHighImportanceApp)))
    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: highImportanceApp)))
    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: lowImportanceApp)))
  }
  
  func test_standardPolicy_handlesAsExpected() {
    let app = VisitorAppExample(policy: StandardAlertPolicy())
    
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: emergencyContact)))

    XCTAssertTrue(app.shouldNotifyUser(of: InstantMessage(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: InstantMessage(contact: emergencyContact)))

    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: veryHighImportanceApp)))
    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: highImportanceApp)))
    XCTAssertTrue(app.shouldNotifyUser(of: PushNotification(app: lowImportanceApp)))
  }
  
  func test_sleepPolicy_handlesAsExpected() {
    let app = VisitorAppExample(policy: SleepModeAlertPolicy(contacts: [emergencyContact, standardContact]))
    
    XCTAssertFalse(app.shouldNotifyUser(of: IncomingCall(contact: standardContact)))
    XCTAssertTrue(app.shouldNotifyUser(of: IncomingCall(contact: emergencyContact)))

    XCTAssertFalse(app.shouldNotifyUser(of: InstantMessage(contact: standardContact)))
    XCTAssertFalse(app.shouldNotifyUser(of: InstantMessage(contact: emergencyContact)))

    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: veryHighImportanceApp)))
    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: highImportanceApp)))
    XCTAssertFalse(app.shouldNotifyUser(of: PushNotification(app: lowImportanceApp)))
  }
}
