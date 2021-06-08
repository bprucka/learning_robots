# The goal of this program is to experiment with PID control
# Author: Bill Prucka

library(ggplot2)
library(tibble)
library(tidyverse)

# Simple dynamics to drop under constant acceleration over a time step
# Just downward acceleration due a constant acceleration and initial velocity over a timestep
sim_dynamics <- function(initialState,timeStep,accel) {
  x = initialState$x + initialState$v*timeStep + 1/2*accel*timeStep^2
  v = initialState$v + accel*timeStep
  return(list(x=x,v=v))
}

# Calculate error - this is the difference in position from the location of the object and the setpoint (desired height)
get_error <- function(currentState,setPoint) {
  return( setPoint - currentState$x )
}


# Set up an example with a set height of 10 meters
setPoint = 10

# The proportional, integral, and differential constants
kP = 2
kI = 0.2
kD = 2
timeStep = 0.1
initialState <- list(x=8,v=1)
nTime = 200

# This function uses the initial state and control parameters to simulate the trajectory over time
sim_pid <- function(initialState,kP,kI,kD,timeStep,nTime,setPoint) {
  x = a = eDiff = eInt = e = rep(0,nTime+1)
  a[1] = -9.8
  x[1] = initialState$x
  e[1] = get_error(initialState,setPoint)
  eInt[1] = e[1]*timeStep

  # Loop over control
  for( j in 1:nTime ) {
    e[j+1] = get_error(initialState,setPoint)
    x[j+1] = initialState$x
    eDiff[j+1] = (e[j+1] - e[j])/timeStep
    eInt[j+1] = e[j+1]*timeStep + eInt[j]
    a[j+1] = max(-20,min(kP*e[j+1] + kI*eInt[j+1] + kD*eDiff[j+1],20))
    initialState = sim_dynamics(initialState,timeStep,a[j+1]-9.8)
  }
  tibble(t=1:(nTime+1),xPos=x,a=a,e=e,eDiff=eDiff,eInt=eInt)
}

# This function using numeric optimization to identify the PID parameters that minimize the sum of the squared error.
opts <- optim( c(2,0.1,1), function(x) { v <- sim_pid(initialState,x[1],x[2],x[3],timeStep,nTime,setPoint) %>% pull(xPos)
                                 sum(v^2) }, method="L-BFGS-B" )

# The resulting PID fit is plotted over the first 300 time steps
dt_plot = sim_pid(initialState,opts$par[1],opts$par[2],opts$par[3],timeStep,nTime,setPoint)
ggplot(dt_plot %>% filter(t<300), aes(x=t,y=a,color=a)) + geom_line() + xlab("Time Step") + ylab("Acceleration") +
  labs(color="Acceleration")



