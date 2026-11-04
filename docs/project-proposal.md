# Assignment 1 - Project Summary

## Title Page

| Field | Description |
| --- | --- |
| Course | Intelligent Agents with Generative AI - 2026 |
| Project name | FitSense: A Multi-Agent Context-Aware Fitness Companion Using Smartphone Sensors and Machine Learning |
| GitHub Repository | https://github.com/Tihomir-Tinkov/fitsense |

### Project Author(s)

| № | Name | Faculty Number |
| --- | --- | --- |
| 1 | Tihomir Tinkov | 8MI0800489 |

---

# 1\. Description of the Project

## 1.1. Project Overview

FitSense (Smart Fitness Companion) is a multi-agent system designed to monitor, analyze, and interpret a user's physical activities using smartphone sensors and machine learning techniques. The system aims to provide context-aware fitness recommendations based on the user's current physical activity, movement patterns, GPS trajectories, and historical activity data.

Modern smartphones contain multiple sensors, including accelerometers, gyroscopes, and GPS receivers, which can be used to monitor human movement without requiring additional wearable devices or dedicated hardware. By combining data from these sensors with machine learning models and intelligent software agents, FitSense will provide an intelligent fitness companion capable of understanding user activities and identifying meaningful patterns in their physical behavior.

The system will consist of several specialized agents communicating and cooperating to collect sensor data, recognize physical activities, analyze GPS trajectories, monitor historical activity patterns, and generate personalized recommendations.

The system will have an extensible architecture, allowing additional agents and analytical capabilities to be introduced in the future.

## 1.2. Agent Architecture

The FitSense multi-agent system will consist of the following agents:

### 1\. Smartphone Sensor Interface Agent (SSIA)

The Smartphone Sensor Interface Agent will be responsible for collecting real-time sensor data from the user's smartphone.

It will interface with the smartphone's built-in sensors, including:

- 3D accelerometer - measures acceleration along the X, Y, and Z axes.
- 3D gyroscope - measures angular velocity along the X, Y, and Z axes.
- GPS receiver - provides geographical coordinates, timestamps, speed estimates, and altitude where available.

The agent will collect and preprocess sensor measurements, attach timestamps, and transmit the resulting data to the appropriate backend agents.

The mobile application will be implemented using React Native and Expo sensor and location APIs.

Communication with the backend will be performed using HTTP REST requests for session management and WebSocket connections for real-time sensor data streaming.

### 2\. Activity Recognition Agent (ARA)

The Activity Recognition Agent will be responsible for identifying the user's current physical activity based on accelerometer and gyroscope measurements.

It will utilize supervised machine learning models trained on publicly available human activity recognition datasets.

The following algorithms will be implemented and compared:

- Random Forest - classical ensemble-based machine learning classifier.
- Support Vector Machine (SVM) - classical supervised classification algorithm.
- 1D Convolutional Neural Network (1D CNN) - deep learning model for extracting temporal features from sensor sequences.

The initial models will be trained and evaluated using the following datasets:

- UCI Human Activity Recognition Using Smartphones Dataset - contains accelerometer and gyroscope measurements collected from 30 participants performing six activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying.
- WISDM Smartphone and Smartwatch Activity Dataset - contains inertial sensor measurements from multiple participants performing different physical activities.

The models will be evaluated using accuracy, precision, recall, F1-score, inference time, and confusion matrices.

The experiments will also investigate the effect of temporal smoothing on prediction stability and the generalization of trained models to previously unseen participants.

The selected model will be integrated into the agent and used to provide real-time activity predictions.

The agent will transmit structured recognition results, including the predicted activity, confidence score, and timestamp, to other agents.

### 3\. Route Analysis Agent (RAA)

The Route Analysis Agent will process GPS measurements to analyze the user's movement and geographical trajectories.

Its responsibilities will include:

- Calculating total distance traveled.
- Estimating average and maximum movement speed.
- Identifying stationary periods and movement intervals.
- Estimating elevation changes when reliable altitude measurements are available.
- Storing and comparing previously recorded routes.
- Identifying frequently used routes and movement patterns.

The agent will use geographical distance calculations, GPS data preprocessing, trajectory segmentation, and statistical analysis.

