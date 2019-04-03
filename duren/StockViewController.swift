//
//  StockViewController.swift
//  duren
//
//  Created by Baskoro Nugroho on 28/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StockViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var stockPriceLabel: UILabel!
    @IBOutlet weak var stockPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockPicker.delegate = self
        stockPicker.dataSource = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stocksArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stocksArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + stocksArray[row]
        print(finalURL)
        currencySelected = currencySymbolsArray[7]
        getStockPrice(url: finalURL)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    let baseURL = "http://127.0.0.1:5000/ticker/"
    //let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let stocksArray = ["adhi", "adro","akra","antm","asii","asri","bbca","bbni","bbri","bbtn","bksl","bmri","bsde","cpin","elsa","excl","ggrm","hmsp","icbp","inco","indf","indy","inkp","intp","itmg","jsmr","klbf","lpkr","lppf","medc","mncn","pgas","ptba","ptpp"]
    let currencySymbolsArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    var currencySelected = ""
    
    // get price from python API
    func getStockPrice(url: String) {
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    print("Sucess! Got the price data")
                    let stockPriceJSON : JSON = JSON(response.result.value!)
                    self.updateStockPrice(json: stockPriceJSON)
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.stockPriceLabel.text = "Connection Issues"
                }
        }
    }
    
    // update price label
    func updateStockPrice(json : JSON) {
        if let stockResult = json["Close"].double {
            print("price: \(stockResult)")
            stockPriceLabel.text = "\(currencySelected)\(stockResult)0"
        } else {
            stockPriceLabel.text = "Price unavailable"
        }
    }

}
