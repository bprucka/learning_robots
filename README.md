# learning_robots

This repo contains code and ideas for VexIQ robotics eduction as well as general experimentation with machine learning concepts for perception and reinforcement learning. 

To teach robotics, the overall paradigm Sense -> Plan -> Act (from traditional robotic control) is used. 

For simplicity, these topics are taught to elementary students in reverse order. Starting with:
1) Act - the physical interaction of a robot with the environment. This includes running motors, making sounds, flashing lights. This step requires building a robot capable of the actions. For VexIQ this is most easily done with the controller. Enabling students to directly move the robot using a video game like controller.

2) Plan - this step requires identifying a set of actions to take to achieve a goal. This concept can be introduced using programming. In VexIQ at the elementary level we use the Vex Code blocks based approach. This gives a graphical view of a program where blocks are connected to chain together actions. For example the robot could be made to move forward 100mm, turn right 90 degrees, and then move forward another 100 mm to push an object into a goal.

3) Sense - this is the embedding of sensors on the robot to enable it to measure the world around it. Sense is separated from the concept of perception, understanding of the senses. For example, at the basic level a camera can sense light at a pixel level to form an image or video. Perception is the process of then performing actions such as object detection to provide information about what is being imaged. 

Putting these steps together - Sense -> Plan -> Act requires sensory perceptions to be combined with an understanding of how actions impact the environment to generate reward. Reinforcement learning is an approach to learn an optimal plan given the opportunity to experiement with the world. For VexIQ this higher level understanding of how to act to maximize goals is provided by the student directly using their understanding of the game and it's dynamics.

This repo will develop these concepts through illustrative examples with the goal of expanding interest and understanding of robotics, engineering, computer science, and machine learning in students.