The Microsoft Research GeoLife GPS Trajectories Dataset will be used for experimentation with GPS trajectory analysis.

The dataset contains GPS trajectories collected from multiple users and includes geographical coordinates, timestamps, and movement information.

Additional algorithms for route clustering and similarity estimation may be implemented as an extension of the core functionality.

The Route Analysis Agent will communicate its results to the Context Analysis Agent and the User Interaction Agent.

### 4\. Context Analysis Agent (CAA)

The Context Analysis Agent will combine information received from the Activity Recognition Agent and Route Analysis Agent with the user's historical activity records.

Its purpose will be to identify longer-term activity patterns and provide contextual information that cannot be obtained from individual sensor measurements alone.

The agent will analyze:

- Daily and weekly activity duration.
- Frequency and distribution of different physical activities.
- Historical movement patterns.
- Changes in activity levels over time.
- Comparisons between current and previous activity sessions.
- Repeated routes and changes in route performance.

The agent will primarily use statistical analysis and time-series aggregation techniques.

It will maintain historical activity summaries and provide contextual information to the Recommendation Agent.

### 5\. Recommendation Agent (RA)

The Recommendation Agent will generate personalized suggestions based on information received from the other agents.

It will use a rule-based decision-making system that combines current activity information, route statistics, and historical activity patterns.

Examples of possible recommendations include:

- Suggesting a short walk after an extended period of inactivity.
- Informing the user about changes in their weekly activity levels.
- Comparing the user's current route performance with previous sessions.
- Identifying frequently used routes.
- Suggesting achievable activity goals based on historical behavior.

The recommendation system will initially use predefined rules and thresholds, allowing its decisions to be explainable and evaluated.

As an optional extension, a simple personalization algorithm may be implemented to adapt recommendation thresholds according to individual activity patterns.

The agent will transmit recommendations to the User Interface through the backend communication layer.

### 6\. User Interaction Agent (UIA)

The User Interaction Agent will provide the interface between the user and the multi-agent system.

It will be responsible for:

- Starting and stopping activity monitoring sessions.
- Displaying the currently recognized physical activity.
- Presenting GPS routes on an interactive map.
- Displaying activity statistics and historical trends.
- Presenting recommendations generated by the Recommendation Agent.
- Managing user preferences and activity history.

The agent will receive information from the other agents through backend API services and provide a unified user experience.

## 1.3. Agent Communication and Coordination

The agents will communicate using structured JSON messages exchanged through a Python-based backend implemented with FastAPI.

The communication architecture will use:

- HTTP REST API for session management, configuration, historical data retrieval, and agent requests.
- WebSocket connections for real-time sensor data streaming and activity recognition updates.
- SQLite for persistent storage of activity sessions, GPS trajectories, and historical statistics.

The Smartphone Sensor Interface Agent will transmit sensor measurements to the backend. The backend will distribute the appropriate measurements to the Activity Recognition Agent and Route Analysis Agent.

The Activity Recognition Agent and Route Analysis Agent will independently process their respective inputs and produce structured outputs.

The Context Analysis Agent will periodically combine these outputs with historical information and provide contextual summaries to the Recommendation Agent.

The Recommendation Agent will generate suggestions and communicate them to the User Interaction Agent for presentation.

The agents will operate as specialized software components with clearly defined responsibilities and communication interfaces. They will cooperate through asynchronous message exchange, without requiring a centralized LLM-based reasoning component.

## 1.4. Machine Learning and AI Technologies

The following technologies and algorithms will be investigated and implemented:

| Technology / Algorithm | Purpose |
| --- | --- |
| Random Forest | Baseline activity classification |
| Support Vector Machine (SVM) | Classical ML model comparison |
| 1D CNN | Deep learning-based temporal activity recognition |
| Sliding Window Processing | Sensor signal segmentation |
| Temporal Smoothing | Improving prediction stability |
| GPS Trajectory Analysis | Processing and analyzing movement routes |
| Statistical Time-Series Analysis | Identifying historical activity patterns |
| Rule-Based Reasoning | Generating context-aware recommendations |

The machine learning models will be developed using Python, Scikit-learn, and PyTorch.

