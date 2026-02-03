# # Explanation: gru Station is the spoke.
# resource "aws_ec2_transit_gateway" "gru_tgw01" {
#   description = "gru-tgw01 (Tokyo hub)"
#   tags        = { Name = "gru-tgw01" }
# }

# # Explanation: gru connects to the Brazil VPC.
# resource "aws_ec2_transit_gateway_vpc_attachment" "gru_attach_brazil_vpc01" {
#   transit_gateway_id = aws_ec2_transit_gateway.gru_tgw01.id
#   vpc_id             = aws_vpc.gru_vpc01.id
#   subnet_ids         = aws_subnet.gru_private_subnets[*].id
#   tags               = { Name = "gru-attach-brazil-vpc01" }
# }



# # Explanation: gru opens a corridor request to gru—compute may travel, data may not.
# resource "aws_ec2_transit_gateway_peering_attachment" "gru_to_gru_peer01" {
#   transit_gateway_id      = aws_ec2_transit_gateway.gru_tgw01.id
#   peer_region             = "sa-east-1"
#   peer_transit_gateway_id = data.terraform_remote_state.gru.outputs.gru_tgw01.id
#   tags = { Name = "gru-to-gru-peer01" }
# }

# output "gru_tgw_attachment" {
#   value = aws_ec2_transit_gateway_peering_attachment.gru_to_gru_peer01.id
# }