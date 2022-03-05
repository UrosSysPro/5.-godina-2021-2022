class Complex:
    def __init__(self,re,im):   
        self.re=re
        self.im=im

    def add(self,c):
        self.re+=c.re
        self.im+=c.im
    
    def mul(self,c):
        re=c.re * self.re - c.im * self.im
        im=self.re * c.im+self.im * c.re
        
        self.re=re
        self.im=im
    
    def add(c1,c2):
        c=Complex(0,0)
        c.re=c1.re+c2.re
        c.im=c1.im+c2.im
        return c

    def mul(c1,c2):
        re=c1.re*c2.re-c1.im*c2.im
        im=c1.re*c2.im+c1.im*c2.re
        return Complex(re,im)
    