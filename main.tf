provider "azurerm" {
  features {}
  subscription_id = "e0be8e24-25e7-4901-ad14-ea389c0f1289"
}

# ---------------- FRONTEND ----------------
resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  resource_group_name = "project-setup-1"
  location            = " UK West "
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "frontend"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_virtual_machine" "frontend" {
  name                  = " frontend "
  location              = " UK West "
  resource_group_name   = " project-setup-1 "
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_B2s"
  
  delete_os_disk_on_termination = true
  
  storage_image_reference {
  id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = " frontend-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = " frontend "
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend"
  zone_name           = " omshiva.shop "
  resource_group_name = " project-setup-1 "
  ttl                 = 3
  records             = azurerm_public_ip.frontend.id
}
# ---------------- END FRONTEND ----------------


# ---------------- MONGODB ----------------
resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "mongodb"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mongodb.id
  }
}

resource "azurerm_virtual_machine" "mongodb" {
  name                  = "mongodb"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "mongodb-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "mongodb"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.mongodb.id
}

# ---------------- END MONGODB ----------------


# ---------------- CATALOGUE ----------------
resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "catalogue"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.catalogue.id
  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                  = "catalogue"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "catalogue-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "catalogue"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.catalogue.id
}

# ---------------- END CATALOGUE ----------------


# ---------------- MYSQL ----------------
resource "azurerm_public_ip" "mysql" {
  name                = "mysql"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "mysql"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "mysql"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mysql.id
  }
}

resource "azurerm_virtual_machine" "mysql" {
  name                  = "mysql"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "mysql-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "mysql"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.mysql.id
}

# ---------------- END MYSQL ----------------


# ---------------- REDIS ----------------
resource "azurerm_public_ip" "redis" {
  name                = "redis"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "redis" {
  name                = "redis"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "redis"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.redis.id
  }
}

resource "azurerm_virtual_machine" "redis" {
  name                  = "redis"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.redis.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "redis-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "redis"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "redis" {
  name                = "redis"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.redis.id
}

# ---------------- END REDIS ----------------


# ---------------- RABBITMQ ----------------
resource "azurerm_public_ip" "rabbitmq" {
  name                = "rabbitmq"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "rabbitmq"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rabbitmq.id
  }
}

resource "azurerm_virtual_machine" "rabbitmq" {
  name                  = "rabbitmq"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "rabbitmq-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "rabbitmq"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "rabbitmq"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.rabbitmq.id
}

# ---------------- END RABBITMQ ----------------


# ---------------- USER ----------------
resource "azurerm_public_ip" "user" {
  name                = "user"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "user"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "user"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.user.id
  }
}

resource "azurerm_virtual_machine" "user" {
  name                  = "user"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "user-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "user"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "user" {
  name                = "user"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.user.id
}

# ---------------- END USER ----------------


# ---------------- CART ----------------
resource "azurerm_public_ip" "cart" {
  name                = "cart"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "cart"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "cart"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cart.id
  }
}

resource "azurerm_virtual_machine" "cart" {
  name                  = "cart"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "cart-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "cart"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "cart" {
  name                = "cart"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.cart.id
}

# ---------------- END CART ----------------


# ---------------- SHIPPING ----------------
resource "azurerm_public_ip" "shipping" {
  name                = "shipping"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "shipping"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "shipping"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.shipping.id
  }
}

resource "azurerm_virtual_machine" "shipping" {
  name                  = "shipping"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "shipping-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "shipping"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.shipping.id
}

# ---------------- END SHIPPING ----------------


# ---------------- PAYMENT ----------------

resource "azurerm_public_ip" "payment" {
  name                = "payment"
  resource_group_name = "project-setup-1"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "payment"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "payment"
    subnet_id                     = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/test/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.payment.id
  }
}

resource "azurerm_virtual_machine" "payment" {
  name                  = "payment"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/e0be8e24-25e7-4901-ad14-ea389c0f1289/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-pratice"
  }

  storage_os_disk {
    name              = "payment-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "payment"
    admin_username = "azuser"
    admin_password = "Dev@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "payment" {
  name                = "payment"
  zone_name           = "omshiva.shop"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = azurerm_network_interface.payment.id
}

# ---------------- END PAYMENT ----------------
