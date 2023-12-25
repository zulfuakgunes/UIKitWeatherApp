import Foundation

// Ana veri yapısını temsil eder
struct WeatherData: Codable {
    let request: Request
    let location: Location
    let current: Current
}

// "request" bölümünü temsil eder
struct Request: Codable {
    let type: String
    let query: String
    let language: String
    let unit: String
}

// "location" bölümünü temsil eder
struct Location: Codable {
    let name: String
    let country: String
    let region: String
    let lat: String
    let lon: String
    let timezoneId: String
    let localtime: String
    let localtimeEpoch: Int
    let utcOffset: String

    enum CodingKeys: String, CodingKey {
        case name, country, region, lat, lon, timezoneId = "timezone_id", localtime, localtimeEpoch = "localtime_epoch", utcOffset = "utc_offset"
    }
}

// "current" bölümünü temsil eder
struct Current: Codable {
    let observationTime: String
    let temperature: Int
    let weatherCode: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let windSpeed: Int
    let windDegree: Int
    let windDir: String
    let pressure: Int
    let precip: Double
    let humidity: Int
    let cloudcover: Int
    let feelslike: Int
    let uvIndex: Int
    let visibility: Int
    let isDay: String

    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time", temperature, weatherCode = "weather_code", weatherIcons = "weather_icons", weatherDescriptions = "weather_descriptions", windSpeed = "wind_speed", windDegree = "wind_degree", windDir = "wind_dir", pressure, precip, humidity, cloudcover, feelslike, uvIndex = "uv_index", visibility, isDay = "is_day"
    }
}