Model training and experimentation will be performed locally using the available GPU when beneficial, although the selected models will also support CPU-based inference.

The project will investigate the following research questions:

1. How do classical machine learning algorithms (Random Forest and SVM) compare with a 1D CNN for smartphone-based human activity recognition?
2. How well do activity recognition models generalize to previously unseen participants and different datasets?
3. Does temporal smoothing improve the stability of real-time activity predictions?
4. How can activity recognition and GPS-based movement analysis be combined to provide context-aware fitness recommendations?

## 1.5. Input and Output Data

The system will process the following input data (perceptions):

- Accelerometer measurements (X, Y, Z).
- Gyroscope measurements (X, Y, Z).
- GPS latitude and longitude.
- GPS timestamps.
- GPS speed and altitude estimates, where available.
- Historical activity sessions.
- User preferences and manually selected activity labels, where applicable.

The system will produce the following output data (actions):

- Predicted physical activity and confidence score.
- Activity duration and movement statistics.
- GPS route visualization.
- Distance, speed, and elevation estimates.
- Historical activity summaries.
- Context-aware recommendations.
- Notifications and user-facing activity information.

## 1.6. Implementation Technologies

The following technologies and development tools are planned:

| Component | Technology |
| --- | --- |
| Mobile application | React Native + Expo |
| Backend framework | Python + FastAPI |
| Machine learning | Scikit-learn + PyTorch |
| Data processing | NumPy + Pandas + SciPy |
| Database | SQLite |
| API communication | REST + WebSocket |
| Map visualization | Leaflet + OpenStreetMap |
| Data visualization | React-based charts |
| Development environment | Visual Studio Code / PyCharm |
| Version control | Git + GitHub |

No additional physical hardware will be required. The system will use the sensors already available in a standard smartphone.

## 1.7. Other Important Considerations

The project will primarily focus on physical activity recognition and movement analysis rather than medical diagnosis or physiological health assessment.

The system will not claim to provide medically accurate fitness or health recommendations.

Sensor measurements may contain noise and inaccuracies, particularly GPS measurements affected by environmental conditions. Therefore, appropriate preprocessing and filtering techniques will be investigated.

User activity data and GPS trajectories are potentially sensitive personal information. The implementation will minimize the collection of unnecessary personal information and store activity records locally in the project's database.

The project will use open-source technologies and datasets, respecting their respective licenses and usage conditions.

---

# 2\. ML/Agent System Description Using PEAS

The following table describes the agents according to the PEAS (Performance Measure, Environment, Actuators, Sensors) framework presented in Chapter 2 of _Artificial Intelligence: A Modern Approach_.

| Agent Name | Performance Measure | Environment | Actuators / Outputs | Sensors / Inputs |
| --- | --- | --- | --- | --- |
| **SSIA** | Accurate and timely collection of sensor measurements; reliable timestamps; low data loss; efficient sensor communication. | Smartphone environment with accelerometer, gyroscope, GPS receiver, and wireless network connectivity. | Transmit timestamped sensor measurements to the backend; start and stop sensor collection; send location updates. | Accelerometer, gyroscope, GPS receiver, system timestamps, and user commands. |
| **ARA** | High activity classification accuracy, precision, recall, and F1-score; low inference latency; stable predictions; reliable generalization to unseen users. | Python backend environment running trained ML models and processing incoming smartphone sensor measurements. | Produce activity predictions, confidence scores, and timestamps; send recognition results to other agents. | Accelerometer and gyroscope measurements; preprocessed sensor windows; model parameters and configuration. |
| **RAA** | Accurate route distance and speed estimates; reliable trajectory segmentation; correct detection of stationary periods; useful route comparisons. | Smartphone GPS environment and backend processing historical and real-time geographical trajectories. | Produce route statistics, trajectory summaries, and route comparison results; send analytical results to other agents. | GPS coordinates, timestamps, speed estimates, altitude measurements, and historical routes. |
| **CAA** | Accurate activity summaries; correct identification of historical trends; meaningful comparisons between activity sessions; reliable contextual information. | Backend environment with access to the activity database and outputs from other agents. | Generate daily and weekly summaries; identify activity trends; send contextual information to the Recommendation Agent. | Activity recognition results, route statistics, historical activity sessions, timestamps, and user preferences. |
| **RA** | Relevance and usefulness of recommendations; consistency with user activity history; low recommendation latency; avoidance of unnecessary or repetitive suggestions. | Backend environment connected to the Context Analysis Agent, Activity Recognition Agent, and user interface. | Generate personalized recommendations, activity suggestions, and notifications. | Current activity predictions, historical activity summaries, route statistics, user preferences, and predefined recommendation rules. |
| **UIA** | Usability, responsiveness, clarity of displayed information, and reliable interaction with the system. | Smartphone and web browser environments with network connectivity and access to backend services. | Display activity information, maps, charts, historical statistics, and recommendations; send user commands and configuration changes. | User input, sensor collection status, agent messages, activity predictions, GPS analysis results, and recommendations. |

