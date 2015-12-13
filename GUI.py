import Tkinter as tk
from generate_n_pen import *
import time

class Gui:
    def __init__(self, root):
        self.master = root
        self.init_fields()

    def simulate_pen(self):
    	l_temp = str(self.l_s.get())
    	m_temp = str(self.m_s.get())
    	t_temp = str(self.t_s.get())
    	tv_temp = str(self.tv_s.get())
    	time_in = str(self.time_s.get())
    	n_len = len(l_temp.split(","))

    	l_in = []
    	m_in = []
    	t_in = []
    	tv_in = []

    	in_temp = [l_temp, m_temp, t_temp, tv_temp]
    	inputs = [l_in, m_in, t_in, tv_in]

    	for i in range(len(inputs)):
    		nums = in_temp[i].split(",")
    		if len(nums) != n_len:
    			print "ERROR: Input lengths don't match"
    			return
    		else:
    			for num in nums:
    				inputs[i].append(num)
    	create_matlab(l_in, m_in, t_in, tv_in, time_in)

    def init_fields(self):
        self.f1 = tk.Frame(self.master)
        self.f1.pack(side=tk.TOP, fill=tk.X)

        self.f2 = tk.Frame(self.master)
        self.f2.pack(side=tk.TOP, fill=tk.X)

        self.f3 = tk.Frame(self.master)
        self.f3.pack(side=tk.TOP, fill=tk.X)

        self.f4 = tk.Frame(self.master)
        self.f4.pack(side=tk.TOP, fill=tk.X)

        self.f5 = tk.Frame(self.master)
        self.f5.pack(side=tk.TOP, fill=tk.X)

        self.f6 = tk.Frame(self.master)
        self.f6.pack(side=tk.TOP, fill=tk.X)

        self.f7 = tk.Frame(self.master)
        self.f7.pack(side=tk.TOP, fill=tk.X)

      	tk.Label(self.f1, text="Enter values as a comma delineated string").pack(side=tk.LEFT)

        self.l_s = tk.Entry(self.f2)
        tk.Label(self.f2, text="Lengths (m): ").pack(side=tk.LEFT)
        self.l_s.pack()

        self.m_s = tk.Entry(self.f3)
        tk.Label(self.f3, text="Masses (kg): ").pack(side=tk.LEFT)
        self.m_s.pack()

        self.t_s = tk.Entry(self.f4)
        tk.Label(self.f4, text="Theta0:         ").pack(side=tk.LEFT)
        self.t_s.pack()

        self.tv_s = tk.Entry(self.f5)
        tk.Label(self.f5, text="Theta_v0:      ").pack(side=tk.LEFT)
        self.tv_s.pack()        

        self.time_s = tk.Entry(self.f6)
        tk.Label(self.f6, text="Time (s):       ").pack(side=tk.LEFT)
        self.time_s.pack() 

        set_button = tk.Button(self.f7, text="Simulate!", command=self.simulate_pen)
        set_button.bind('<Return>', self.simulate_pen)
        set_button.pack(side=tk.RIGHT)


if __name__ == '__main__':
    root = tk.Tk()
    root.wm_title("Complex Pendulum Simulator")
    Gui(root)
    root.mainloop()