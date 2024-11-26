resource "aws_vpc" "squad6vpc"{
	cidr_block="10.180.0.0/24"
	
    tags {
	name = "squad6vpc"
	    }
	}
	
resource "aws_subnet" "priv1-squad6" {
	vpc_id = aws_vpc.squad6vpc.id
	cidr_block = "10.180.2.0/24"
	availability_zone = "vars.ZONE1"
}

resource "aws_subnet" "priv2-squad6" {
	vpc_id = aws_vpc.squad6vpc.id
	cidr_block = "10.180.3.0/24"
	availability_zone = "vars.ZONE2"
}

resource "aws_subnet" "pub-squad6" {
	vpc_id = aws_vpc.squad6vpc.id
	cidr_block = "10.180.0.0/24"
	availability_zone = "vars.ZONE1"
}

resource "aws_internet_gateway" "squad6-ig" {
	vpc_id = aws_vpc.squad6vpc.id
	}
	
resource "aws_route_table" "squad6-rt" {
	vpc_id=vpc_id.squad6vpc.id
	
	route {
	cidr_block = 10.180.2.0/24
	gateway_id = aws_internet_gateway
	}
}

resource "aws_route_table" "squad6-rt" {
	vpc_id=vpc_id.squad6vpc.id
	
	route {
	cidr_block = 10.180.3.0/24
	gateway_id = aws_internet_gateway.squad6-rt
	}
}

resource "aws_route_table" "squad6-rt" {
	vpc_id=vpc_id.squad6vpc.id
	
	route {
	cidr_block = 10.180.0.0/24
	gateway_id = aws_internet_gateway.squad6-rt
	}
}

resource "aws_route_table_association" "squad6-rta"{
subnet_id = aws_subnet.priv1
route_table_id = aws_route_table.squad6-rt
}