## 2.1. Agent Utility and Performance Functions

The agents will have individual performance measures and objectives.

The Activity Recognition Agent will primarily optimize classification performance. Its main evaluation metrics will be accuracy, precision, recall, and F1-score.

The Route Analysis Agent will prioritize the accuracy of geographical distance and speed calculations, as well as the reliability of trajectory processing.

The Context Analysis Agent will aim to identify meaningful historical activity patterns and generate consistent activity summaries.

The Recommendation Agent will prioritize the relevance and consistency of recommendations according to the user's historical activity and current context.

The overall system utility will be evaluated using a combination of the following objectives:

- Correctness of activity recognition.
- Reliability of GPS-based movement analysis.
- Accuracy of historical activity summaries.
- Relevance of generated recommendations.
- Responsiveness of the complete system.
- Successful communication between agents.

For the recommendation component, a simple utility function may be defined as:

**U(recommendation) = α × relevance + β × contextual consistency − γ × repetition penalty**

where α, β, and γ represent configurable weights.

This function will allow the Recommendation Agent to prioritize relevant suggestions while avoiding repetitive recommendations.

## 2.2. Environment Classification According to AIMA

The FitSense environment can be characterized according to the following dimensions:

| Environment Property | Classification | Explanation |
| --- | --- | --- |
| Observability | Partially observable | The system cannot directly observe the user's complete physical condition or intentions. It only receives measurements from smartphone sensors. |
| Determinism | Stochastic | Sensor measurements contain noise and uncertainty, and user movement is not completely predictable. |
| Episodic / Sequential | Sequential | Current decisions and activity predictions depend on previous sensor measurements and historical activity information. |
| Static / Dynamic | Dynamic | The user and surrounding environment change continuously while the system is operating. |
| Discrete / Continuous | Hybrid | Sensor measurements and GPS coordinates are continuous, while recognized activities and system actions are mostly discrete. |
| Number of agents | Multi-agent | Multiple specialized software agents cooperate to achieve the overall system objectives. |
| Knowledge of the environment | Partially known | Sensor characteristics and processing algorithms are known, but the user's actual movement patterns and future behavior are not completely known. |

---

# 3\. Functional Requirements - Main Use Cases / Scenarios

