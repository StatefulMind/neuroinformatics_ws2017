import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
import pylab

# bayesian regression

a = 0.0
b = 10.0
x = np.linspace(a,b,num=1000)
tmp = stats.norm(5,1)
y_LIKELIHOOD = tmp.pdf(x)
y_PRIOR = np.ones(x.shape)*(b-a)**(-1)

y_POSTERIOR = y_LIKELIHOOD * y_PRIOR / np.cumsum(y_LIKELIHOOD*y_PRIOR)[-1]

# plotting

fig, axes = plt.subplots(nrows=3, ncols=4)
fig.set_figwidth(14)
fig.tight_layout()

plt.subplot(1, 3, 1)
plt.plot(x,y_POSTERIOR, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,5.,10.])
pylab.ylim([0,.005])
plt.locator_params(axis='y', nbins=4)
plt.title('posterior')
            
plt.subplot(1, 3, 2)
plt.plot(x,y_LIKELIHOOD, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,5.,10.])
pylab.ylim([0,.5])
plt.locator_params(axis='y', nbins=4)
plt.title('likelihood')
            
plt.subplot(1, 3, 3)
plt.plot(x,y_PRIOR, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,5.,10.])
pylab.ylim([.095,.110])
plt.locator_params(axis='y', nbins=4)
plt.title('prior')

# save fig

plt.savefig('fig12-1.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)