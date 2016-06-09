//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by John Witt on 5/12/16.
//  Copyright © 2016 John Witt. All rights reserved.
//
import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate, NSTableViewDataSource, NSTableViewDelegate {
    
    let speechSynthesizer = NSSpeechSynthesizer()
    var _voices : NSArray = NSArray()
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
            
        }
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        let theVoices: NSArray = NSSpeechSynthesizer.availableVoices()
        _voices = theVoices.mutableCopy() as! NSArray
        //self._voices.addObject(NSSpeechSynthesizer.availableVoices())
        self.tableVoices.reloadData()
    }
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var btnStop: NSButton!
    @IBOutlet weak var btnStart: NSButton!
    @IBOutlet weak var tableVoices: NSTableView!
    
    @IBAction func speakButtonClicked(sender: NSButton){
        //print("I should speak \(textView.string)")
                if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
        }
        btnStop.enabled = true
        btnStart.enabled = false
    }

    @IBAction func stopButtonClicked(sender: NSButton){
        //print("The stop button was clicked")
        speechSynthesizer.stopSpeaking()
        btnStop.enabled = false
        btnStart.enabled = true
    }
    //
    // function for speech syn 
    //
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        btnStop.enabled = false
        btnStart.enabled = true
    }
    //
    // the following are the methods for the tableview
    //
    func numberOfRowsInTableView(tableVoices: NSTableView) -> Int {
        return self._voices.count
    }
    
    func tableView(tableVoices: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let item: String = _voices[row] as! String
        let result: NSTableCellView = self.tableVoices.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        let theSpeaker: NSDictionary = NSSpeechSynthesizer.attributesForVoice(item)
        print(theSpeaker.objectForKey(NSVoiceName))
        result.textField?.stringValue = theSpeaker.objectForKey(NSVoiceName) as! String
        return result
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        if (self.tableVoices.numberOfSelectedRows > 0)
        {
            let selectItem = self._voices.objectAtIndex(self.tableVoices.selectedRow) as! String
            print(selectItem)
            self.speechSynthesizer.setVoice(selectItem)
            //self.tableVoices.deselectRow(self.tableVoices.selectedRow)
        }
    }
}