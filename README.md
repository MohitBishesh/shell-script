1. Firstly, use any editor to create your .sh file and paste the given script inside that .sh file.
    For Example: we can use the vim editor as follows: <br>
    
            vim wordpress_script.sh
 
    Press “i” to shift to inset mode and enable typing or pasting the given script. <br>
    
            Press esc: wq or esc: wq! (forcefully) 

   <img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/c19790a3-e899-4cd5-8f19-6166e0a79429">


    to update the changes and save the file.<br>

<br>
    You can also use the nano editor as follows: <br>
    
        nano wordpress_script.sh (press Enter)

Start typing to paste the given script

        Press “ctrl + x” 
to save the changes. <br>

Hit enter over the "yes" button on the screen to save and exit.

2.  Now we need to provide the executable permission to our script file. <br>
    Command: 
    
            chmod +x wordpress_script.sh (press enter) 
    We will also observe that the color of our file name will change from white to green (executable file).
    <br>
<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/2e646905-afb8-4412-b553-7af55813cc6f">
<br>
<br>


3. Now to execute our script.<br>
   Run the command: “./script name” <br>
   In our case, the command will be: <br> 
   
            ./wordpress_script.sh
    
    
<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/5187a305-c81d-4236-9fa7-cf4143567e91">
<br>
<br>

<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/f1c21ac3-5e74-41b6-9f49-ffa4bc000d7d">
<br>
<br>
4. Once all the resources/ services have been configured, use the command as follows: <br>

4.1. To create a WordPress site:  <br>
        use command as: "./script_name.sh create site_name" <br>
        In our case, the command will be 
          
             ./wordpress_script.sh create site1

{Here site1 is the name of our website}

<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/976b7bb0-b52e-410a-a486-b6cac8e9df2a">
<br>
<br>
<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/15dd5cd0-a755-4aab-a559-9cbab14ab227">


<br>
<br>
<br>
4.2.  Once the above command is successfully executed, we can access our website using the link provided or by using public_ip_of_ec2:80 or localhost:80

<br>
<img width="863" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/321bd004-e834-40af-a585-7e39b19b041e">
<br>
<br>
<img width="747" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/d1bb51d5-4793-45c1-b478-3215cb0ef7ef">
<br>
<br>
<img width="478" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/52f31e57-8df2-4fef-8046-8f8c0b23ce8d">
<br>
<br>
<img width="655" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/2c9ab0bc-43ee-4bfe-954f-4c932c2c36ab">
<br>
<br>
<img width="949" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/03aba1b4-28e3-42f4-82c5-fac5891738d5">
<br>
<br>

<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/971e1480-552b-47cc-aa8e-4bcb841a4a27">
<br>
<br>
<br>
4.3   To disable our website for some point of time. <br>
          Use command as  <br>
          “./script_name manage site_name disable” <br>
          In our case, the command will be 
          
                  ./wordpress_script.sh manage site1 disable

<br>
<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/cb9271af-b1cd-4171-ad05-917d20dc26fa">
<br>
<br>
<br>
{After the execution of the above command the site will be disabled, i.e. the site will not be accessible".


<img width="889" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/12322d1b-c8d6-460d-b1a0-b2a9a3a61a72">


<br>
<br>
<br>
4.4.  To enable the website. <br>
          Use the command “./script_name manage site_name enable” <br>
          In our case, the command will be 
          
            ./wordpress_script.sh manage site1 enable

<br>


<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/8f6c1aa1-acaf-41c7-88d5-9684cd2da928">



{After the execution of the above command the site will be successfully enabled} <br>
          The website will be accessible again using the same_ip: 80

<br>
<img width="863" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/321bd004-e834-40af-a585-7e39b19b041e">
<br>
<br>
<br>
4.5.To delete the website <br>
          Use the command “./script_name delete site_name” <br>
          In our case, the command will be 
          
            ./wordpress_script.sh delete site1.

<img width="960" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/a9f748e4-8329-4c3a-a42a-eae8d3baf0a9">
<br>
{After the execution of the above command, our site will be successfully deleted, all the containers created.   
          (WordPress, MySQL) will be deleted and ports mapped will be released}.
<br>
<img width="877" alt="image" src="https://github.com/MohitBishesh/shell-script/assets/74617917/c6a9e441-aad4-42ca-8795-46e9c240d240">

