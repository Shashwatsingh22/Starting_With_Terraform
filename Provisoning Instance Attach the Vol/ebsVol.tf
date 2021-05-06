//We will use another profile for the Credential part !

provider "aws" {

    region = "ap-south-1"
    profile = "default"

}

// Step 1. Launch the Instance

resource "aws_instance" "instance"{

    ami= "ami-010aff33ed5991201"
    instance_type = "t2.micro"

    tags = {

        Name = "ForTestingAttachVol"

    }
}

// Lets Try to fetch the AZ and ID

output "instanceVal1"{

    value = "Instance is Launcher -> ${aws_instance.instance.availability_zone}"

}

output "instanceVal2"{

    value = "ID of the Instance -> ${aws_instance.instance.id}"

}

// Step 2: Launch the Vol

resource "aws_ebs_volume" "volume" {

// Here , We need to give same AZ as the INstance Have.
    availability_zone = aws_instance.instance.availability_zone

// Size IN GiB
    size = 10

    tags = {

        Name = "terraformTesting"
    }    
}

// Lets Try To Print the AZ of volume and ID

output "volumeVal1" {

    value = "AZ of volume -> ${aws_ebs_volume.volume.availability_zone}"
    
}

output "volumeVal2" {

    value = "ID of Volume -> ${aws_ebs_volume.volume.id}"

}

// Step 3 Lets finally Attache the Volume

resource "aws_volume_attachment" "ebsAttach" {

    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.volume.id
    instance_id = aws_instance.instance.id

}

output "Done" {

    value = "Finaly Done !!"
}