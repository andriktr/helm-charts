# Kyverno Policies Helm Chart for Secure AKS clusters

## Description

Current repository contains a Helm chart which deploys a configurable [Kyverno] policies which will help secure AKS (Azure Kubernetes Cluster) cluster.

## Table of Contents

<!--ts-->

* [Table of Contents](#table-of-contents)
* [Description](#description)
* [Prerequisites](#prerequisites)
* [Configure Policies](#configure-kyverno-policies)
* [Deploy and Upgrade Kyverno Policies](#deploy-and-upgrade-kyverno-policies)  
* [Remove the solution](#remove-the-solution)
* [Other Documentation](#external-documentation)

<!--te-->

## Configure Policies

All policies are separately configurable via chart configuration [values.yaml](values.yaml) files

Parameter | Description | Default Value
--------- | ----------- | -------------
systemNamespaces | List of "system" namespaces this namespaces will be excluded from management and policies will not be applied | ["kube-system", "kube-public", "kube-node-lease", "kyverno"]
policies.createNetworkPolicy.enabled | If true policy will be enabled | true
policies.createNetworkPolicy.background | Controls if rules are applied to existing resources | true
policies.createNetworkPolicy.synchronize | Controls if the generated resource is kept in-sync with the source resource (which can be defined as part of the policy or may be an existing resource), and generated resources cannot be modified by users. If synchronize is set to false then users can update or delete the generated resource directly | true
policies.createNetworkPolicy.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.createNetworkPolicy.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.createNetworkPolicy.matchLabels | Policy will take effect only for those namespaces which will have a defined labels `key: value` | {}
policies.createNetworkPolicy.networkPolicyName | Name which will be set to the network policy | "-default-np"
policies.createNetworkPolicy.spec | Configurable [NetworkPolicy.spec] which will be applied to the network policy | {}
policies.createLimitRanges.enabled | If true policy will be enabled | true
policies.createLimitRanges.background | Controls if rules are applied to existing resources | true
policies.createLimitRanges.synchronize | Controls if the generated resource is kept in-sync with the source resource (which can be defined as part of the policy or may be an existing resource), and generated resources cannot be modified by users. If synchronize is set to false then users can update or delete the generated resource directly | true
policies.createLimitRanges.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.createLimitRanges.matchLabels | Policy will take effect only for those namespaces which will have a defined labels `key: value` | {}
policies.createLimitRanges.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.createLimitRanges.resourceQuotaName | Name which will be set to the resource quota | "default-ns-compute"
policies.createLimitRanges.spec | Configurable [LimitRange.spec] which will be applied to the network policy | {}
policies.createResourceQuotas.enabled | If true policy will be enabled | true
policies.createResourceQuotas.background | Controls if rules are applied to existing resources | true
policies.createResourceQuotas.synchronize | Controls if the generated resource is kept in-sync with the source resource (which can be defined as part of the policy or may be an existing resource), and generated resources cannot be modified by users. If synchronize is set to false then users can update or delete the generated resource directly | true
policies.createResourceQuotas.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.createResourceQuotas.matchLabels | Policy will take effect only for those namespaces which will have a defined labels `key: value` | {}
policies.createResourceQuotas.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.createResourceQuotas.resourceQuotaName | Name which will be set to the resource quota | "default-ns-compute"
policies.createResourceQuotas.spec | Configurable [ResourceQuoata.spec] which will be applied to the network policy | {}
policies.replaceResourceRequests.enabled | If true policy will be enabled | true
policies.replaceResourceRequests.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.replaceResourceRequests.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.replaceResourceRequests.requests | Configurable memory or cpu request which will be applied by policy | {}
policies.requireLabels.enabled | If true policy will be enabled | true
policies.requireLabels.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.requireLabels.kinds | List of resource kinds for which this policy will have effect | ["Namespace"]
policies.requireLabels.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.requireLabels.background | Controls if rules are applied to existing resources | true
policies.requireLabels.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.requireLabels.labels | List of labels which will be added to the policy rule and be required by it | ["it-system-code", "responsible", "application", "environment"]
policies.requireReadOnlyRootFileSystem.enabled | If true policy will be enabled | true
policies.requireReadOnlyRootFileSystem.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.requireReadOnlyRootFileSystem.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.requireReadOnlyRootFileSystem.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.requireReadOnlyRootFileSystem.background | Controls if rules are applied to existing resources | true
policies.requireRunAsNonRoot.enabled | If true policy will be enabled | true
policies.requireRunAsNonRoot.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.requireRunAsNonRoot.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.requireRunAsNonRoot.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.requireRunAsNonRoot.background | Controls if rules are applied to existing resources | true
policies.restrictDefaultNamespace.enabled | If true policy will be enabled | true
policies.restrictDefaultNamespace.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictDefaultNamespace.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictDefaultNamespace.background | Controls if rules are applied to existing resources | true
policies.restrictImageRegistries.enabled | If true policy will be enabled | true
policies.restrictImageRegistries.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictImageRegistries.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictImageRegistries.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictImageRegistries.background | Controls if rules are applied to existing resources | true
policies.restrictImageRegistries.allowedRegistries | Pipe separated list of image registries which will be allowed by policy | dev.azurecr.io/* \| prod.azurecr.io/*
policies.restrictPrivilegedContainers.enabled | If true policy will be enabled | true
policies.restrictPrivilegedContainers.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictPrivilegedContainers.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictPrivilegedContainers.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictPrivilegedContainers.background | Controls if rules are applied to existing resources | true
policies.restrictPrivilegeEscalation.enabled | If true policy will be enabled | true
policies.restrictPrivilegeEscalation.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictPrivilegeEscalation.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictPrivilegeEscalation.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictPrivilegeEscalation.background | Controls if rules are applied to existing resources | true
policies.restrictHostPath.enabled | If true policy will be enabled | true
policies.restrictHostPath.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictHostPath.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictHostPath.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictHostPath.background | Controls if rules are applied to existing resources | true
policies.restrictHostPorts.enabled | If true policy will be enabled | true
policies.restrictHostPorts.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictHostPorts.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictHostPorts.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictHostPorts.background | Controls if rules are applied to existing resources | true
policies.restrictNodePorts.enabled | If true policy will be enabled | true
policies.restrictNodePorts.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictNodePorts.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictNodePorts.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictNodePorts.background | Controls if rules are applied to existing resources | true
policies.restrictProcMount.enabled | If true policy will be enabled | true
policies.restrictProcMount.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictProcMount.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictProcMount.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictProcMount.background | Controls if rules are applied to existing resources | true
policies.restrictAddCapabilities.enabled | If true policy will be enabled | true
policies.restrictAddCapabilities.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictAddCapabilities.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictAddCapabilities.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictAddCapabilities.background | Controls if rules are applied to existing resources | true
policies.restrictHostNamespaces.enabled | If true policy will be enabled | true
policies.restrictHostNamespaces.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictHostNamespaces.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictHostNamespaces.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictHostNamespaces.background | Controls if rules are applied to existing resources | true
policies.restrictSelinux.enabled | If true policy will be enabled | true
policies.restrictSelinux.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictSelinux.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictSelinux.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictSelinux.background | Controls if rules are applied to existing resources | true
policies.restrictSysctls.enabled | If true policy will be enabled | true
policies.restrictSysctls.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictSysctls.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictSysctls.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictSysctls.background | Controls if rules are applied to existing resources | true
policies.restrictAppArmor.enabled | If true policy will be enabled | true
policies.restrictAppArmor.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictAppArmor.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictAppArmor.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictAppArmor.background | Controls if rules are applied to existing resources | true
policies.checkDeprecatedApis.enabled | If true policy will be enabled | true
policies.checkDeprecatedApis.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.checkDeprecatedApis.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.checkDeprecatedApis.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictCriSocketMounts.enabled | If true policy will be enabled | true
policies.restrictCriSocketMounts.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictCriSocketMounts.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictCriSocketMounts.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictCriSocketMounts.background | Controls if rules are applied to existing resources | true
policies.restrictCustomRuntimes.enabled | If true policy will be enabled | true
policies.restrictCustomRuntimes.excludeSystemNamespaces | If true policy will not be applied to the system namespaces | true
policies.restrictCustomRuntimes.excludedNamespaces | List of namespaces to which this policy will be not applied | []
policies.restrictCustomRuntimes.validationFailureAction | Policy action acceptable values `audit` or `enforce` | audit
policies.restrictCustomRuntimes.background | Controls if rules are applied to existing resources | true

## External Documentation

* [Kyverno]

* [Kyverno GitHub]

* [Kyverno Helm Chart]

* [Kyverno Policies]

* [Kyverno Sample Policies]

* [Writing Kyverno Policies]

<!-- Links -->

[Kyverno]: https://kyverno.io/docs/introduction/

[Kyverno GitHub]: https://github.com/kyverno/kyverno/

[Kyverno Helm Chart]: https://github.com/kyverno/kyverno/tree/main/charts/kyverno

[Kyverno Helm Chart Configuration]: https://github.com/kyverno/kyverno/tree/main/charts/kyverno#configuration

[Kyverno Sample Policies]: https://kyverno.io/policies/

[Kyverno Policies]: https://kyverno.io/docs/kyverno-policies/

[Writing Kyverno Policies]: https://kyverno.io/docs/writing-policies/

[Policie reports]: https://kyverno.io/docs/policy-reports/

[NetworkPolicy.spec]: https://kubernetes.io/docs/concepts/services-networking/network-policies/#networkpolicy-resource

[ResourceQuoata.spec]: https://kubernetes.io/docs/concepts/policy/resource-quotas/

[RoleBindings.subjects]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/

[RoleBinding.roleRef]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/

[LimitRange.spec]: https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/