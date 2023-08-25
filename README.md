1. Firstly, use any editor to create your .sh file and paste the given script inside that .sh file.
    For Example: we can use the vim editor as follows: <br>
    
            vim wordpress_script.sh

    Press “i” to shift to inset mode and enable typing or pasting the given script. <br>
    
            Press esc: wq or esc: wq! (forcefully) 
    
    to update the changes and save the file.<br>


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

3. Now to execute our script.<br>
   Run the command: “./script name” <br>
   In our case, the command will be: <br> 
   
            ./wordpress_script.sh

4. Once all the resources/ services have been configured, use the command as follows: <br>

    4.1.  To create a WordPress site: <br>
          use command as: "./script_name.sh create site_name" <br>
          In our case, the command will be 
          
            ./wordpress_script.sh create site1

      {Here site1 is the name of our website}
  
    4.2.  Once the above command is successfully executed, we can access our website using the link provided or by using <br>       
    
            public_ip_of_ec2:80 or localhost:80

    4.3   To disable our website for some point of time. <br>
          Use command as  <br>
          “./script_name manage site_name disable” <br>
          In our case, the command will be 
          
                  ./wordpress_script.sh manage site1 disable

      {After the execution of the above command the site will be disabled, i.e. the site will not be accessible".

    4.5.  To enable the website. <br>
          Use the command “./script_name manage site_name enable” <br>
          In our case, the command will be 
          
            ./wordpress_script.sh manage site1 enable

      {After the execution of the above command the site will be successfully enabled} <br>
          The website will be accessible again using the same_ip: 80

    4.5.To delete the website <br>
          Use the command “./script_name delete site_name” <br>
          In our case, the command will be 
          
            ./wordpress_script.sh delete site1.

      {After the execution of the above command, our site will be successfully deleted, all the containers created.   
          (WordPress, MySQL) will be deleted and ports mapped will be released}.

         