| Use Case Name | Brief Description | Actors Involved |
| --- | --- | --- |
| **Activate / Deactivate the System** | The user can activate or deactivate the fitness companion using the mobile application. When activated, the Smartphone Sensor Interface Agent starts collecting the selected sensor measurements. | User, SSIA, UIA |
| **Start an Activity Monitoring Session** | The user can start a new monitoring session. The system begins collecting accelerometer, gyroscope, and GPS measurements and transmits them to the backend agents for processing. | User, SSIA, ARA, RAA |
| **Real-Time Activity Recognition** | The system continuously analyzes incoming accelerometer and gyroscope measurements and identifies the user's current physical activity. The recognized activity and confidence score are displayed in the user interface. | SSIA, ARA, UIA |
| **View Current Activity Information** | The user can view the currently recognized activity, its estimated duration, and related movement statistics. | User, ARA, UIA |
| **Track and Analyze GPS Routes** | The system records geographical coordinates during an activity session and calculates route distance, average speed, maximum speed, and other available movement statistics. | User, SSIA, RAA, UIA |
| **View Historical Activity Sessions** | The user can access previously recorded activity sessions and view their duration, activity type, route, and movement statistics. | User, CAA, RAA, UIA |
| **Receive Context-Aware Recommendations** | The system analyzes current activity information and historical activity patterns and generates recommendations based on predefined rules and user preferences. | CAA, RA, UIA, User |
| **Compare Activity Performance** | The user can compare current activity sessions with previous sessions, including route distance, duration, and movement speed. | User, CAA, RAA, UIA |
| **View Daily and Weekly Activity Summaries** | The user can view aggregated statistics describing activity duration, activity distribution, and changes in physical activity over time. | User, CAA, UIA |
| **Configure User Preferences** | The user can configure basic preferences, including activity goals, preferred units of measurement, and recommendation settings. | User, UIA, RA |
| **Stop and Save an Activity Session** | The user can stop an active monitoring session. The system finalizes the collected data, calculates session statistics, and stores the results for future analysis. | User, SSIA, ARA, RAA, CAA |

---

# 4\. Front End - User Interface (UI)

The system will provide a mobile interface for collecting smartphone sensor measurements and a web-based dashboard for visualizing activity information and analytical results.

## 4.1. Mobile Application

The mobile application will be developed using React Native and Expo.

It will provide the following functionality:

- Starting and stopping activity monitoring sessions.
- Accessing accelerometer and gyroscope measurements.
- Collecting GPS coordinates during activity sessions.
- Displaying the currently recognized physical activity.
- Showing basic real-time activity statistics.
- Managing user preferences and monitoring permissions.

The mobile application will communicate with the backend through REST API endpoints and WebSocket connections.

## 4.2. Web Dashboard

A web-based dashboard will be implemented using React.

It will provide the following views:

**Activity Dashboard**

Displays the currently recognized activity, confidence score, session duration, and basic activity statistics.

**Route Visualization**

Displays GPS trajectories on an interactive map using Leaflet and OpenStreetMap, together with distance, speed, and elevation statistics where available.

**Activity History**

Displays previous activity sessions and daily or weekly activity summaries.

**Recommendations**

Displays context-aware recommendations generated by the Recommendation Agent, together with relevant historical information.

**System Status**

Displays the status of the different agents and the current sensor collection session.

---

# 5\. Back-end Services / API Endpoints

The backend will be implemented using Python and FastAPI.

Communication between the mobile application, web dashboard, and backend agents will use REST endpoints and WebSocket connections.

The following API resources are planned:

| API Resource | Brief Description | URI |
| --- | --- | --- |
| **Start Monitoring Session** | Creates a new activity monitoring session and initializes the necessary backend processing components. | `POST /api/sessions` |
| **Stop Monitoring Session** | Stops an active session, finalizes collected measurements, and calculates the session statistics. | `POST /api/sessions/{sessionId}/stop` |
| **Get Monitoring Session** | Retrieves information about a specific activity monitoring session. | `GET /api/sessions/{sessionId}` |
| **Get Activity Sessions** | Retrieves the user's previously recorded activity sessions. | `GET /api/sessions` |
| **Sensor Data Stream** | WebSocket endpoint for transmitting timestamped accelerometer and gyroscope measurements from the mobile application. | `WS /ws/sensors/{sessionId}` |
| **GPS Data Stream** | WebSocket endpoint for transmitting GPS coordinates and timestamps during an active session. | `WS /ws/gps/{sessionId}` |
| **Current Activity** | Retrieves the latest activity prediction, including the recognized activity and confidence score. | `GET /api/activity/current` |
| **Activity Statistics** | Retrieves aggregated activity statistics for a specified period. | `GET /api/activity/statistics` |
| **Route Information** | Retrieves GPS trajectory information and calculated statistics for a specific session. | `GET /api/routes/{sessionId}` |
| **Activity Recommendations** | Retrieves recommendations generated using current activity information and historical data. | `GET /api/recommendations` |
| **User Preferences** | Retrieves or updates the user's activity goals and application preferences. | `GET /api/preferences`, `PUT /api/preferences` |
| **Agent Status** | Retrieves the operational status of the individual backend agents. | `GET /api/agents/status` |
| **Real-Time Updates** | WebSocket endpoint for delivering activity recognition results, route statistics, recommendations, and system notifications to the frontend. | `WS /ws/updates` |

