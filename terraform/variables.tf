variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "postgres_username" {
  description = "Username for the PostgreSQL server"
  type        = string
}

variable "postgres_password" {
  description = "Password for the PostgreSQL server"
  type        = string
}