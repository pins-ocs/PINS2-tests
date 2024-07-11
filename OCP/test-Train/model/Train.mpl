restart:;
with(XOptima):;
addUserFunction(acc(x,v)=h(x)-(alpha+beta*v+gm*v^2));
addUserFunction(h(x));
ODE1 := diff(x(t),t)=v(t);
ACC := acc(x(t),v(t)) ; # h(x(t))-(alpha+beta*v(t)+gm*v(t)^2);
ODE2 := diff(v(t),t)=ACC + ua(t) - ub(t);
ode := [ODE1,ODE2]: <%>;
uvars := [ua(t),ub(t)]:
xvars := [x(t), v(t)]:
loadDynamicSystem(
  equations = ode,
  controls  = uvars,
  states    = xvars
);
addBoundaryConditions(initial=[x,v],final=[x,v]);
setStatusBoundaryConditions(initial=[x,v],final=[x,v]);
infoBoundaryConditions() ;
setTarget( lagrange = ua(zeta)*v(zeta) );
addControlBound(
  ua,
  controlType = "U_COS_LOGARITHMIC",
  min         = 0,
  max         = uaMax,
  epsilon     = epsi0,
  tolerance   = tol0
);
addControlBound(
  ub,
  controlType = "U_COS_LOGARITHMIC",
  min         = 0,
  max         = ubMax,
  epsilon     = epsi0,
  tolerance   = tol0
);
PARS := [
  x_i   = 0,
  x_f   = 6,
  v_i   = 0,
  v_f   = 0,
  alpha = 0.3,
  beta  = 0.14,
  gm    = 0.16,
  uaMax = 10,
  ubMax = 2,
  epsi0 = 0.01,  epsi1 = 1e-6,
  tol0  = 0.01,  tol1  = 1e-6
];
POST := [ [h(x(zeta)),"Profile"] ];
CONTINUATION := [
  [
    [["ua","ub"],"epsilon"]   = epsi0*(1-s) + epsi1*s,
    [["ua","ub"],"tolerance"] = tol0*(1-s)  + tol1*s
  ]
];
UGUESS := [
  ua = uaMax/2,
  ub = ubMax/2
];
GUESS := [
  x = x_i+(x_f-x_i)*zeta/4.8,
  v = 1
];
MESH_DEF := [
  [length=0.25, n=25],
  [length=0.75, n=3000],
  [length=3.8,  n=100]
];
project_dir  := "../generated_code";
project_name := "Train";
generateOCProblem(
  project_name,
  post_processing = POST,
  parameters      = PARS,
  controls_guess  = UGUESS,
  states_guess    = GUESS,
  continuation    = CONTINUATION,
  mesh            = MESH_DEF,
  clean           = true
);
# if used in batch mode use the comment to quit;