The REST API will primarily use JSON request and response formats.

WebSocket messages will contain structured JSON objects with timestamps and relevant sensor measurements or agent outputs.

Internally, the backend will provide interfaces between the specialized agents, allowing them to exchange processed information without requiring direct communication with the mobile application.

---

# 6\. Used External Resources

The following external resources will be used during the development and research phases.

## 6.1. Datasets

**1\. UCI Human Activity Recognition Using Smartphones Dataset (UCI HAR)**

https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

A publicly available human activity recognition dataset containing accelerometer and gyroscope measurements collected from 30 participants performing six different activities.

It will be used as one of the primary datasets for training and evaluating the activity recognition models.

**2\. WISDM Smartphone and Smartwatch Activity and Biometrics Dataset**

https://archive.ics.uci.edu/dataset/507/wisdm+smartphone+and+smartwatch+activity+and+biometrics+dataset

A dataset containing inertial sensor measurements collected from multiple participants performing different physical activities.

It will be used as an additional dataset for activity recognition experiments and investigation of model generalization.

**3\. Microsoft Research GeoLife GPS Trajectories Dataset**

https://www.microsoft.com/en-us/research/project/geolife-building-social-networks-using-human-location-history/

A large GPS trajectory dataset containing geographical coordinates, timestamps, and movement information collected from multiple users.

It will be used to investigate GPS trajectory processing, route analysis, movement segmentation, and route similarity.

## 6.2. Machine Learning and Data Processing Libraries

**4\. Scikit-learn**

https://scikit-learn.org/

Open-source Python machine learning library providing implementations of Random Forest, Support Vector Machines, classification metrics, and data preprocessing techniques.

**5\. PyTorch**

https://pytorch.org/

Open-source deep learning framework that will be used to implement and train the 1D Convolutional Neural Network for activity recognition.

**6\. NumPy and Pandas**

https://numpy.org/

https://pandas.pydata.org/

Libraries for numerical computation, data manipulation, sensor data preprocessing, and statistical analysis.

**7\. SciPy**

https://scipy.org/

Scientific computing library that may be used for signal processing, filtering, and feature extraction from smartphone sensor measurements.

## 6.3. Mobile and Backend Development

**8\. React Native**

https://reactnative.dev/

Framework for developing the smartphone application using JavaScript or TypeScript and React.

**9\. Expo Sensors**

https://docs.expo.dev/versions/latest/sdk/sensors/

Provides access to smartphone motion sensors, including accelerometer and gyroscope measurements.

**10\. Expo Location**

https://docs.expo.dev/versions/latest/sdk/location/

Provides access to smartphone location services and GPS measurements.

**11\. FastAPI**

https://fastapi.tiangolo.com/

Modern Python framework for implementing backend REST APIs and WebSocket communication.

**12\. Leaflet**

https://leafletjs.com/

Open-source JavaScript library for displaying interactive maps and geographical data.

**13\. OpenStreetMap**

https://www.openstreetmap.org/

Open geographical mapping resource that will be used as a map data source for route visualization.

---

# 7\. Expected Results

The expected result is a functioning multi-agent fitness companion capable of collecting smartphone sensor measurements, recognizing physical activities, analyzing GPS trajectories, maintaining historical activity information, and generating context-aware recommendations.

The project will demonstrate the practical implementation and comparison of different machine learning techniques for human activity recognition, including classical machine learning algorithms and deep learning models.

The experimental results will provide insights into the accuracy, computational performance, and generalization capabilities of the selected algorithms.

Additionally, the project will demonstrate how multiple specialized software agents can cooperate to transform raw smartphone sensor measurements into meaningful activity information and personalized recommendations.

The complete system will be accompanied by technical documentation describing its architecture, agent responsibilities, communication protocols, machine learning experiments, and installation procedures.

The source code will be published in a GitHub repository under the Apache License 2.0, while project documentation will be distributed under an appropriate open-content license such as CC BY-SA.