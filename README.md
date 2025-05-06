# rook-ceph-k8s

This repository helps you deploy a Kubernetes cluster with Rook Ceph storage using Vagrant and Ansible.  
It provisions 1 master and 3 worker VMs, bootstraps Kubernetes, installs Rook Ceph, and sets up a replicated RBD pool for dynamic storage provisioning.

---

## **Architecture**

```
+---------+      +----------+      +----------+      +----------+
| Master  |      | Worker 1 |      | Worker 2 |      | Worker 3 |
| (K8s)   |<---->| (K8s,    |<---->| (K8s,    |<---->| (K8s,    |
|         |      |  Ceph)   |      |  Ceph)   |      |  Ceph)   |
+---------+      +----------+      +----------+      +----------+
```

- Only worker nodes have additional disks for Ceph OSDs.

---

## **Prerequisites**

- [Vagrant](https://www.vagrantup.com/downloads) (configured for VirtualBox or Libvirt)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [VirtualBox](https://www.virtualbox.org/) or [Libvirt](https://libvirt.org/)
- Git

---

## **Setup Instructions**

1. **Clone this repository**
   ```sh
   git clone https://github.com/yourusername/rook-ceph-k8s.git
   cd rook-ceph-k8s
   ```

2. **Configure IPs and SSH**
   - Edit `Vagrantfile`, `hosts`, and `deploy-k8s-ceph.yaml` to set your desired master and worker IPs.
   - Add your SSH public key to `common.sh` if required.

3. **Provision the VMs**
   ```sh
   vagrant up
   ```

4. **Run the Ansible Playbook**
   ```sh
   ansible-playbook -i hosts deploy-k8s-ceph.yaml
   ```

---

## **Customizing the Deployment**

- **Number of Workers/Disks:**  
  Edit the `Vagrantfile` to change the number of worker nodes or add more disks per worker.
- **Kubernetes/CEPH Versions:**  
  Update variables in the playbook for different versions.

---

## **Accessing the Cluster**

- After deployment, the Kubernetes config will be available in the `.kube/config` file.
- Use `kubectl` to interact with your cluster:
  ```sh
  export KUBECONFIG=$(pwd)/.kube/config
  kubectl get nodes
  ```

---

## **Troubleshooting**

- If VMs fail to provision, check your virtualization provider and system resources.
- If Ansible fails, ensure SSH access and correct IPs in your inventory.
- For Ceph or Kubernetes issues, check pod logs:
  ```sh
  kubectl -n rook-ceph get pods
  kubectl -n rook-ceph logs <pod-name>
  ```

---

## **References**

- [Rook Ceph Documentation](https://rook.io/docs/rook/latest/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [Ansible Documentation](https://docs.ansible.com/)

---

## **License**

MIT License

---

*Feel free to open issues or PRs for improvements!*
