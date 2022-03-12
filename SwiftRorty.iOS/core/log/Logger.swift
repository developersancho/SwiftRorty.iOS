//
//  Logger.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 9.03.2022.
//

import Foundation
import OSLog


import Foundation
import OSLog

public class Log {

    /// Show message while debugging
    static func debug(category: String = "MyApp", _ message: String) {

        Logger.message().debug("[Debug] \(message)")
    }

    /// Show message as information
    static func info(category: String = "MyApp", _ message: String) {

        Logger.message().info("[Info] \(message)")
    }

    /// Show message when a condition may require special handling
    static func notice(category: String = "MyApp", _ message: String) {

        Logger.message().notice("[Notice] \(message)")
    }

    /// Show message when a condition requires special handling
    static func warning(category: String = "MyApp", _ message: String) {

        Logger.message().warning("[Warning] \(message)")
    }

    /// Show message as error
    static func error(category: String = "MyApp", _ message: String) {

        Logger.message().error("[Error] \(message)")
    }

    /// Show message when require immediate attention
    static func critical(category: String = "MyApp", _ message: String) {

        Logger.message().critical("[Attention] \(message)")
    }
}

extension Logger {

    private static var bundleIdentifier = Bundle.main.bundleIdentifier!

    static func message(_ category: String = "MyApp") -> Logger {

        Logger(subsystem: "\(bundleIdentifier)", category: "MyApp")
    }

    static func retrieveLogs(interval: Double = -86400) throws -> [OSLogEntryLog] {
        // Open the log store.
        let logStore = try OSLogStore(scope: .currentProcessIdentifier)

        // Get all the logs from the last hour.
        let oneDayAgo = logStore.position(date: Date().addingTimeInterval(interval))

        // Fetch log objects.
        let allEntries = try logStore.getEntries(at: oneDayAgo)

        // Filter the log to be relevant for our specific subsystem
        // and remove other elements (signposts, etc).
        return allEntries
            .compactMap {
                $0 as? OSLogEntryLog
            }
            .filter {
                $0.subsystem == Bundle.main.bundleIdentifier!
            }
    }
}
