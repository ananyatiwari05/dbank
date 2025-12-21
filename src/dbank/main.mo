import Debug "mo:base/Debug";  //importing the debug module

//creating a canister
actor DBank {  //class in motoko lang is called actor
  var currentValue = 300;
  currentValue := 100;

  let id = 2622211906;  //creating constant value
  Debug.print("heyooo"); //expects only text
  Debug.print(debug_show(currentValue));  //function to convert to text before printing 
  Debug.print(debug_show(id));
}

//deploying canister -> dfx start -> dfx deploy