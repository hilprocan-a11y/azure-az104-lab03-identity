# Validation record — 5 September 2026

Evidence was observed in user-provided Azure portal and Cloud Shell screenshots during the lab. This file summarizes it without publishing raw screenshots containing account identifiers.

| Evidence | Result |
|---|---|
| Guest IAM / View my access | Reader, This resource, no group assignment |
| Operator IAM / View my access | Contributor, This resource, GRP-Azure-Operators |
| Tags as operator | Project and Purpose preserved; RBAC-Test=Operator-Write-OK saved |
| Tags as guest | Reader-Test=Should-Fail rejected with AuthorizationFailed |
| Activity Log | Write tags initiated by lab operator at 00:54:48 MDT, 5 September 2026; Succeeded in list |
| CLI direct assignments | User/Reader and Group/Contributor |
| CLI include-inherited | Personal administrator Owner at subscription scope |
| CLI group members | Lab Azure Operator |
| Cloud Shell provider | Registered |
| Bicep what-if | 2 no change; principalType annotations marked NoEffect |
| Bicep deployment | lab03-rbac-bicep — Succeeded |

Limits: no successful second deployment was captured; the no-change preview preceded the successful deployment. No claim is made that raw audit logs were exported, that the Reader failure appeared in Activity Log, or that a production application was deployed.
