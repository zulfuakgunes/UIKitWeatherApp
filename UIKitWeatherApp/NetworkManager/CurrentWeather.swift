import Alamofire
import Foundation
import SwiftyJSON

class CurrentWeather {

    static let shared = CurrentWeather()
    
    func fetchCurrentWeather(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let url = "http://api.weatherstack.com/current?access_key=dae1894aad43f4476b924686e2018075&query=New%20York"
        
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil)
        .response {
            response in
            switch response.result {
            case .success(let data):
                if let data {
                    let json = JSON(data)
                    do {
                        let weatherData = try self.parseWeatherData(json)
                        completion(.success(weatherData))
                    } catch {
                        completion(.failure(error))
                    }
                }
                else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Veri yok"])))
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func parseWeatherData(_ json: JSON) throws -> WeatherData {
            do {
                let request = try self.parseRequest(json["request"])
                let location = try self.parseLocation(json["location"])
                let current = try self.parseCurrent(json["current"])

                return WeatherData(request: request, location: location, current: current)
            } catch {
                throw error
            }
        }

        private func parseRequest(_ json: JSON) throws -> Request {
            return Request(
                type: json["type"].stringValue,
                query: json["query"].stringValue,
                language: json["language"].stringValue,
                unit: json["unit"].stringValue
            )
        }

        private func parseLocation(_ json: JSON) throws -> Location {
            return Location(
                name: json["name"].stringValue,
                country: json["country"].stringValue,
                region: json["region"].stringValue,
                lat: json["lat"].stringValue,
                lon: json["lon"].stringValue,
                timezoneId: json["timezone_id"].stringValue,
                localtime: json["localtime"].stringValue,
                localtimeEpoch: json["localtime_epoch"].intValue,
                utcOffset: json["utc_offset"].stringValue
            )
        }

        private func parseCurrent(_ json: JSON) throws -> Current {
            return Current(
                observationTime: json["observation_time"].stringValue,
                temperature: json["temperature"].intValue,
                weatherCode: json["weather_code"].intValue,
                weatherIcons: json["weather_icons"].arrayValue.map { $0.stringValue },
                weatherDescriptions: json["weather_descriptions"].arrayValue.map { $0.stringValue },
                windSpeed: json["wind_speed"].intValue,
                windDegree: json["wind_degree"].intValue,
                windDir: json["wind_dir"].stringValue,
                pressure: json["pressure"].intValue,
                precip: json["precip"].doubleValue,
                humidity: json["humidity"].intValue,
                cloudcover: json["cloudcover"].intValue,
                feelslike: json["feelslike"].intValue,
                uvIndex: json["uv_index"].intValue,
                visibility: json["visibility"].intValue,
                isDay: json["is_day"].stringValue
            )
        }
    
}

