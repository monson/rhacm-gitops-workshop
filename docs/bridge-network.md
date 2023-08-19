
## Bridge Network Setup - `br0`
### Preface
The instructions in this section are specific to our project infrastructure, revolving around the use of the `eno1np0` physical interface to create a bridge network. While multiple methods exist to set up bridge networks, the steps detailed here are based on our unique configuration.

If your environment or requirements differ, you may choose to adapt the steps provided or skip this section.

### Objective
For this project, we are creating a bridge network, named `br0`, to link our KVM virtual machines to the external network. This ensures seamless communication and proper network functionality between our VMs and the broader environment.

### Steps to Set Up `br0`
- Navigate to the setup directory:
```
cd 001-hubcluster-setup
```
- Run the bridge network creation script:
```
bash 001-create-bridge-network.sh
```
Executing this script will automate the creation of the `br0` bridge using the eno1np0 physical interface and assign it an IP address of `192.168.7.212/22`.

### Post-setup Configuration Details
- Physical Interface (eno1np0): Retains its IP address (`192.168.7.213/24`) even after the bridge's creation.
- Bridge Interface (br0): Acquires an IP address of `192.168.7.212/22`. This address will be used by VMs or other devices connected to the bridge for external communications.

### Important Notes
- The `br0` bridge acts much like a switch, with `eno1np0` serving as its port. VMs connected to this bridge can interact with the physical network via `eno1np0`.
- It's crucial to ensure that firewall settings, if applicable, are adjusted to facilitate traffic through both the `br0` interface and `eno1np0`.
- Remember, this is a unique configuration where both the bridge and the physical interface retain individual IP addresses. Ensure proper routing and network configurations to avoid potential issues.
