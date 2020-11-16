
# ------------------------------ MOSEK Solver ---------------------------------

#==============================================================================
# Mosek solver - Simplex
#==============================================================================
#mosek -d MSK_IPAR_OPTIMIZER MSK_OPTIMIZER_DUAL_SIMPLEX \
#-d MSK_DPAR_SIMPLEX_ABS_TOL_PIV 1e-3 \
#-d MSK_IPAR_PRESOLVE_USE MSK_PRESOLVE_MODE_OFF \
#-d MSK_IPAR_NUM_THREADS 1 \
#BigPrimal.mps \
#| tee output.txt

#MSK_OPTIMIZER_DUAL_SIMPLEX MSK_OPTIMIZER_PRIMAL_SIMPLEX


#==============================================================================
# Mosek solver - IPM
#==============================================================================
#mosek -d MSK_IPAR_OPTIMIZER MSK_OPTIMIZER_INTPNT \
#-d MSK_IPAR_INTPNT_BASIS MSK_BI_ALWAYS \
#-d MSK_DPAR_INTPNT_TOL_DFEAS 1e-3 \
#-d MSK_DPAR_INTPNT_TOL_PFEAS 1e-3 \
#-d MSK_DPAR_SIMPLEX_ABS_TOL_PIV 1e-3 \
#-d MSK_DPAR_INTPNT_TOL_REL_GAP 1e-12 \
#-d MSK_IPAR_PRESOLVE_USE MSK_PRESOLVE_MODE_OFF \
#-d MSK_IPAR_NUM_THREADS 1 \
#BigPrimal.mps \
#| tee output.txt

# MSK_BI_ALWAYS MSK_BI_NEVER



# ------------------------------ CPLEX Solver ---------------------------------

#==============================================================================
# CPLEX solver - Simplex
#==============================================================================
#cplex -c "read BigPrimal.mps" \
#"set threads 1" \
#"set preprocessing presolve yes" \
#"set simplex tolerances feasibility 1e-3" \
#"set lpmethod 1" \
#"primopt" \
#| tee output.txt


#==============================================================================
# CPLEX solver - IPM
#==============================================================================
cplex -c "read BigPrimal.mps" \
"set barrier algorithm 2" \
"set barrier crossover -1" \
"set threads 1" \
"set preprocessing presolve no" \
"set barrier convergetol 1e-12" \
"baropt" \
| tee output.txt



# ------------------------------ GUROBI Solver ---------------------------------

#==============================================================================
# GUROBI solver - Primal simplex algorithm
#==============================================================================
#gurobi_cl Method=1 \
#Presolve=0 \
#Threads=1 \
#FeasibilityTol=1e-3 \
#ResultFile=result.sol \
#BigDual.mps \
#| tee output.txt


#==============================================================================
# GUROBI solver - IPM algorithm with BarHomogeneous and disabled crossover
#==============================================================================
#gurobi_cl Method=2 \
##BarHomogeneous=1 \
#Crossover=-1 \
#Presolve=0 \
#Threads=1 \
#FeasibilityTol=1e-3 \
#BarConvTol=1e-12 \
#ResultFile=result.sol \
#BigDual.mps \
#| tee output.txt


