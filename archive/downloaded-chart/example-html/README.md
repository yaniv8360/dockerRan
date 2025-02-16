# Example html

This helm chart is used to create a deployment of a small webserver based on [startx apache image](https://quay.io/startx/apache).

This chart is part of the [example-xxx startx helm chart series](https://helm-repository.readthedocs.io#examples-helm-charts) focused on deploying various kind of application consuming the cluster services deployed using the [cluster-xxx charts](https://helm-repository.readthedocs.io#cluster-helm-charts).

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedocs.io) for
more information on how to use theses resources.

## Deploy this helm chart on openshift

### 1. Connect to your Openshift cluster

```bash
oc login -t <token> <cluster-url>
```

### 2. Install the repository

```bash
helm repo add startx https://helm-repository.readthedocs.io/en/latest/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/example-html
```

### 4. Install this chart

```bash
helm install example-html startx/example-html
```

## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                       |
| ------------------- | --------- | --------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)             |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                   |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod) |
| context.component   | demo      | Component name of this application (logical tenant)                               |
| context.app         | html      | Application name (functionnal tenant, default use Chart name)                     |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                   |

### example-html values dictionary

| Key                  | Default    | Description                                          |
| -------------------- | ---------- | ---------------------------------------------------- |
| html.service.enabled | false      | Enable service for this application                  |
| html.version         | 0.3.63     | Sxapi image version to run                           |
| html.profile         | prod:start | Profile to run inside the container                  |
| html.debug           | true       | Enable debuging of the container                     |
| html.replicas        | 1          | Define the number of replicas for this html instance |
| html.data            | string     | Files to load into the application                   |

## Values files

### Default values file (values.yaml)

Complete deployment of an html application with the following characteristics :

- 1 **service** named **example-html** load balancing to pod deployed
- 1 **deployment** named **example-html** deploying **1 pod** from version **0.3.63** html image running the **prod:start** command with debug disabled
- 2 **configMap** holding html configuration and pod environment variable context

```bash
# base configuration running default configuration
helm install example-html startx/example-html
```

### Development values file (values-demo-hpa.yaml)

Complete deployment of a html demo application for stress test (used in HPA test) with the following characteristics :

- 1 **service** named **hpa-app** load balancing to pod deployed
- 1 **deployment** named **hpa-app** deploying **2 pod** from version **alpine3** html image running with debug disabled
- 2 **configMap** holding html configuration and pod environment variable context

```bash
# base configuration running tekton v1.0.1 configuration
helm install example-html startx/example-html -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/example-html/values-demo-hpa.yaml
```

## History

