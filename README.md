# The Decision to Trust: Actor Evaluation and Trust Framework

## Overview

This repository contains the source code and data analysis supporting the research project **"The Decision to Trust"**, which explores the foundational elements of trust in risk management. Specifically, it focuses on the **Actor Evaluation and Trust Framework (AETF)**, a new model that incorporates elements of deep core beliefs, value congruence, competency perceptions, and risk perception to explain how individuals decide who to trust and whether to cooperate with public policy. This research utilizes **Structural Equation Modeling (SEM)** to validate the framework through data collected from a national survey during the COVID-19 pandemic.

## Repository Contents

- **EDA.R**: Code for the initial exploratory data analysis, including data cleaning, transformation, and outlier detection.
- **Modeling.R**: Full implementation of the **Structural Equation Modeling** process to test the Actor Evaluation and Trust Framework (AETF).
- **model_revisions.R**: Iterations and modifications to the SEM models based on fit indices and goodness-of-fit tests.

## Key Research Questions

1. How do an individual’s foundational beliefs, such as cultural worldviews, influence their decision to trust and cooperate with public policy?
2. What impact do value congruence and competency perceptions have on an individual’s trust in a risk manager?
3. How do trust and risk perception influence cooperation with public policy during crises?

## Methodology

### Data Collection
Data was collected through an internet-based survey, fielded from February 9th to March 3rd, 2021. The sample of 1,000 respondents was representative of the U.S. population. Key survey measures focused on demographic data, risk perceptions, value congruence, competency perceptions, trust in risk managers, and policy cooperation.

### Theoretical Framework
The **Actor Evaluation and Trust Framework (AETF)** proposes that an individual’s decision to cooperate with or accept public policy is determined by their trust in the actor responsible for managing the hazard, their risk perception, and the perceived competency of the risk manager. The framework integrates theories from **Cultural Theory**, **Social Psychology**, and **Public Administration** to provide a multidimensional approach to understanding trust.

### Analytical Approach
The analysis uses **Structural Equation Modeling (SEM)** to test the relationships between deep core beliefs, value congruence, competency perceptions, risk perception, and policy cooperation. Various fit indices, including **CFI**, **TLI**, **RMSEA**, and **SRMR**, were used to assess model fit.

## Results Summary

- **Deep Core Beliefs**: Cultural Theory's framework of worldviews (fatalism, hierarchism, individualism, and egalitarianism) is used to assess individuals' fundamental beliefs about risk and the role of risk managers.
- **Value Congruence**: Higher alignment between the individual's values and those of the risk manager (CDC, State Health Departments, and Primary Care Physicians) leads to increased trust and cooperation.
- **Risk Perception**: Perceptions of risk influence individuals’ willingness to cooperate with public policy, challenging traditional views that trust influences risk perception.
- **Competency Perceptions**: An individual’s perception of the competence of risk managers (based on past performance) significantly impacts their decision to trust and cooperate with policies.

## Next Steps

Future research will focus on refining the AETF and testing its application in other contexts beyond public health emergencies. There is also a need to explore the longitudinal impacts of trust on policy cooperation.

## Dependencies

- R (version 4.0 or later)
- Libraries: `lavaan`, `semTools`, `psych`, `dplyr`, `tidyverse`, and others as specified in the R scripts.
