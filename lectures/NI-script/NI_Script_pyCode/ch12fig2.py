import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
import pylab

# bayesian regression

a = 0.
b = 1.

x = np.linspace(a,b,num=1000)

tmp = stats.norm(5,1)
y_LIKELIHOOD = tmp.pdf(x)
y_PRIOR = np.ones(x.shape)*(b-a)**(-1)
y_POSTERIOR = y_LIKELIHOOD * y_PRIOR / np.cumsum(y_LIKELIHOOD*y_PRIOR)[-1]

# plotting

fig, axes = plt.subplots(nrows=1, ncols=3)
fig.set_figwidth(12)
fig.tight_layout()

# 3)
         
plt.subplot(1, 3, 3)
P_tmp = stats.beta(10,28)
y_PRIOR = P_tmp.pdf(x) / np.cumsum(P_tmp.pdf(x))[-1]
L_tmp = stats.beta(12,3)
y_LIKELIHOOD = L_tmp.pdf(x) / np.cumsum(L_tmp.pdf(x))[-1]
y_POSTERIOR = y_LIKELIHOOD * y_PRIOR / np.cumsum(y_LIKELIHOOD*y_PRIOR)[-1]
max_PRIOR = x[np.argmax(y_PRIOR)]
max_LIKELIHOOD = x[np.argmax(y_LIKELIHOOD)]
max_POSTERIOR = x[np.argmax(y_POSTERIOR)]
plt.plot(x,y_PRIOR, linewidth=2, color=[.4,.4,1.], label="prior")
plt.plot(x,y_LIKELIHOOD, linewidth=2, color=[1.,.4,.4], label="likelihood")
plt.plot(x,y_POSTERIOR, linewidth=2, color=[.8,.4,.7], label="posterior")
axes = plt.gca()
plotheight = axes.get_ylim()[1]*1.15
plt.plot([max_PRIOR,max_PRIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.4,.4,1])
plt.plot([max_LIKELIHOOD,max_LIKELIHOOD],[0,plotheight], linewidth=1.25, linestyle='--', color=[1,.4,.4])
plt.plot([max_POSTERIOR,max_POSTERIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.8,.4,.7])
axes.set_yticklabels([])
plt.legend(loc=1)
plt.title('strong prior')
      
# 2)  

plt.subplot(1, 3, 2)
P_tmp = stats.beta(5,12.3)
y_PRIOR = P_tmp.pdf(x) / np.cumsum(P_tmp.pdf(x))[-1]
L_tmp = stats.beta(12,3)
y_LIKELIHOOD = L_tmp.pdf(x) / np.cumsum(L_tmp.pdf(x))[-1]
y_POSTERIOR = y_LIKELIHOOD * y_PRIOR / np.cumsum(y_LIKELIHOOD*y_PRIOR)[-1]
max_PRIOR = x[np.argmax(y_PRIOR)]
max_LIKELIHOOD = x[np.argmax(y_LIKELIHOOD)]
max_POSTERIOR = x[np.argmax(y_POSTERIOR)]
plt.plot(x,y_PRIOR, linewidth=2, color=[.4,.4,1.], label="prior")
plt.plot(x,y_LIKELIHOOD, linewidth=2, color=[1.,.4,.4], label="likelihood")
plt.plot(x,y_POSTERIOR, linewidth=2, color=[.8,.4,.7], label="posterior")
axes = plt.gca()
plt.plot([max_PRIOR,max_PRIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.4,.4,1])
plt.plot([max_LIKELIHOOD,max_LIKELIHOOD],[0,plotheight], linewidth=1.25, linestyle='--', color=[1,.4,.4])
plt.plot([max_POSTERIOR,max_POSTERIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.8,.4,.7])
axes.set_yticklabels([])
plt.legend(loc=1)
plt.title('medium strength prior')
   
# 1)

plt.subplot(1, 3, 1)
P_tmp = stats.beta(2,4)
y_PRIOR = P_tmp.pdf(x) / np.cumsum(P_tmp.pdf(x))[-1]
L_tmp = stats.beta(12,3)
y_LIKELIHOOD = L_tmp.pdf(x) / np.cumsum(L_tmp.pdf(x))[-1]
y_POSTERIOR = y_LIKELIHOOD * y_PRIOR / np.cumsum(y_LIKELIHOOD*y_PRIOR)[-1]
max_PRIOR = x[np.argmax(y_PRIOR)]
max_LIKELIHOOD = x[np.argmax(y_LIKELIHOOD)]
max_POSTERIOR = x[np.argmax(y_POSTERIOR)]
plt.plot(x,y_PRIOR, linewidth=2, color=[.4,.4,1.], label="prior")
plt.plot(x,y_LIKELIHOOD, linewidth=2, color=[1.,.4,.4], label="likelihood")
plt.plot(x,y_POSTERIOR, linewidth=2, color=[.8,.4,.7], label="posterior")
axes = plt.gca()
plt.plot([max_PRIOR,max_PRIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.4,.4,1])
plt.plot([max_LIKELIHOOD,max_LIKELIHOOD],[0,plotheight], linewidth=1.25, linestyle='--', color=[1,.4,.4])
plt.plot([max_POSTERIOR,max_POSTERIOR],[0,plotheight], linewidth=1.25, linestyle='--', color=[.8,.4,.7])
axes.set_yticklabels([])
plt.legend(loc=1)
plt.title('weak prior')

# save fig

plt.savefig('fig14-2.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)
