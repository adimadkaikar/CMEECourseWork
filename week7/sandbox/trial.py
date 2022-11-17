import numpy as np

a = np.array(range(5))
a
print(type(a))
print(type(a[0]))

a = np.array(range(5), float)
a.dtype

x = np.arange(5)
x

x = np.arange(5.)
x

x.shape

b = np.array([i for i in range(10) if i % 2 ==1])
b

c = b.tolist()
c

mat = np.array([[0,1], [2,3]])
mat
mat.shape

mat[1]
mat[:, 1]
mat[0,0]
mat[1,0]
mat[:,0]
mat[0,1]
mat[0,-1]
mat[-1,0]
mat[0,-2]

mat[0,0] = -1
mat

mat[:,0] = [12,12]
mat

np.append(mat, [[12,12]], axis = 0)
np.append(mat, [[12],[12]], axis = 1)

newRow = [[12,12]]
mat = np.append(mat, newRow, axis = 0)
mat
np.delete(mat, 2, 0)

mat = np.array([[0,1], [2,3]])
mat0 = np.array([[0,10], [-1,3]])
np.concatenate((mat, mat0), axis = 0)

mat.ravel()
mat.reshape((4, 1))
mat.reshape((1, 4))

np.ones((4, 2))
np.zeros((4, 2))

m = np.identity(4)
m

m.fill(16)

mm = np.arange(16)
mm = mm.reshape(4,4)
mm

mm.transpose()

mm + mm.transpose()
mm - mm.transpose()
mm * mm.transpose()
mm // mm.transpose()
mm // (mm + 1).transpose()
mm * np.pi
mm.dot(mm)

mm = np.matrix(mm)
mm
print(type(mm))
mm * mm

from scipy import stats 
from scipy import integrate 
import matplotlib.pylab as p

np.random.seed(1234)
stats.norm.rvs(size=10)

stats.norm.rvs(size=5 , random_state=1234)
stats.norm.rvs(0 , 10, size=7)

stats.randint.rvs(0, 10, size = 7, random_state = 1234)
stats.randint.rvs(0, 10, size = 7, random_state = 3445)

y = np.array([5, 20, 18, 19, 18, 7, 4])

p.plot(y)
p.show()
area = integrate.trapz(y, dx = 2)
print('area =', area)

area = integrate.trapz(y, dx = 1)
print('area =', area)

area = integrate.trapz(y, dx = 3)
print('area =', area)

area = integrate.simps(y, dx = 2)
print('area =', area)

area = integrate.simps(y, dx = 1)
print('area =', area)

area = integrate.simps(y, dx = 3)
print('area =', area)

def dCR_dt(pops, t=0):
    
    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C
    dCdt = -z * C + a * e * R * C
    
    return np.array([dRdt, dCdt])

type(dCR_dt)
r = 1.
a = 0.1
z = 1.5
e = 0.75

t = np.linspace(0, 15, 1000)

R0 = 10
C0 = 5
RC0 = np.array([R0, C0])

pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)
pops

type(infodict)
infodict.keys()

infodict['message']

f1 = p.figure()

p.plot(t, pops[:,0], 'g-', label = 'Resource density')
p.plot(t, pops[:, 1], 'b-', label = 'Consumer density')
p.grid()
p.legend(loc="best")
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')
p.show()

f1.savefig('../results/LV_model.pdf')
