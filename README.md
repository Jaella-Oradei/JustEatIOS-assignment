# JustEatIOS-assignment
A swift-based console application that gets restaurant data from a provided API (https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/{postcode}) and outputs(displays) the first 10 restaurants based on a give postcode. For each restaurant it finds, the application outputs the restaurant name along with 3 key attributes (cuisine type, rating and address).

#Assessment criteria outline:
    > The Problem:
    - We are looking for you to find restaurant data and return this in an interface of your choice. Using the API provided you will need to send a postcode to return a set of data, you’ll need to filter this data to focus just on the restaurant data. You will notice that a lot of data is returned in the ‘restaurant object’ (and in the whole response!), we’re only interested in the following pieces of data being returned:
            > Name
            > Cuisines
            > Rating - as a number
            > Address

    > The Brief: 
    - We would like you to display these four data points in any way of your choosing, this could be: a console application, or anything you like. Regardless of interface we’d like you to limit your shown data to the first 10 restaurants returned, we’re more interested in how you display each one rather than a huge list of data. Please upload your completed solution to Github (bonus points if we can see git history!). Please note there is no time limit to this, however we do require completion of the following assessment criteria.
    
    > Assignment Criteria: 
        - All four restaurant data points are displayed in your interface (name, cuisines,
            rating-as a number and address)
        - All interface types will be assessed the same, please focus on displaying the
            data
        - Add how to build, compile and run your solution into the README
        - Include any assumptions or things that were not clear to you in the README
        - Include any improvements you’d make to your solution in the README
        - Please ensure you use SWIFT to complete this task as we are keen to assess your
            current abilities in this language.
        



# How to run:
    > Make sure you have the latest version of swift installed 
    > Clone the repository at: 
        > git clone https://github.com/Jaella-Oradei/JustEatIOS-assignment.git
        
    > Running the program:
    > Compile all the files:
        > swiftc *.swift > ./main.swift
    > The restaurant finder program should run and output
    
    
# When done running:
    - close program at: 
        > control key with letter c
            > if the system stops working or gives an error message and run again.
    - When you have chosen to stop searching for restaurants with different postcodes, close terminal by pressing:
        > control key with letter c
        
        
# More information: 
    > Please when you open the .txt file, make sure you open it fully or half of your screen for the best view of the file.
    > console is a view of what the .txt file is going to look like.

#Assumptions:
    1. An assumptiong I had was regarding the displaying of the information. Readability was prioritiesed to ensure that the displayed restaurant information is udnerstood by the reader. Splitting it into self containers and having each restaurant information named allows the user to understand which restaurant information they are reading as well as knowing exactly what is going on at each stage of the program.
    
    2. Emojies are used to add more design and beauty to the program. 
        ❌: For when something was supposed to happen like writing to .txt file but it didnt happen and explain what didnt happen. used to make sure user can undertsand and recognise type of error being presented and allows for familiarity of the functionality of the program.
        
        🚫: Used for when there is an error of type NSERROR. 
        
        ❔: For when the user is being asked a question that requires for them to enter a value like postcode they wish to search restaurants by.
    
    3. I assumed that I could develop on the initial requirement while still doing what is asked of me. Prompting the user to enter their desired postcode and asking users when they want to end running the program or not.


# What I would add:
    1. If the restaurants could be more than just 10, It would have made sense that the restaurants be printed based on rating. So I would add a mode if the users wanted it be printed out based on rating ranking or in alphabetical order.

    2. I would have also added that the text files of the restaurant lists be opened at specific size. 

    3. I would also add the the outputs were filtered in only returning restaurants with the fist part of postcode and then filtering out to other postcodes so the results will be based on proximity but this is only possible with more retured restaurants.




