imports System

public class vb_sync 
	inherits OboutInc.oboutAJAXPage

	public function onDnD2(byval number1 as Int32, byval number2 as Int32) as string
		dim dt as DateTime = DateTime.Now
		while (DateTime.Now.Subtract(dt).Seconds < 3) 
		end while
		return (number1 + number2).ToString()
	end function
end class