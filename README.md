---
<!-- fg=white bg=black -->
## Multicloud Infrastructure with terraform and ansible

### https://github.com/hasiotis/devops-league

#### Chasiotis Nikos

---
<!-- fg=white bg=black -->
### About me - Member of the Metrika's SRE Team
```
                                ./((/,                    */((*.
                             ((((((((((((,            *((((((((((((
                           ,(((((((((((((((          (((((((((((((((.
                           ((((((((((((((((*        /((((((((((((((((
                           ((((((((((((((((.        ((((((((((((((((/
                          *(((((((((((((((          (((((((((((((((*
                         ((((((((((((((*          /((((((((((((((
                      ,((((((.                  ((((((,   (((((,
                    ((((((,                  *(((((/      /((((
                 ,((((((                   ((((((.        /((((
        .,,,*/(((((((,            ,,,*/(((((((/          /((((((
    (((((((((((((((.         *((((((((((((((/          (((((((((((.
  /(((((((((((((((,        .((((((((((((((((         (((((((((((((((.
 .((((((((((((((((         ((((((((((((((((*        /((((((((((((((((
  ((((((((((((((((         ((((((((((((((((.        *((((((((((((((((
  .((((((((((((((           ((((((((((((((,          *((((((((((((((
     (((((((((/               /(((((((((.              .(((((((((*

The industry’s only toolbox for monitoring blockchain networks and applications,
           offering essential analytics and performance insights.
```

---
<!-- fg=white bg=black -->
## Why go multicloud

There are probably more reasons to **not** go multicloud, but some times you just have to.

If that is the case keep watching...

---
<!-- fg=white bg=black -->
## The demo infrastructure

- VM based infrastructure
- We will use terraform to create infra
- We will use ansible to complete the installation

---
<!-- fg=white bg=black -->
## The basic idea

- Abstract VM creation into terraform modules
- Use the labeling/tagging systems of each cloud provider to handover to ansible
- Use modules as building blocks to create more complex infrastructure

---
<!-- fg=white bg=black -->
What we expect from a **vm** terraform module

### Provision a VM on the provider with

- A proper name of our choice (not localhost, ip-xx-xx, etc)
- A standardized username that can become root trust our ssh-key
- DNS entries that dynamically match the public IP address of the VM
- Proper tagging/labeling that ansible can later use

---
<!-- fg=white bg=black -->
# Demo time
