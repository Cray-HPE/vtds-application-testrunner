# vtds-application-testrunner

This vTDS Application Layer implementation configures, installs and
deploys a "test runner" platform, which is a project with one or more
Virtual Blades and no Virtual Nodes configured to be used for running
workflows that involve deploying and interacting with other vTDS
Managed clusters. It was written to provide a means for creating and
managing a bastion node on which to run vTDS Deployment and testing of
OpenCHAMI, but it can be adapted to providing a similar service for
other products as well.

## Description

This is an Application Layer implementation for vTDS that contains the
code and base configuration needed to deploy te simplest of vTDS
deployments: a project within your provider hosting one or more
Virtual Blades and no Virtual Nodes, in which the Virtual Blades
provide a platform for operations including deploying, managing and
interacting with other vTDS managed clusters. Unlike most vTDS
clusters which contain Virtual Nodes and Virtual Networks, the
'testrunner' platform uses the Virtual Blades directly as
computational resources and only takes advantage of provider granted
access to internal and external networks.
