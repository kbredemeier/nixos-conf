{ config, pkgs, ... }:
{
  # Ensure the users on the system match the set in `users.users`.
  users.mutableUsers = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mindtree = {
    isNormalUser = true;
    home = "/home/mindtree";
    description = "mindtree";
    hashedPassword = "$6$mindtree$VYHsIVYocBAFdtWXiZLX2snVDqBGjv9mbJylf5RDMjm3cTALnk1hMyMsdmYET8FzffBlcyqOA.BoqEYFdmjum.";
    openssh.authorizedKeys.keys = [];
    extraGroups = [
      "wheel"
      "networkmanager"
      "plugdev"
      "vboxusers"
      "jackaudio"
      "wireshark"
      # "storage"
      # "power"
    ];
  };
}
