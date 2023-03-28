class A  
  private def priv; end
  protected def prot; end
end  

class B < A  
  def initialize  
    a = A.new  
      
    # You can call a protected method on an instance of the parent class from a subclass.  
    a.prot  
      
    # But not a private method. This will fail.  
    # This is trying to call a private method "publicly" from another object
    a.priv  
  end  
end  
		  
B.new
