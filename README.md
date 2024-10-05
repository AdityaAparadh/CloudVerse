# CloudVerse Hands-On Guide 

## EC2 

We are going to host a single static website, with our EC2 instance.

To create an instance

1. Search for EC2 on the main console, to go to **EC2 Dashboard**
2. Click on **Launch Instance**
3. Set the name for your server. For you to be able to easily find your own instance, name it starting with your own name.

4. For Amazon Machine Image, select **Ubuntu**

5. Keep the architecture as **64-bit(x86)**

6. Set the instance type as **t2.micro**. Make sure you see `free tier eligible` next to it.

7. For key pair, **Create new key pair**. Again, name the key pair with your own name. Keep everything as default i.e. **RSA** and **.pem** and create

8. Make sure you remember the folder i.e. directory in which you downloaded you private key.

9. In Network Settings click **Select existing security group**, 
then select default

10. For storage, keep it as default i.e. **8 GiB** and **gp3**

11. In summary, make sure number of instances is 1, then click on Launch Instance.

12. Now in the sidebar, scroll down and go to Security Groups, and press **Create security group**

13. Add name and description, again name should start with your own name.

14. Under **Inbound rules**, click on **Add Rule** , then select type **SSH** and source as **Anywhere IPv4**

15. Under **Inbound rules**, click on **Add Rule** , then select type **HTTP** and source as **Anywhere IPv4**

> ⚠️ Make sure you do not modify the **Outbound rules**
> It should be enabled for All traffic on all protocols and all ports by default

16. Now go to EC2 Dashboard, and click on your EC2 ID to open your Instance summary.

17. Under Actions -> Security -> Change Security Groups

18. Select your security group ( with your name), then press **Add security group**

19. Optionally you can remove the default security group

20. Click Save, then go back to Instance Summary.

21. Click on **Connect**, then go to **SSH Client** tab.

22. For **Linux** users, `cd` into the directory where your key is and then run :
```
chmod 400 "<keyname>.pem"
```
This step is not required for Windows users.

23. Windows users should use **Powershell**, while Linux users can use their own terminal and shell.
24. `cd` into the directory where your key was downloaded. Then run the command given below **Example:** on EC2 dashboard.

For eg.
```
ssh -i "sait.pem" ubuntu@ec2-11-117-211-41.ap-south-1.compute.amazonaws.com
```

When it asks you to add fingerprint, type `yes` and press enter.

25. You should now be placed into your VM's shell, and should see `Welome to Ubuntu` text.
Copy the commands below and execute them in the VM's shell.

```
sudo apt update
sudo apt install curl
curl -fsSL https://techfusion24.s3.ap-south-1.amazonaws.com/script.sh | bash
```

This will install an Nginx server with a sample html file on your EC2 instance.

26. Go to your Instance summary, then copy your **Public IPv4** address, and paste them in any browser. You should see your website now hosted.

> You might need to append `http://` to your IP. Then my full address would become `http://<my public IP>`




---

## S3 Bucket Policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::satejbucket/*"
        }
    ]
}
```