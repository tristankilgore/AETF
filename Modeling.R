##### Structural Equation Modeling #####
### Run 2nd ###

# Libraries and Options ---------------------------------------------------
library(lavaan)
library(semPlot)
library(semPower)

## Set seed
set.seed(123)

# CDC Model ------------------------------------------------------

## Model Specification
cdc_model <- '
## Measurement models

  # Latent variables for individualism
  indiv_latent =~ 1*indiv1 + indiv2 + indiv3
  
  # Latent variables for hierarchism
  hier_latent =~ 1*hier1 + hier2 + hier3
  
  # Latent variables for fatalism
  fatal_latent =~ 1*fatal1 + fatal2 + fatal3
  
  # Latent variables for egalitarianism
  egal_latent =~ 1*egal1 + egal2 + egal3
  
  # Latent variable for risk perception
  risk_perception =~ 1*covid_risk_you + covid_risk_econ + covid_risk_sec

## Covariances

  # Covariances between individualism indicators
  indiv1 ~~ indiv2
  indiv1 ~~ indiv3
  indiv2 ~~ indiv3
  
  # Covariances between hierarchism indicators
  hier1 ~~ hier2
  hier1 ~~ hier3
  hier2 ~~ hier3
  
  # Covariances between fatalism indicators
  fatal1 ~~ fatal2
  fatal1 ~~ fatal3
  fatal2 ~~ fatal3
  
  # Covariances between egalitarianism indicators
  egal1 ~~ egal2
  egal1 ~~ egal3
  egal2 ~~ egal3

# Covariances between risk variables
  covid_risk_you ~~ covid_risk_econ
  covid_risk_you ~~ covid_risk_sec
  covid_risk_econ ~~ covid_risk_sec

## Regressions

  # Individualism on Risk Perception
  risk_perception ~ indiv_latent
  
  # Hierarchism on Risk Perception
  risk_perception ~ hier_latent
  
  # Fatalism on Risk Perception
  risk_perception ~ fatal_latent
  
  # Egalitarianism on Risk Perception
  risk_perception ~ egal_latent
  
  # CDC Valuesim on latent variables
  cdc_valuesim ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # CDC Competent on latent variables
  cdc_competent ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # Trust in CDC on CDC valuesim and CDC competent
  trust_cdc ~ cdc_valuesim + cdc_competent
  
  # Coopscale on trust in CDC and Risk Perception
  coopscale ~ trust_cdc + risk_perception
'

# Fit the model
cdc_fit <- sem(cdc_model, data = data, std.lv = TRUE, estimator = "MLM", optim.method = "BFGS")

# Summarize the results
summary(cdc_fit, fit.measures = TRUE, standardized = FALSE, rsquare = TRUE)

semPaths(cdc_fit, 
         what = "path", 
         whatLabels = "std", 
         style = "lisrel", 
         edge.label.cex = .9, 
         rotation = 2, 
         curve = 0, 
         layout = "tree2",  # Adjust layout for more space between paths
         normalize = FALSE, 
         height = 12, 
         width = 5, 
         residScale = 5)

