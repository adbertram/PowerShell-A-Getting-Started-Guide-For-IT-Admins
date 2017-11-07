$a = 5

switch ($a) { 
    1 {"The color is red."} 
    2 {"The color is blue."} 
    3 {"The color is green."} 
    4 {"The color is yellow."} 
    5 {"The color is orange."} 
    6 {"The color is purple."} 
    7 {"The color is pink."}
    8 {"The color is brown."} 
    default {"The color could not be determined."}
}

$a = "d14151"

switch -wildcard ($a) { 
    "a*" {"The color is red."} 
    "b*" {"The color is blue."} 
    "c*" {"The color is green."} 
    "d*" {"The color is yellow."} 
    "e*" {"The color is orange."} 
    "f*" {"The color is purple."} 
    "g*" {"The color is pink."}
    "h*" {"The color is brown."} 
    default {"The color could not be determined."}
}

## Example via http://technet.microsoft.com/en-us/library/ff730937.aspx