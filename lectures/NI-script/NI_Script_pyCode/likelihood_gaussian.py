import numpy as np
import scipy
import scipy.stats as scistats
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import pylab as pl
from mpl_toolkits.mplot3d import axes3d
from matplotlib import cm

np.random.seed([10]) # 6, 10!, 13, 15!

"""
SETUP
"""
n = 5 # number of draws per sample
mu = 175
sigma = 12

mu_est = 173.72983486849881
sigma_est = 15.69712224544357

stepsize_mu = 150
stepsize_sigma = 400

"""
TRUE MODEL + SAMPLE
"""
truemodel_x = np.linspace(150,200,stepsize_mu)
truemodel_p = scistats.norm.pdf(truemodel_x,mu,sigma)
estmodel_p = scistats.norm.pdf(truemodel_x,mu_est,sigma_est)
sample = np.random.normal(mu,sigma,n) # drawing samples
# plotting
fig = plt.figure()
fig.set_size_inches(8.,4.)
plt.plot([150,200],[0,0],color='black')
plt.plot(truemodel_x,truemodel_p,linewidth=2.,color='black',label='true model')
plt.plot(truemodel_x,estmodel_p,linewidth=2.,color='red',label='estimated model')
plt.plot(sample,np.zeros(sample.shape),'x',linewidth=3,color='blue',label='measurements')
plt.xlabel(r'$X$', fontsize=15)
axes = plt.gca()
pl.ylim([-axes.get_ylim()[1]*.1,axes.get_ylim()[1]*1.15])
plotwidth = axes.get_xlim()[1]
plt.legend(loc=1)
plt.savefig('figL-1.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)
plt.show()
         
"""
LIKELIHOOD FUNCTIONS FOR SINGLE DATA POINTS + JOINT LIKELIHOOD (FOR MU)
"""
# meshgrid
axis_mu = np.linspace(120, 240, stepsize_mu)
sigma = 15.69712224544357 # doesn't matter, just needs to be fixed
L_mu_i = np.ones((axis_mu.shape[0],n))
L_mu = np.ones((axis_mu.shape[0],))

fig = plt.figure()
fig.set_size_inches(8.,4.)
for i in range (n):
    L_mu_i[:,i] = scistats.norm.pdf(sample[i],axis_mu,sigma)
    L_mu *= L_mu_i[:,i]*1000
    if i == 0:  
        plt.plot(axis_mu,L_mu_i[:,i],linewidth=1.25,color='blue',label=r'$L_i(\mu|x_i,\sigma^2_{ML})$')
    else:
        plt.plot(axis_mu,L_mu_i[:,i],linewidth=1.25,color='blue')
    plt.plot(sample,np.zeros(sample.shape),'x',linewidth=3,color='blue')
L_mu_unscaled = L_mu.copy()
L_mu = L_mu/np.max(L_mu)*np.max(L_mu_i)*1.2
mu_ML = np.sum(sample)/n
plt.plot([mu_ML,mu_ML],[np.max(L_mu),0],color='red',label=r'$\mu_{ML}$')
plt.plot(axis_mu,L_mu,linewidth=2.,color='green',label=r'$L(\mu|\vec{x},\sigma^2_{ML})$ [scaled]')
axes = plt.gca()
pl.ylim([-axes.get_ylim()[1]*.1,axes.get_ylim()[1]*1.5])
plotwidth = axes.get_xlim()[1]
plt.legend(loc=1)
plt.plot([120,240],[0,0],color='black')
plt.xlabel(r'$\mu$', fontsize=15)
plt.ylabel(r'$p(\vec{x}|\mu_{ML},\sigma^2)$', fontsize=15)
plt.title(r'Likelihood function for $\mu$',fontsize=15)
plt.savefig('figL-2.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)
plt.show()
   
"""
SINGLE POINT LIKELIHOODS + JOINT LIKELIHOOD (FOR SIGMA, MU_ML ONLY)
"""
# meshgrid
axis_sigma_sq = np.linspace(0, 1600, stepsize_sigma)
axis_sigma = np.sqrt(axis_sigma_sq)
L_sigma_i = np.ones((axis_sigma.shape[0],n))
L_sigma = np.ones((axis_sigma.shape[0],))

fig = plt.figure()
fig.set_size_inches(8.,4.)
for i in range (n):    
    L_sigma_i[:,i] = scistats.norm.pdf(sample[i],mu_ML,axis_sigma)
    if i == 0:  
        plt.plot(axis_sigma_sq,L_sigma_i[:,i],linewidth=1.25,color='blue',label=r'$L_i(\sigma^2|x_i,\mu_{ML})$')
    else:
        plt.plot(axis_sigma_sq,L_sigma_i[:,i],linewidth=1.25,color='blue')
L_sigma = np.prod(L_sigma_i,axis=1) # product of all single point likelihoods
L_sigma = L_sigma[1:]
L_sigma = L_sigma/np.max(L_sigma)*np.max(L_sigma_i[1:])*1.2
sigma_ML = np.sqrt(np.sum((sample-mu_ML)**2)/n)
sigma_sq_ML = np.sum((sample-mu_ML)**2)/n
plt.plot([sigma_sq_ML,sigma_sq_ML],[np.max(L_sigma),0],color='red',label=r'$\sigma^2_{ML}$')
plt.plot(axis_sigma_sq[1:],L_sigma,linewidth=2.,color='green',label=r'$L(\sigma^2|\vec{x},\mu_{ML})$ [scaled]')
axes = plt.gca()
pl.ylim([-axes.get_ylim()[1]*.1,axes.get_ylim()[1]*1.5])
#pl.xlim([0,400])
plotwidth = axes.get_xlim()[1]
plt.legend(loc=1)
plt.plot([0,1600],[0,0],color='black')
plt.xlabel(r'$\sigma^2$', fontsize=15)
plt.ylabel(r'$p(\vec{x}|\mu,\sigma^2)$', fontsize=15)
plt.title(r'Likelihood function for $\sigma^2$',fontsize=15)
plt.savefig('figL-3.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)
plt.show()

L_sigma /= np.sum(L_sigma)
print np.sum(L_sigma*axis_sigma_sq[1:])
    
"""
JOINT LIKELIHOODS FOR SIGMA, different mus
"""
# meshgrid
axis_sigma_sq = np.linspace(0, 1600, stepsize_sigma)
axis_sigma = np.sqrt(axis_sigma_sq.copy())
L_sigma_i = np.ones((axis_sigma.shape[0],n,axis_mu.shape[0]))
L_sigma = np.ones((axis_sigma.shape[0],axis_mu.shape[0]))

for k in range(axis_mu.shape[0]):
    for i in range (n):    
        L_sigma_i[:,i,k] = scistats.norm.pdf(sample[i],axis_mu[k],axis_sigma)
        L_sigma[:,k] *= L_sigma_i[:,i,k]*10
L_sigma = L_sigma[1:,:]
L_sigma = L_sigma/np.max(L_sigma)*np.max(L_sigma_i[1:,:])*1.2

L_sigma_c = L_sigma.copy()
for k in range(L_sigma_c.shape[1]):
    L_sigma_c[:,k] = L_sigma_c[:,k]/np.max(L_sigma_c[:,k])
"""    
    if k%50 == 0:
        plt.plot(L_sigma_c[:,k],label=axis_mu[k+1])
plt.legend(loc=1)
plt.show()    
"""

"""
COMPLETE LIKELIHOOD FUNCTION
"""
# meshgrids
mu_grid, sigma_grid = np.meshgrid(axis_mu,axis_sigma_sq[1:]) # meshgrid for coordinates
L_mu_grid, dontneedit = np.meshgrid(L_mu,axis_sigma_sq[1:]) # L_mu_grid meshgrid for mu
L = L_mu_grid*L_sigma # L_sigma = meshgrid for sigma
L /= np.max(L) # scale L

# clip data
lower_cut = .3
upper_cut = .62
L = L[:,lower_cut*stepsize_mu:upper_cut*stepsize_mu]
mu_grid = mu_grid[:,lower_cut*stepsize_mu:upper_cut*stepsize_mu]
sigma_grid = sigma_grid[:,lower_cut*stepsize_mu:upper_cut*stepsize_mu]

# plot
fig = plt.figure()
fig.set_size_inches(12.,8.)
ax = fig.add_subplot(111, projection='3d')
ax.plot_wireframe(mu_grid,sigma_grid,L, rstride=12, cstride=1,color='green')
#ax.plot_wireframe(mu_grid,sigma_grid,joint_L_grid, rstride=1, cstride=1)
ax.set_xlabel(r'$\mu$', fontsize=15)
ax.set_ylabel(r'$\sigma^2$', fontsize=15)
ax.set_zlabel(r'$p(\vec{x}|\mu,\sigma^2)$', fontsize=15)
ax.set_title(r'Likelihood function for $\mu$ and $\sigma^2$: $L(\mu,\sigma^2|\vec{x})$ [scaled]', fontsize=15)
plt.savefig('figL-4.png', dpi=200, orientation='portrait', format=None,
            transparent=True, bbox_inches=None, pad_inches=0.1, frameon=None)
plt.show()
