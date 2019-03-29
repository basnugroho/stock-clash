//
//  PortfolioViewController.swift
//  duren
//
//  Created by Baskoro Nugroho on 28/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import Charts

class PortfolioViewController: UIViewController {
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var cashStepper: UIStepper!
    @IBOutlet weak var stockStepper: UIStepper!
    
    var cashData = PieChartDataEntry(value: 0)
    var stockData = PieChartDataEntry(value: 0)
    
    var totalAssets = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.chartDescription?.text = ""
        
        cashData.value = cashStepper.value
        cashData.label = "cash"
        
        stockData.value = stockStepper.value
        stockData.label = "stock"
        
        totalAssets = [cashData, stockData]
        
        updateChart()
    }
    
    @IBAction func cashTapped(_ sender: UIStepper) {
        cashData.value = sender.value
        print("cash data: \(cashData.value)")
        updateChart()
    }
    
    @IBAction func stockTapped(_ sender: UIStepper) {
        stockData.value = sender.value
        print("stock data: \(stockData.value)")
        updateChart()
    }
    
    func updateChart() {
        let charDataset = PieChartDataSet(values: totalAssets, label: nil)
        let chartData = PieChartData(dataSet: charDataset)
        
        let colors = [UIColor(named: "cashColor"), UIColor(named: "stockColor")]
        charDataset.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
    }
}