## Measurement Model Results
standardizedsolution(cdc_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(cdc_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(cdc_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

# Assess the fit of the structural model
fitMeasures(cdc_fit, c("chisq", "df", "pvalue", "cfi", "tli", "rmsea", "srmr"))                  

# State Health Department Model -------------------------------------------
## Model Specification
sthealth_model <- '
## Measurement models

  # Latent variables for individualism
  indiv_latent =~ 1*indiv1 + indiv2 + indiv3
  
  # Latent variables for hierarchism
  hier_latent =~ 1*hier1 + hier2 + hier3
  
  # Latent variables for fatalism
  fatal_latent =~ 1*fatal1 + fatal2 + fatal3
  
  # Latent variables for egalitarianism
  egal_latent =~ 1*egal1 + egal2 + egal3
  
  # Latent variable for risk perception
  risk_perception =~ 1*covid_risk_you + covid_risk_econ + covid_risk_sec

## Covariances

  # Covariances between individualism indicators
  indiv1 ~~ indiv2
  indiv1 ~~ indiv3
  indiv2 ~~ indiv3
  
  # Covariances between hierarchism indicators
  hier1 ~~ hier2
  hier1 ~~ hier3
  hier2 ~~ hier3
  
  # Covariances between fatalism indicators
  fatal1 ~~ fatal2
  fatal1 ~~ fatal3
  fatal2 ~~ fatal3

  # Covariances between egalitarianism indicators
  egal1 ~~ egal2
  egal1 ~~ egal3
  egal2 ~~ egal3

  # Covariances between risk variables
  covid_risk_you ~~ covid_risk_econ
  covid_risk_you ~~ covid_risk_sec
  covid_risk_econ ~~ covid_risk_sec

  ## Regressions
    
  # Individualism on Risk Perception
  risk_perception ~ indiv_latent
  
  # Hierarchism on Risk Perception
  risk_perception ~ hier_latent
  
  # Fatalism on Risk Perception
  risk_perception ~ fatal_latent
  
  # Egalitarianism on Risk Perception
  risk_perception ~ egal_latent
  
  # State Health Department Valuesim on latent variables
  sthealth_valuesim ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # State Health Department Competent on latent variables
  sthealth_competent ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # Trust in State Health Department on State Health Department valuesim and State Health Department competent
  trust_sthealth ~ sthealth_valuesim + sthealth_competent 
  
  # Coopscale on trust in SHD and Risk Perception
  coopscale ~ trust_sthealth + risk_perception
'

sthealth_fit <- sem(sthealth_model, data = data, std.lv = TRUE, estimator = "MLM", optim.method = "BFGS")

## Model Fit
summary(sthealth_fit, fit.measures = TRUE, standardized = TRUE, rsquare = TRUE)

# Visualize output
semPaths(sthealth_fit, 
         what = "path", 
         whatLabels = "std", 
         style = "lisrel", 
         edge.label.cex = .9, 
         rotation = 2, 
         curve = 0, 
         layout = "tree2",  # Adjust layout for more space between paths
         normalize = FALSE, 
         height = 12, 
         width = 5, 
         residScale = 5)

## Measurement Model Results
standardizedsolution(sthealth_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(sthealth_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(sthealth_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

# Assess the fit of the structural model
fitMeasures(sthealth_fit, c("chisq", "df", "pvalue", "cfi", "tli", "rmsea", "srmr")) 

# Primary Care Physician Model --------------------------------------------
## Model Specification
pcp_model <- '
## Measurement models

  # Latent variables for individualism
  indiv_latent =~ 1*indiv1 + indiv2 + indiv3
  
  # Latent variables for hierarchism
  hier_latent =~ 1*hier1 + hier2 + hier3
  
  # Latent variables for fatalism
  fatal_latent =~ 1*fatal1 + fatal2 + fatal3
  
  # Latent variables for egalitarianism
  egal_latent =~ 1*egal1 + egal2 + egal3
  
  # Latent variable for risk perception
  risk_perception =~ 1*covid_risk_you + covid_risk_econ + covid_risk_sec

## Covariances

  # Covariances between individualism indicators
  indiv1 ~~ indiv2
  indiv1 ~~ indiv3
  indiv2 ~~ indiv3
  
  # Covariances between hierarchism indicators
  hier1 ~~ hier2
  hier1 ~~ hier3
  hier2 ~~ hier3
  
  # Covariances between fatalism indicators
  fatal1 ~~ fatal2
  fatal1 ~~ fatal3
  fatal2 ~~ fatal3
  
  # Covariances between egalitarianism indicators
  egal1 ~~ egal2
  egal1 ~~ egal3
  egal2 ~~ egal3
  
  # Covariances between risk variables
  covid_risk_you ~~ covid_risk_econ
  covid_risk_you ~~ covid_risk_sec
  covid_risk_econ ~~ covid_risk_sec

  
## Regressions
    
  # Individualism on Risk Perception
  risk_perception ~ indiv_latent
  
  # Hierarchism on Risk Perception
  risk_perception ~ hier_latent
  
  # Fatalism on Risk Perception
  risk_perception ~ fatal_latent
  
  # Egalitarianism on Risk Perception
  risk_perception ~ egal_latent
  
  # PCP Valuesim on latent variables
  pcp_valuesim ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # PCP Competent on latent variables
  pcp_competent ~ indiv_latent + hier_latent + fatal_latent + egal_latent
  
  # Trust in State Health Department on PCP valuesim and PCP competent
  trust_pcp ~ pcp_valuesim + pcp_competent 
  
  # Coopscale on trust in PCP and Risk Perception
  coopscale ~ trust_pcp + risk_perception
'

pcp_fit <- sem(pcp_model, data = data, std.lv = TRUE, estimator = "MLM", optim.method = "BFGS")

## Model Fit
summary(pcp_fit, fit.measures = TRUE, standardized = TRUE, rsquare = TRUE)

# Visualize output
semPaths(pcp_fit, 
         what = "path", 
         whatLabels = "std", 
         style = "lisrel", 
         edge.label.cex = .9, 
         rotation = 2, 
         curve = 0, 
         layout = "tree2",  # Adjust layout for more space between paths
         normalize = FALSE, 
         height = 12, 
         width = 5, 
         residScale = 5)

## Measurement Model Results
standardizedsolution(pcp_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(pcp_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(pcp_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

# Assess the fit of the structural model
fitMeasures(pcp_fit, c("chisq", "df", "pvalue", "cfi", "tli", "rmsea", "srmr")) 

# Power Analysis ----------------------------------------------------------
ph1 <- semPower.postHoc(effect = 0.05, effect.measure = 'RMSEA',
                        alpha = 0.05, N = 1000, df = 134)
summary(ph1)

ph2 <- semPower.postHoc(effect = 0.061, effect.measure = 'RMSEA',
                        alpha = 0.05, N = 1000, df = 134)
summary(ph2)

ph3 <- semPower.postHoc(effect = 0.06, effect.measure = 'RMSEA',
                        alpha = 0.05, N = 1000, df = 134)
summary(ph3)
