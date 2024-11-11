# Libraries and Options ---------------------------------------------------
library(lavaan)
library(semPower)


## Set seed
set.seed(123)

# CDC Risk Perception Model ------------------------------------------------------

## Model Specification
cdc_risk_model <- '
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
  
  ## Regressions
    
  # Individualism on Risk Perception
  risk_perception ~ indiv_latent
  
  # Hierarchism on Risk Perception
  risk_perception ~ hier_latent
  
  # Fatalism on Risk Perception
  risk_perception ~ fatal_latent
  
  # Egalitarianism on Risk Perception
  risk_perception ~ egal_latent
  
'
# Fit the model
cdc_risk_fit <- sem(cdc_risk_model, data = data, estimator = "MLM")

# Summarize the results
summary(cdc_risk_fit, fit.measures = TRUE, standardized = FALSE, rsquare = TRUE)

## Measurement Model Results
standardizedsolution(cdc_risk_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(cdc_risk_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(cdc_risk_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

# CDC VC Perception Model ------------------------------------------------------
## Model Specification
cdc_vc_model <- '
  ## Measurement models
  
  # Latent variables for individualism
  indiv_latent =~ 1*indiv1 + indiv2 + indiv3
  
  # Latent variables for hierarchism
  hier_latent =~ 1*hier1 + hier2 + hier3
  
  # Latent variables for fatalism
  fatal_latent =~ 1*fatal1 + fatal2 + fatal3
  
  # Latent variables for egalitarianism
  egal_latent =~ 1*egal1 + egal2 + egal3
  
  ## Regressions
    
  # CDC Valuesim on latent variables
  cdc_valuesim ~ indiv_latent + hier_latent + fatal_latent + egal_latent
'
# Fit the model
cdc_vc_fit <- sem(cdc_vc_model, data = data, estimator = "MLM")

# Summarize the results
summary(cdc_vc_fit, fit.measures = TRUE, standardized = FALSE, rsquare = TRUE)

## Measurement Model Results
standardizedsolution(cdc_vc_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(cdc_vc_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(cdc_vc_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

# CDC Competency Model ------------------------------------------------------
## Model Specification
cdc_comp_model <- '
  ## Measurement models
  
  # Latent variables for individualism
  indiv_latent =~ 1*indiv1 + indiv2 + indiv3
  
  # Latent variables for hierarchism
  hier_latent =~ 1*hier1 + hier2 + hier3
  
  # Latent variables for fatalism
  fatal_latent =~ 1*fatal1 + fatal2 + fatal3
  
  # Latent variables for egalitarianism
  egal_latent =~ 1*egal1 + egal2 + egal3
  
  ## Regressions
    
  # CDC Competent on latent variables
  cdc_competent ~ indiv_latent + hier_latent + fatal_latent + egal_latent
'
# Fit the model
cdc_comp_fit <- sem(cdc_comp_model, data = data, estimator = "MLM")

# Summarize the results
summary(cdc_comp_fit, fit.measures = TRUE, standardized = FALSE, rsquare = TRUE)

## Measurement Model Results
standardizedsolution(cdc_comp_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "=~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)

parameterEstimates(cdc_comp_fit, standardized=TRUE, rsquare = TRUE) %>% 
  filter(op == "r2") %>% 
  select(Item=rhs, R2 = est) 

## Structural Model Results
standardizedsolution(cdc_comp_fit, type = "std.all", se = TRUE, zstat = TRUE, pvalue = TRUE, ci = TRUE)%>% 
  filter(op == "~") %>% 
  select(LV=lhs, Item=rhs, Coefficient=est.std, ci.lower, ci.upper, SE=se, Z=z, 'p-value'=pvalue)
