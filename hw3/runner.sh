
# ------------------------------ MOSEK Solver ---------------------------------

#==============================================================================
# Mosek solver - Dual simplex algorithm
#==============================================================================
#mosek -d MSK_IPAR_OPTIMIZER MSK_OPTIMIZER_DUAL_SIMPLEX \
#-d MSK_DPAR_SIMPLEX_ABS_TOL_PIV 1e-3 \
#-d MSK_IPAR_PRESOLVE_USE MSK_PRESOLVE_MODE_OFF \
#-d MSK_IPAR_NUM_THREADS 1 \
#BigDual.mps \
#| tee output.txt


#==============================================================================
# Mosek solver - IPM algorithm without crossover
#==============================================================================
mosek -d MSK_IPAR_OPTIMIZER MSK_OPTIMIZER_INTPNT \
-d MSK_IPAR_INTPNT_BASIS MSK_BI_NEVER \
-d MSK_DPAR_INTPNT_TOL_DFEAS 1e-3 \
-d MSK_DPAR_INTPNT_TOL_PFEAS 1e-3 \
-d MSK_DPAR_SIMPLEX_ABS_TOL_PIV 1e-3 \
-d MSK_DPAR_INTPNT_TOL_REL_GAP 1e-12 \
-d MSK_IPAR_PRESOLVE_USE MSK_PRESOLVE_MODE_OFF \
-d MSK_IPAR_NUM_THREADS 1 \
BigDual.mps \
| tee output.txt



# ------------------------------ CPLEX Solver ---------------------------------

#==============================================================================
# CPLEX solver - Dual simplex algorithm 
#==============================================================================
# cplex -c "read BigDual.mps" \
# "set threads 1" \
# "set preprocessing presolve no" \
# "set simplex tolerances feasibility 1e-4" \
# "set lpmethod 2" \
# "primopt" \
# | tee output.txt 


#==============================================================================
# CPLEX solver - IPM algorithm with algorithm 2 and without crossover
#==============================================================================
# cplex -c "read BigDual.mps" \
# "set barrier algorithm 2" \
# "set barrier crossover -1" \
# "set threads 10" \
# "set preprocessing presolve no" \
# "set barrier convergetol 1e-12" \
# "baropt" \
# | tee output.txt



# ------------------------------ GUROBI Solver ---------------------------------

#==============================================================================
# GUROBI solver - Primal simplex algorithm
#==============================================================================
# gurobi_cl Method=0 \
# Presolve=0 \
# Threads=1 \
# FeasibilityTol=1e-9 \
# ResultFile=result.sol \
# BigDual.mps \
# | tee output.txt 


#==============================================================================
# GUROBI solver - IPM algorithm with BarHomogeneous and disabled crossover
#==============================================================================
# gurobi_cl Method=2 \
# BarHomogeneous=1 \
# Crossover=0 \
# Presolve=0 \
# Threads=1 \
# FeasibilityTol=1e-2 \
# BarConvTol=1e-3 \
# ResultFile=result.sol \
# BigDual.mps \
# | tee output.txt 


