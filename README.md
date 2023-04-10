# OpenVPN Server Container

## References

* [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn)

## How to Use

Run the scripts in the following order:

1. generate_openvpn_config.sh <common_name>
2. generate_ca.sh
3. generate_new_client.sh <client_name>
4. sudo run_openvpn_server.sh

## Notes

Some of the following commands may need to be executed on the Host:

* If encountering this in the logs:
    ```log
    iptables v1.8.4 (legacy): can't initialize iptables table `nat': Table does not exist (do you need to insmod?)
    Perhaps iptables or your kernel needs to be upgraded.
    ```
    run the following:
    ```sh
    sudo modprobe ip_tables
    echo 'ip_tables' | sudo tee -a /etc/modules
    ```
