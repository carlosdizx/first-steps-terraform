resource "aws_instance" "chatbot" {
  ami                    = var.details_instances.ami
  instance_type          = var.details_instances.type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = templatefile("scripts/python_script.sh.tpl", {
    open_ai_api_key = var.open_ai_api_key,
    db_server       = var.db_server,
    db_database     = var.db_database,
    db_username     = var.db_username,
    db_password     = var.db_password,
    db_port         = var.db_port,
  })
  user_data_replace_on_change = true
  tags = {
    Name = "Chatbot Instance"
  }
}

