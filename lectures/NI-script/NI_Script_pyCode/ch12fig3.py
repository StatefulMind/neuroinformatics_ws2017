import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
import pylab


def genmodel(a0,a1,x,sigma):
    noise = np.random.normal(loc=0.,scale=sigma)
    data_sample = a0+a1*x+noise
    return data_sample

a0 = -.3
a1 = .5
sigma = .2
n_trials = 20

x = np.zeros([n_trials,1])
t = np.zeros([n_trials,1])

# create prior_0
XX,YY = np.mgrid[-1:1:.01, -1:1:.01]
pos = np.empty(XX.shape + (2,))
pos[:, :, 0] = XX
pos[:, :, 1] = YY
norm = stats.multivariate_normal([0.,0.],[[.2,0.],[0.,.2]])
prior_0 = norm.pdf(pos)
plt.imshow(prior_0,extent=[-1.,1.,-1.,1.])
plt.show()

for i in range(n_trials):
    x[i] = np.random.uniform(low=-1.,high=1.)
    t[i] = genmodel(a0,a1,x[i],sigma)
    w = np.linalg.pinv([1,x[i]])*t[i]
    
    
