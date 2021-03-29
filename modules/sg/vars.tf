variable "vpc_id" {
  type = string
}

variable "ports" {
  type = map(list(string))
  default = {
    "22" = ["0.0.0.0/0"]
    "80" = ["0.0.0.0/0"]
  }
}

