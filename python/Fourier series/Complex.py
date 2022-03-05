from math import *

class Complex:
    def __init__(self,re,im):
        self.re=re
        self.im=im
    
    def add(self,c):
        self.re+=c.re
        self.im+=c.im
    def mul(self,c):
        re=self.re*c.re-self.im*c.im
        im=self.re*c.im+self.im*c.re
        self.re=re
        self.im=im
    def abs(self):
        return sqrt(self.re*self.re+self.im*self.im)