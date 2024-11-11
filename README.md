The Decision to Trust: An Analysis using the Actor Evaluation and Trust Framework (AETF)
Overview

This repository supports "The Decision to Trust: An Application of Structural Equation Modeling to the Actor Evaluation and Trust Framework", a thesis project focused on analyzing public trust in risk management. Using nationally representative data collected during the COVID-19 pandemic, this project explores how foundational beliefs, cultural worldviews, and perceptions of competency influence trust judgments in public policy and health guidelines.

The project proposes the Actor Evaluation and Trust Framework (AETF), a model that combines insights from Cultural Theory, public administration, and risk perception literature to predict trust and policy cooperation. This model is empirically tested using Structural Equation Modeling (SEM) across different types of risk managers, providing a nuanced understanding of trust formation.
Repository Structure

    EDA.R: Code for exploratory data analysis, including data cleaning and outlier detection.
    Modeling.R: The main modeling script, implementing SEM to test hypotheses of the AETF.
    model_revisions.R: Modifications and refinements to the AETF based on SEM fit indices and robustness checks.
    Kilgore_Thesis_Presentation_SP24.pptx: Presentation of the thesis, including research background, model design, results, and implications.

Key Components of the AETF
Research Questions

    How do deep-seated beliefs and cultural worldviews impact trust and cooperation with public policy?
    What roles do value congruence and perceived competency play in shaping trust judgments?
    How do trust and risk perception interact to drive policy cooperation during crises?

Model Overview

The AETF integrates four main constructs:

    Deep Core Beliefs: Foundational beliefs, measured through Cultural Theory, that shape how individuals interpret risk and competence.
    Value Congruence: Alignment between individuals' values and those of risk managers, shaping relational trust.
    Competency Perceptions: Judgments on the ability of risk managers to handle crises, contributing to calculative trust.
    Risk Perception: Individual views on the severity of risks, which moderate trust and willingness to cooperate with public policy.

Data Collection

A sample of 1,000 U.S. participants, surveyed through Qualtrics, forms the basis of this study. Questions cover COVID-19 risk perceptions, value congruence, competency, trust in different risk managers (CDC, state health departments, and primary care physicians), and cooperation intentions.
Methodology
Modeling Approach

The AETF is tested through Structural Equation Modeling (SEM), examining three models focused on different risk managers. The SEM approach validates hypothesized relationships and tests the impact of cultural and belief-based constructs on trust. The model is assessed using fit indices like CFI, TLI, RMSEA, and SRMR to ensure robustness.
Key Hypotheses

The model tests several hypotheses, including:

    The influence of deep core beliefs on competency perception and value congruence.
    The direct and indirect relationships between value congruence, competency, trust, and policy cooperation.
    The role of risk perception as a mediator between trust and cooperation.

Results Summary

    Core Findings: Relationships were observed between deep core beliefs, competency perceptions, value congruence, and trust.
    Practical Implications: Insights are provided for policymakers on fostering trust and engagement with public policy during crises.

Next Steps

Future research will refine measures of value congruence and risk perception, assess different contexts, and explore longitudinal effects on policy cooperation.
Dependencies

    R (version 4.0 or later)
    R Packages: lavaan, semTools, psych, dplyr, tidyverse

Acknowledgments

This project was conducted as part of a Master of Arts thesis at the University of Oklahoma, with support from the Department of Political Science and guidance from thesis advisors.
