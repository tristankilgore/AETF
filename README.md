# The Decision to Trust: Actor Evaluation and Trust Framework (AETF)

## Project Overview

This repository supports the research project **"The Decision to Trust"**, which investigates the foundations of trust in risk management and public policy cooperation. This research introduces the **Actor Evaluation and Trust Framework (AETF)**, a novel model integrating theories from **Cultural Theory**, **Public Administration**, and **Social Psychology** to understand trust dynamics during public crises. Using **Structural Equation Modeling (SEM)**, the project evaluates relationships between **deep core beliefs**, **value congruence**, **competency perceptions**, **risk perception**, and **policy cooperation**.

The AETF framework aims to clarify how these dimensions collectively shape individuals' decisions to trust and cooperate with public policy, particularly during high-stakes crises like the COVID-19 pandemic. The insights derived from this project could guide policymakers in enhancing risk communication and fostering public trust.

## Repository Structure

- **`EDA.R`**: This script performs **Exploratory Data Analysis** (EDA) on the dataset, including data cleaning, transformation, and outlier handling, laying the groundwork for further analysis.
- **`Modeling.R`**: This script contains the core **Structural Equation Modeling (SEM)** procedures, implementing the AETF model across three different risk manager perspectives: CDC, State Health Departments, and Primary Care Physicians.
- **`model_revisions.R`**: Contains iterative revisions and fit adjustments to the SEM models based on **Goodness-of-Fit** statistics.

## Key Research Questions

1. **Foundational Beliefs**: How do individuals' deep core beliefs, as defined by Cultural Theory, influence their decisions to trust and cooperate with public policy?
2. **Value Congruence and Competency**: What impact do value congruence and competency perceptions of risk managers have on trust levels?
3. **Trust and Risk Perception**: How do trust and risk perception interplay to affect policy cooperation in a crisis?

## Theoretical Framework

### Actor Evaluation and Trust Framework (AETF)

The **AETF** posits that trust and cooperation with public policy are influenced by a blend of relational and calculative factors:
1. **Value Congruence** (Relational Trust): The degree to which an individual’s values align with those of a risk manager.
2. **Competency Perceptions** (Calculative Trust): An individual's perception of a risk manager’s competence, based on past performance.
3. **Risk Perception**: An individual's assessment of a crisis’s threat level, which influences their decision to cooperate with policy.

The **AETF** integrates components from leading models in trust research, including the **Consensus Model**, **Trust, Confidence, and Cooperation (TCC) Model**, **Associationist Model**, and **Integrative Model**, and extends them with insights from **Cultural Theory**. This approach addresses existing gaps in trust models by focusing on how cultural worldviews and deep core beliefs shape trust dynamics.

### Cultural Theory in the AETF

Cultural Theory provides a structured way of categorizing core beliefs into four worldviews:
- **Fatalism**: Prefers local trust and doubts systemic solutions.
- **Hierarchism**: Values expertise and authority in managing crises.
- **Individualism**: Prioritizes autonomy and market-based solutions.
- **Egalitarianism**: Favors community-based, grassroots approaches.

These worldviews shape how individuals interpret risk, competency, and trustworthiness in risk managers, ultimately influencing policy cooperation.

## Methodology

### Data Collection

Data was gathered from a nationally representative survey of 1,000 respondents in the U.S., fielded between February 9th and March 3rd, 2021. Survey measures included:
- **Demographics**
- **Risk Perceptions**: Perceived COVID-19 risk to personal health, the economy, and national security.
- **Value Congruence and Competency Perceptions**: For three types of risk managers—CDC, State Health Departments, and Primary Care Physicians.
- **Trust and Policy Cooperation**: Metrics indicating the extent of trust in risk managers and cooperation with recommended public health policies.

### Analytical Approach

The **Structural Equation Modeling (SEM)** process implemented in `Modeling.R` was applied to three separate models for each risk manager. Key SEM steps include:
1. **Model Specification**: Initial specification based on theoretical expectations.
2. **Goodness-of-Fit Assessment**: Using indices like **Comparative Fit Index (CFI)**, **Tucker-Lewis Index (TLI)**, **Root Mean Square Error of Approximation (RMSEA)**, and **Standardized Root Mean Square Residual (SRMR)**.
3. **Model Revisions**: Adjustments made iteratively based on model fit indices.

### Missing Data Handling

Missing data were imputed using **K-Nearest Neighbors (KNN)** with Euclidean distance, ensuring the representativeness of the dataset without sacrificing sample size. 

## Results Summary

### Descriptive Insights
- **Deep Core Beliefs**: Cultural Theory’s worldviews provide a strong basis for understanding risk perceptions and trust inclinations.
- **Value Congruence**: Stronger value alignment with risk managers correlated with increased trust and policy cooperation.
- **Competency Perceptions**: The perceived competence of risk managers significantly impacted trust, especially for public health officials like CDC and State Health Departments.
- **Risk Perception**: Higher risk perception enhanced the effect of trust on policy cooperation, highlighting the influence of perceived threat levels on behavioral compliance.

### SEM Analysis and Model Fit

All three models achieved satisfactory model fit according to **CFI**, **TLI**, **RMSEA**, and **SRMR**. Results across models supported the hypotheses that:
1. **Core Beliefs Influence Trust**: Individuals’ deep core beliefs (e.g., Cultural Theory worldviews) shaped both value congruence and competency perceptions.
2. **Trust Influences Policy Cooperation**: Higher trust in risk managers was associated with greater policy cooperation.
3. **Risk Perception Modulates Trust Effects**: Risk perception significantly moderated the relationship between trust and policy cooperation, with high perceived risk amplifying trust’s impact.

## Key Findings and Implications

1. **Value Congruence and Competency Are Central to Trust**: Alignment between individual values and those of risk managers, as well as perceptions of risk manager competence, are crucial for fostering trust and cooperation.
2. **Deep Core Beliefs Drive Trust**: Worldviews rooted in Cultural Theory provide a foundation for understanding trust in risk managers.
3. **Risk Perception Enhances Policy Cooperation**: When individuals perceive a high level of risk, trust in risk managers has a stronger impact on cooperation.

## Limitations and Future Research

While the AETF provides a robust model for understanding trust and policy cooperation, several limitations warrant further study:
1. **Model Generalizability**: Testing the model in contexts beyond public health crises, such as natural disasters, is recommended.
2. **Longitudinal Effects**: Future research could explore how trust dynamics evolve over time and affect long-term policy cooperation.
3. **Expanded Measurement of Cultural Theory**: Further refinement of measures for deep core beliefs and risk perceptions could enhance model accuracy.

## License

Proprietary License: This project is for reference only. All rights reserved. Usage, distribution, and modification are not permitted without explicit permission from the author.
