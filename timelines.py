#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
In this code, we receive data from
a QtGui.QInputDialog dialog. 

author: Abhiram R
website: abhiramrk.in 
last edited: September 2014
"""

import sys
from PyQt4 import QtGui


class Input(QtGui.QWidget):
    
    def __init__(self):
        super(Input, self).__init__()
        
        self.initUI()
        
    def initUI(self):      

        self.btn = QtGui.QPushButton('Enter start date', self)
        self.btn.move(20, 20)
        self.btn.clicked.connect(self.showDialog)
        
        self.le = QtGui.QLineEdit(self)
        self.le.move(130, 22)

        self.btn = QtGui.QPushButton('Enter end date', self)
        self.btn.move(20, 20)
        self.btn.clicked.connect(self.showDialog)

        self.le = QtGui.QLineEdit(self)
        self.le.move(130, 22)
        
        self.setGeometry(300, 300, 290, 150)
        self.setWindowTitle('Enter values box')
        self.show()
        
    def showDialog(self):
        
        text, ok = QtGui.QInputDialog.getText(self, 'Input Dialog', 
            'Enter your name:')
        
        if ok:
            self.le.setText(str(text))
        
def main():
    
    app = QtGui.QApplication(sys.argv)
    ex = Input()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()