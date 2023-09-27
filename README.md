# datasci_4_web_viz

## Shiny R
https://yku5ir-amna-syed.shinyapps.io/project/

An error I encountered was I had forgotten to add the rsconnect package when trying to deploy. I then utilized the command `install.packages('rsconnect')` and `library(rsconnect)` in the console. The deployment process for Shiny R went much more soother than the deployment process for Python's Shiny as I was already acquainted with the shinyapps.io platform. 
## Python's Shiny
https://yku5ir-amna-syed.shinyapps.io/your-app-name/

I encountered a few challenges while working with python's shiny. The first problem occured when I went to change values to anything other than "binge", I had first tried presenting the "smoking" values under measures within the dataset, but everytime I went to preview the app through cloudshell, the bar graph was empty, and it did not let me use the drop-down menu to select a county. As seen in the screenshot below, I also tried using the "asthma" measure and it presented the same issue. 
![image](https://github.com/amnasyed1/datasci_4_web_viz/assets/123895397/d5f2fa76-9219-4d64-b01e-f9bc8eb19304)
I also encountered some port issues, as seen by the screenshot below. I was able to troubleshoot and play around with the ports and was able to make it on port 8000, and by utilizing the "binge" code. 
![image](https://github.com/amnasyed1/datasci_4_web_viz/assets/123895397/0e2fa526-a00b-4a8a-88da-64e023851935)
After that, when trying to deploy the Shiny app, I kept getting error codes on cloudshell when configuring rsconnect-python, for instance it was not adding my account information and had trouble reading the `rsconnect deploy shiny /path/to/app --name <NAME> --title my-app` command. I followed the instructions on the Posit documentation; however, I still had to try several different ways until it finally worked and accepted my account details, and the path from cloudshell. I was able to obtain the path in cloudshell by right-clicking the app.py file under the python_shiny folder, and then clicking "copy path", and inputting that into where it said path in the command above. 

## Flask

An image of the Flask app running with Matplotlib Visualization:
![image](https://github.com/amnasyed1/datasci_4_web_viz/assets/123895397/ff292e0d-7007-4ef2-811e-8fd6d20e4e7d)

I did not encounter any challenges with the flask app and deployment. I think having previous experience working with flask applications was certainly helpful when working on this part of assignment. 

