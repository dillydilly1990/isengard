# Connect home using WireGuard
connect-home:
    #!/bin/bash
    echo "Connecting to home"
    sudo tailscale up --exit-node fw --accept-routes

# Disconnect from home using WireGuard
disconnect-home:
    #!/bin/bash
    echo "Disconnecting from home"
    tailscale down

# Install system flatpaks
_install-isengard-flatpaks:
    #!/bin/bash
    BAZZITE_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bazzite/main/scripts/kde_flatpaks/flatpaks | tr '\n' ' ')"
    ISENGARD_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/noelmiller/isengard/main/flatpaks/isengard_flatpaks | tr '\n' ' ')"
    echo "Installing Bazzite Flatpaks.."
    flatpak --system -y install ${BAZZITE_FLATPAK_LIST}
    echo "Installing Isengard Flatpaks.."
    flatpak --system -y install ${ISENGARD_FLATPAK_LIST}
