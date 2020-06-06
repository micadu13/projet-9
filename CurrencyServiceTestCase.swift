//
//  CurrencyServiceTestCase.swift
//  Projet 9Tests
//
//  Created by Michael Aidan on 01/06/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import XCTest
@testable import Projet_9
class CurrencyServiceTestCase: XCTestCase {

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      //  let currencyService = CurrencyService(session: URLSessionFake())
    }

    func testGetCurrencyShouldPostFailedCallbackIfError(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFakeCurrency(data: nil, response: nil, error: FakeResponseDataCurrency.CurrencyError?.self as? Error))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        currencyService.getCurrency { (success, currency) in
        //Then
        XCTAssertFalse(success)
        XCTAssertNil(currency)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetCurrencyShouldPostFailedCallbackIfNoData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFakeCurrency(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        currencyService.getCurrency { (success, currency) in
        //Then
        XCTAssertFalse(success)
        XCTAssertNil(currency)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyCorrectData, response: FakeResponseDataCurrency.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        currencyService.getCurrency { (success, currency) in
        //Then
        XCTAssertFalse(success)
        XCTAssertNil(currency)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyIncorrectData, response: FakeResponseDataCurrency.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        currencyService.getCurrency { (success, currency) in
        //Then
        XCTAssertFalse(success)
        XCTAssertNil(currency)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostSuccessdCallbackIfNoErrorAndCorrectData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFakeCurrency(data: FakeResponseDataCurrency.currencyCorrectData, response: FakeResponseDataCurrency.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change ")
        currencyService.getCurrency { (success, currency) in
        //Then
        let rates:[String:Double] = ["AED": 4.081305,
        "AFN": 85.07194,
        "ALL": 124.296323,
        "AMD": 536.713299,
        "ANG": 1.99378,
        "AOA": 644.962265,
        "ARS": 76.094415,
        "AUD": 1.651682,
        "AWG": 2.00009,
        "AZN": 1.887993,
        "BAM": 1.956087,
        "BBD": 2.242715,
        "BDT": 94.354035,
        "BGN": 1.952348,
        "BHD": 0.419582,
        "BIF": 2104.606457,
        "BMD": 1.111161,
        "BND": 1.56622,
        "BOB": 7.669876,
        "BRL": 5.967825,
        "BSD": 1.110756,
        "BTC": 0.000116,
        "BTN": 83.880175,
        "BWP": 13.145147,
        "BYN": 2.675051,
        "BYR": 21778.755228,
        "BZD": 2.239014,
        "CAD": 1.524824,
        "CDF": 2020.090518,
        "CHF": 1.068944,
        "CLF": 0.032308,
        "CLP": 891.482891,
        "CNY": 7.930576,
        "COP": 4143.18595,
        "CRC": 632.608803,
        "CUC": 1.111161,
        "CUP": 29.445766,
        "CVE": 110.279483,
        "CZK": 26.88854,
        "DJF": 197.47549,
        "DKK": 7.455557,
        "DOP": 62.502774,
        "DZD": 142.764162,
        "EGP": 17.739734,
        "ERN": 16.667225,
        "ETB": 38.043397,
        "EUR": 1,
        "FJD": 2.464444,
        "FKP": 0.896203,
        "GBP": 0.896141,
        "GEL": 3.539043,
        "GGP": 0.896203,
        "GHS": 6.364636,
        "GIP": 0.896203,
        "GMD": 57.235624,
        "GNF": 10639.897494,
        "GTQ": 8.543999,
        "GYD": 232.202599,
        "HKD": 8.613109,
        "HNL": 27.566869,
        "HRK": 7.589343,
        "HTG": 119.158725,
        "HUF": 345.360281,
        "IDR": 16142.391152,
        "ILS": 3.896319,
        "IMP": 0.896203,
        "INR": 83.89471,
        "IQD": 1326.04607,
        "IRR": 46785.432908,
        "ISK": 150.995718,
        "JEP": 0.896203,
        "JMD": 158.756281,
        "JOD": 0.787834,
        "JPY": 119.699258,
        "KES": 118.668352,
        "KGS": 81.66222,
        "KHR": 4582.443223,
        "KMF": 492.994347,
        "KPW": 1000.099773,
        "KRW": 1364.094488,
        "KWD": 0.342493,
        "KYD": 0.92563,
        "KZT": 453.031556,
        "LAK": 10013.505056,
        "LBP": 1679.435711,
        "LKR": 206.68581,
        "LRD": 220.672812,
        "LSL": 19.545495,
        "LTL": 3.280969,
        "LVL": 0.67213,
        "LYD": 1.565806,
        "MAD": 10.870128,
        "MDL": 19.438254,
        "MGA": 4230.865887,
        "MKD": 61.609233,
        "MMK": 1553.406165,
        "MNT": 3123.008958,
        "MOP": 8.868245,
        "MRO": 396.684486,
        "MUR": 44.720023,
        "MVR": 17.167984,
        "MWK": 818.421515,
        "MXN": 24.576481,
        "MYR": 4.797442,
        "MZN": 77.075698,
        "NAD": 19.545592,
        "NGN": 429.596937,
        "NIO": 37.47126,
        "NOK": 10.797729,
        "NPR": 134.207834,
        "NZD": 1.78268,
        "OMR": 0.427914,
        "PAB": 1.110756,
        "PEN": 3.811035,
        "PGK": 3.881045,
        "PHP": 55.935866,
        "PKR": 180.777169,
        "PLN": 4.426646,
        "PYG": 7380.435796,
        "QAR": 4.045768,
        "RON": 4.848774,
        "RSD": 117.621947,
        "RUB": 77.462401,
        "RWF": 1059.499107,
        "SAR": 4.170916,
        "SBD": 9.263695,
        "SCR": 19.545031,
        "SDG": 61.475013,
        "SEK": 10.464064,
        "SGD": 1.567048,
        "SHP": 0.896203,
        "SLL": 10833.819916,
        "SOS": 645.584549,
        "SRD": 8.287018,
        "STD": 24501.869742,
        "SVC": 9.719364,
        "SYP": 570.52645,
        "SZL": 19.411725,
        "THB": 35.15683,
        "TJS": 11.382495,
        "TMT": 3.900175,
        "TND": 3.19292,
        "TOP": 2.543948,
        "TRY": 7.577457,
        "TTD": 7.505154,
        "TWD": 33.286831,
        "TZS": 2570.310901,
        "UAH": 29.772611,
        "UGX": 4199.751714,
        "USD": 1.111161,
        "UYU": 48.123755,
        "UZS": 11284.172017,
        "VEF": 11.097718,
        "VND": 25841.627574,
        "VUV": 131.891245,
        "WST": 3.045937,
        "XAF": 656.049089,
        "XAG": 0.061265,
        "XAU": 0.000642,
        "XCD": 3.002968,
        "XDR": 0.809614,
        "XOF": 656.043188,
        "XPF": 119.276742,
        "YER": 278.179572,
        "ZAR": 19.404148,
        "ZMK": 10001.786316,
        "ZMW": 20.432384,
        "ZWL": 357.793837]
        
        XCTAssertTrue(success)
        XCTAssertNotNil(currency)
        XCTAssertEqual(rates, currency!.rates)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

}
