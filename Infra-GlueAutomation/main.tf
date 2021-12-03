provider "aws" {
    region = "ap-southeast-1"
}


resource "aws_glue_catalog_database" "dms_glue_catalog_database" {
  name = "${var.glue_database}"
  
}

resource "time_sleep" "wait_15_seconds" {
  depends_on = [aws_glue_catalog_database.dms_glue_catalog_database]

  create_duration = "15s"
}
resource "aws_glue_connection" "dms_glue_connection" {
  connection_properties = {
    JDBC_CONNECTION_URL = "xxx/${var.glue_database}"
    PASSWORD            = var.password_rds_account
    USERNAME            = var.username_rds_account
  }

  name = "${var.glue_database}_conn"

  physical_connection_requirements {
    availability_zone      = "ap-southeast-1a"
    security_group_id_list = ["xxx"]
    subnet_id              = "xxx"
  }
}

resource "aws_lakeformation_permissions" "dms_lakeformation_permission" {
  depends_on = [time_sleep.wait_15_seconds]
  principal        = "xxx"
  permissions = ["ALL"]

  database {
    name       = aws_glue_catalog_database.dms_glue_catalog_database.name
  }
}


resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_lakeformation_permissions.dms_lakeformation_permission]

  create_duration = "30s"
}

resource "aws_glue_crawler" "dms_glue_crawler" {
  depends_on = [time_sleep.wait_30_seconds]
  database_name = "${var.glue_database}"
  name          = "${var.glue_database}_crawler"
  role          = "xxx"

  jdbc_target {
    connection_name = "${var.glue_database}_conn"
    path            = "${var.glue_database}/xxx"
  }
}
