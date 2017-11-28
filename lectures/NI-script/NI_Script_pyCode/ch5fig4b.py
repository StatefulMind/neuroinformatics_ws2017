import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

# beta distribution

""" 
ROW 1
"""

fig, axes = plt.subplots(nrows=3, ncols=4)
fig.tight_layout() # Or equivalently,  "plt.tight_layout()"
x = np.linspace(0.0,1.0,num=1000)

plt.subplot(3, 4, 1)

alpha = .9
beta = .9
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 2)

alpha = 1
beta = 1
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 3)

alpha = 2
beta = 2
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 4)

alpha = 5
beta = 5
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))

""" 
ROW 2
"""

plt.subplot(3, 4, 5)

alpha = 1
beta = 2
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 6)

alpha = 1
beta = 5
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 7)

alpha = 2
beta = 5
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 8)

alpha = 2
beta = 10
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))

""" 
ROW 3
"""

plt.subplot(3, 4, 9)

alpha = 2
beta = 1
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 10)

alpha = 5
beta = 1
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 11)

alpha = 5
beta = 2
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))
            
plt.subplot(3, 4, 12)

alpha = 10
beta = 2
alpha_BETADISTfull = stats.beta(alpha,beta)
alpha_BETADIST = alpha_BETADISTfull.pdf(x)
plt.plot(x,alpha_BETADIST, linewidth=1.5, color=[1,0.58,0])
plt.xticks([0.,.5,1.])
plt.locator_params(axis='y', nbins=4)
plt.title(r'$\alpha$='+ str(alpha) + r', $\beta$=' + str(beta))

"""
save figure
"""

plt.savefig('fig5-4b.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)