| Release  | Date       | Description                                                                                    |
| -------- | ---------- | ---------------------------------------------------------------------------------------------- |
| 0.3.117  | 2020-11-13 | Create chart example-html from example-html                                                    |
| 0.3.121  | 2020-11-14 | Add full example of html application deployed with content served from configmaps              |
| 0.3.135  | 2020-11-23 | Improve documentation for all examples charts                                                  |
| 0.3.141  | 2020-11-24 | publish stable update for the full repository                                                  |
| 0.3.151  | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                            |
| 0.3.153  | 2021-01-23 | publish stable update for the full repository                                                  |
| 0.3.165  | 2021-01-23 | Upgrade all chart dependencies                                                                 |
| 0.3.167  | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                    |
| 0.3.169  | 2021-01-24 | Move to 0.3.155 dependencies                                                                   |
| 0.3.187  | 2021-02-13 | Align example chart release to 0.3.187                                                         |
| 0.3.187  | 2021-02-13 | Create from example-php                                                                        |
| 0.3.191  | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                   |
| 0.3.199  | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                    |
| 0.3.201  | 2021-02-20 | Update icon and image for charts                                                               |
| 0.3.203  | 2021-02-21 | Upgrade chart release informations                                                             |
| 0.3.207  | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                      |
| 0.3.209  | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                |
| 0.3.215  | 2021-05-06 | Align all chart to release 0.3.215                                                             |
| 0.3.225  | 2021-05-10 | Update all chart to use new RBAC naming                                                        |
| 0.3.226  | 2021-05-31 | Add manpage for multiple demo                                                                  |
| 0.3.305  | 2021-06-04 | publish stable update for the full repository                                                  |
| 0.3.343  | 2021-06-06 | publish stable update for the full repository                                                  |
| 0.3.381  | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                   |
| 0.3.390  | 2021-06-12 | Prepare 0.4.0 release                                                                          |
| 0.3.423  | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts                                 |
| 0.3.431  | 2021-07-05 | Move to dependencies 1.18.0                                                                    |
| 0.3.480  | 2021-08-03 | publish stable update for the full repository                                                  |
| 0.3.998  | 2021-08-04 | publish stable update for the full repository                                                  |
| 0.3.999  | 2021-08-04 | Release stable version 0.3.999 align with ocp 4.7.13                                           |
| 7.22.1   | 2021-08-04 | Move to release 7.22.1 to align versionning with ocp release cycle                             |
| 7.22.2   | 2021-08-04 | Move helm dependencies to a 7.x.x release model                                                |
| 7.22.3   | 2021-08-05 | publish stable update for the full repository                                                  |
| 7.22.5   | 2021-08-05 | publish stable update for the full repository                                                  |
| 7.22.6   | 2021-08-05 | Stable version for chart dependencies                                                          |
| 7.22.7   | 2021-08-05 | Stable for OCP version 4.7.22                                                                  |
| 7.22.12  | 2021-09-23 | publish stable update for the full repository                                                  |
| 7.22.21  | 2021-10-05 | ServiceAccount and ImagePullSecrets managed by project chart                                   |
| 7.22.25  | 2021-10-06 | publish stable update for the full repository                                                  |
| 7.22.27  | 2021-10-06 | publish stable update for the full repository                                                  |
| 8.13.1   | 2021-10-06 | Stable release for OCP 4.8.13 version                                                          |
| 8.13.3   | 2021-10-08 | Improve code execution, syntax and introduce the ACS helm-chart                                |
| 8.13.5   | 2021-10-21 | publish stable update for the full repository                                                  |
| 8.13.7   | 2021-10-21 | publish stable update for the full repository                                                  |
| 8.13.8   | 2021-10-21 | Adding first draft of json schema                                                              |
| 8.13.9   | 2021-10-22 | Adding the schema in chart                                                                     |
| 8.13.25  | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and upgrade chart dep to version 8.13.23 |
| 8.13.27  | 2021-11-10 | publish stable update for the full repository                                                  |
| 8.20.3   | 2021-11-11 | Align all charts to Openshift version 4.8.20                                                   |
| 8.20.5   | 2021-11-12 | Upgrade all appVersion and align chart release                                                 |
| 8.20.9   | 2021-11-12 | Align all startx chart to version 8.20.9                                                       |
| 0.20.11  | 2021-11-12 | Move chart dependencies to version 8.20.5                                                      |
| 0.20.33  | 2021-11-14 | publish stable update for the full repository                                                  |
| 0.20.41  | 2021-11-14 | Aling all dependencies to version 0.20.34                                                      |
| 8.20.46  | 2021-11-19 | Transitionnal chart                                                                            |
| 8.20.60  | 2021-11-19 | publish stable update for the full repository                                                  |
| 8.20.66  | 2021-11-20 | Updating limits for context vars in values schema                                              |
| 8.20.70  | 2021-11-20 | publish stable update for the full repository                                                  |
| 8.20.71  | 2021-11-20 | Align all charts to Openshift version 4.8.21                                                   |
| 9.8.1    | 2021-11-20 | Upgrade to Openshift version 4.9.8                                                             |
| 9.8.4    | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version                                            |
| 9.8.7    | 2021-11-20 | Debug dependencies problem                                                                     |
| 9.8.9    | 2021-11-20 | Update startx chart dependencies version to 9.8.8 and schema update                            |
| 9.8.15   | 2021-11-20 | Update startx chart dependencies version to 9.8.11                                             |
| 9.8.19   | 2021-11-20 | Update startx chart dependencies version to 9.8.15 and improve values schema                   |
| 9.8.28   | 2021-11-20 | Update the startx chart dependencies to version 9.8.23                                         |
| 9.8.32   | 2021-11-21 | Idleing resources                                                                              |
| 9.8.39   | 2021-11-21 | Debug version check with more permissive mode                                                  |
| 9.8.43   | 2021-11-21 | Update the startx chart dependencies to version 9.8.39                                         |
| 9.8.45   | 2021-11-21 | Update the values schema limits for context properties                                         |
| 9.8.47   | 2021-11-21 | Improve version management for chart                                                           |
| 9.8.48   | 2021-11-22 | Update sxapi to version 0.3.63 with many security updates                                      |
| 9.8.51   | 2021-11-22 | Update startx chart dependencies to version 9.8.48                                             |
| 9.8.52   | 2021-11-23 | Move the demo-awx-runner manpage values to demo-automation-runner                              |
| 9.8.53   | 2021-12-09 | Move all manpage chart to 1 replicas                                                           |
| 9.8.54   | 2021-12-09 | Move all manpage chart to 1 replicas                                                           |
| 9.8.67   | 2021-12-18 | Align all charts to release 9.8.67                                                             |
| 9.8.71   | 2021-12-18 | Update helm-chart dependencies to version 9.8.59                                               |
| 9.8.75   | 2021-12-19 | Align with all other startx chart version to number 9.8.75                                     |
| 9.8.76   | 2021-12-19 | Change helm.sh/chart name                                                                      |
| 9.8.81   | 2021-12-20 | Update the storage context                                                                     |
| 9.8.91   | 2022-03-06 | publish stable update for the full repository                                                  |
| 9.8.93   | 2022-03-07 | Enable conditionnal loading of charts dependencies                                             |
| 9.8.109  | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                            |
| 9.8.110  | 2022-04-27 | Stable release for all charts                                                                  |
| 9.8.114  | 2022-04-27 | publish stable update for the full repository                                                  |
| 9.8.215  | 2022-05-06 | Upgrade startx chart dependencies to version 9.8.211                                           |
| 9.8.230  | 2022-05-06 | Stable full repository                                                                         |
| 9.8.231  | 2022-05-06 | Debug basic chart dependencies                                                                 |
| 9.8.233  | 2022-05-06 | publish stable update for the full repository                                                  |
| 9.8.239  | 2022-05-17 | Remove default csv from all charts. global release 9.8.239                                     |
| 9.8.253  | 2022-05-29 | Align all charts dependencies to release 9.8.251                                               |
| 9.8.277  | 2022-05-31 | publish stable update for the full repository                                                  |
| 9.15.1   | 2022-06-01 | Align all chart for Openshift 4.9.15                                                           |
| 9.15.2   | 2022-06-01 | Align all charts to release 9.15.1                                                             |
| 9.15.3   | 2022-06-01 | Align all charts to release 9.15.3                                                             |
| 10.12.1  | 2022-06-01 | Align all charts to release 10.12.1                                                            |
| 10.12.3  | 2022-06-01 | publish stable update for the full repository                                                  |
| 10.12.4  | 2022-06-01 | Align all charts to release 10.12.4                                                            |
| 10.12.5  | 2022-06-01 | publish stable update for the full repository                                                  |
| 10.12.6  | 2022-06-03 | Add chaos manpage                                                                              |
| 10.12.7  | 2022-06-04 | Improve example-html options                                                                   |
| 10.12.22 | 2022-06-04 | Align all chart to release version 10.12.22                                                    |
| 10.12.23 | 2022-06-04 | Basi chart dependencies upgraded to version 10.12.5                                            |
| 10.12.29 | 2022-06-17 | publish stable update for the full repository                                                  |
| 10.12.30 | 2022-06-17 | Improved logo and global documentation                                                         |
| 10.12.33 | 2022-06-17 | publish stable update for the full repository                                                  |
| 10.12.34 | 2022-06-17 | Align all dependencies charts to 10.12.31                                                      |
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41                                                           |
| 10.12.46 | 2022-06-18 | publish stable update for the full repository                                                  |
| 10.12.49 | 2022-06-18 | publish stable update for the full repository                                                  |
| 10.12.53 | 2022-06-18 | publish stable update for the full repository                                                  |
| 10.12.71 | 2022-06-28 | Debug the appVersion in all charts                                                             |
| 10.12.72 | 2022-07-02 | Common release                                                                                 |
| 10.12.77 | 2022-07-02 | Stable for clients                                                                             |
| 10.12.81 | 2022-07-02 | publish stable update for the full repository                                                  |
| 10.12.97 | 2022-07-03 | publish stable update for the full repository                                                  |
| 10.12.99 | 2022-09-16 | Initialize OCP 4.11 upgrade on all chart                                                       |
| 11.5.3   | 2022-09-17 | Align all STARTX charts to release 11.5.3                                                      |
| 11.7.1   | 2022-10-01 | Upgrade chart to latest release available for OCP 4.11.7 release                               |
| 11.7.3   | 2022-10-02 | publish stable update for the full repository                                                  |
| 11.7.9   | 2022-10-02 | publish stable update for the full repository                                                  |
| 11.7.10 | 2022-10-02 | Stable release for all packages
| 11.7.11 | 2022-10-02 | publish stable update for the full repository
| 11.7.15 | 2022-10-02 | publish stable update for the full repository
| 11.7.17 | 2022-10-02 | publish stable update for the full repository
| 11.7.31 | 2022-10-29 | publish stable update for the full repository
| 11.7.33 | 2022-10-29 | Update all startx packages to release 11.7.33
| 11.7.41 | 2022-11-02 | publish stable update for the full repository
| 11.7.61 | 2022-11-30 | publish stable update for the full repository
| 11.7.62 | 2022-11-30 | Debug console links and notifications
| 11.7.63 | 2022-11-30 | publish stable update for the full repository
| 11.7.67 | 2022-11-30 | Debug depedencies on sub charts
| 11.7.69 | 2022-11-30 | Finished dependencies stabilization
| 11.7.73 | 2022-12-04 | Align all packages to release 11.7.73
| 11.7.75 | 2022-12-04 | publish stable update for the full repository
| 11.7.77 | 2022-12-05 | publish stable update for the full repository
| 11.7.87 | 2023-02-15 | publish stable update for the full repository
| 11.7.88 | 2023-02-15 | publish stable update for the full repository
| 11.7.91 | 2023-02-16 | publish stable update for the full repository
| 11.7.93 | 2023-02-16 | align dependencies to version 11.7.89
| 11.7.97 | 2023-02-19 | publish stable update for the full repository
| 11.28.11 | 2023-02-19 | publish stable update for the full repository
| 11.28.15 | 2023-02-19 | publish stable update for the full repository
| 11.28.16 | 2023-02-19 | publish stable update for the full repository
| 11.28.19 | 2023-02-19 | publish stable update for the full repository
| 11.28.21 | 2023-02-19 | Upgrade all dependencies packages to release 11.28.15
| 11.28.23 | 2023-02-21 | publish stable update for the full repository
| 11.28.27 | 2023-02-21 | All chart aligned to release 11.28.27
| 11.28.29 | 2023-02-21 | publish stable update for the full repository
| 11.28.35 | 2023-02-21 | publish stable update for the full repository
| 11.28.49 | 2023-02-21 | publish stable update for the full repository
| 11.28.59 | 2023-02-21 | publish stable update for the full repository
| 11.28.60 | 2023-02-21 | publish stable update for the full repository
| 11.28.67 | 2023-02-23 | publish stable update for the full repository
| 11.28.69 | 2023-03-07 | publish stable update for the full repository
| 11.28.89 | 2023-04-01 | publish stable update for the full repository
| 11.28.93 | 2023-04-20 | publish stable update for the full repository
| 11.28.95 | 2023-04-21 | publish stable update for the full repository
| 11.28.99 | 2023-04-21 | publish stable update for the full repository
| 11.28.103 | 2023-05-04 | publish stable update for the full repository
| 11.28.127 | 2023-06-12 | publish stable update for the full repository
| 11.28.128 | 2023-06-12 | publish stable update for the full repository
| 11.28.129 | 2023-06-13 | publish stable update for the full repository
| 11.28.201 | 2023-07-06 | publish stable update for the full repository
| 11.28.207 | 2023-07-06 | publish stable update for the full repository
| 11.28.230 | 2023-08-18 | Align all helm chart to release 11.28.230 stable release
| 11.30.0 | 2023-08-18 | Align all helm chart to release 11.30.0 stable for OCP 4.11.30
| 11.40.0 | 2023-08-18 | Align all helm chart to release 11.40.0 stable for OCP 4.11.40
| 11.47.0 | 2023-08-18 | Align all helm chart to release 11.47.0 stable for OCP 4.11.47
| 11.47.1 | 2023-08-18 | Update appVersion in Chart.yml
| 12.0.0 | 2023-08-18 | Align all helm chart to release 12.0.0 transitionnal for OCP 4.12.0 target (unstable)
| 12.0.1 | 2023-08-18 | Align all helm chart to release 12.0.1 transitionnal for OCP 4.12.0 target (unstable)
| 12.0.5 | 2023-08-18 | publish stable update for the full repository
| 12.0.11 | 2023-08-18 | publish stable update for the full repository
| 12.30.1 | 2023-09-29 | release 12.30.1 aligned and tested with OCP 4.12.30
| 12.36.1 | 2023-09-29 | release 12.36.0 aligned with OCP 4.12.36 (unstable)
| 12.36.9 | 2023-10-01 | publish stable update for the full repository
| 12.36.36 | 2023-10-11 | publish stable update for the full repository
| 12.36.49 | 2023-11-13 | publish stable update for the full repository
| 12.36.51 | 2023-11-13 | publish stable update for the full repository
| 12.36.58 | 2023-11-13 | Align all startx dependencies packages to version 12.36.49 stable for OCP 4.12.36
| 12.36.59 | 2023-11-13 | publish stable update for the full repository
| 12.36.63 | 2023-11-13 | publish stable update for the full repository
| 12.36.64 | 2023-11-13 | publish stable update for the full repository
| 12.36.65 | 2023-11-14 | publish stable update for the full repository
| 12.36.66 | 2023-11-14 | Update trunc to 255 for helper
| 12.36.69 | 2023-11-14 | move dependencies to version 12.36.65
| 12.45.0 | 2023-12-08 | Stable version aligned to Openshift version 4.12.45
| 13.26.0 | 2023-12-08 | Unstable version aligned to Openshift version 4.13.26 to prepare the 13.26.x stable release (short lived)
| 13.26.1 | 2023-12-09 | Minimum requirements for kubernetes is 1.26.0 version and upgrade all cluster-xxx charts to latest release for OCP 4.13
| 13.26.2 | 2023-12-09 | upgrade all dependencies charts to version 13.26.0
| 13.26.3 | 2023-12-09 | publish stable update for the full repository
| 14.6.1 | 2023-12-09 | iniFirst release for OCP 4.14 release. Aligned on 4.14.6 release
| 14.6.5 | 2023-12-10 | upgrade all dependencies charts to version 13.26.2
| 14.6.9 | 2023-12-10 | publish stable update for the full repository
| 14.6.11 | 2023-12-10 | upgrade minimum kubeVersion to 1.27.x and startx helm-chart dependencies to version 14.6.5
| 14.6.15 | 2023-12-11 | update packages for OCP 4.14.6
| 14.6.21 | 2023-12-18 | publish stable update for the full repository
| 14.6.22 | 2023-12-18 | stable si good
| 14.6.27 | 2023-12-19 | publish stable update for the full repository
| 14.6.29 | 2023-12-19 | publish stable update for the full repository
| 14.6.31 | 2023-12-19 | move to kubeversion min 1.25.0
| 14.6.33 | 2023-12-19 | Move dependencies to github-pages
| 14.6.35 | 2023-12-20 | publish stable update for the full repository
| 14.6.45 | 2023-12-22 | publish stable update for the full repository
| 14.6.46 | 2023-12-22 | publish stable update for the full repository
| 14.6.55 | 2023-12-22 | align all dependencies chart to 14.6.45
| 14.6.59 | 2023-12-22 | move back dependencies to version 14.6.35
