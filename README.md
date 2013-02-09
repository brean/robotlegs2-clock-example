# RobotLegs 2 clock example
========================

This simple example just shows the current time at a Label after you clicked on a Button. 

Just run the index.html in your browser to see it for yourself.
It makes use of all parts from the MVCS software architecture. 
Take a look at the robotlegs class diagram ( http://www.robotlegs.org/diagram/ ), you can find every step of the diagram in this project.

+ The Model class (ClockModel) stores the data (the current time) and lets everyone who is listening know if it has been updated.
+ The button that you can click and the label that shows the time are defined in a mediated View. 
+ Once you click on the button a new Event is dispatched from the view that executes the Command (Controller).
+ The Command only starts the Service that updates the model every second.

This Project is build with RobotLegs Version 2.0.0b4 and will be updated once Robotlegs 2 is final.
Feel free to contact me if you have any questions!
