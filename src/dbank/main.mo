import Debug "mo:base/Debug";  //importing the debug module

//creating a canister
actor DBank {  //class in motoko lang is called actor
  var currentValue = 300;
  currentValue := 100;

  let id = 2622211906;  //creating constant value
  //Debug.print("heyooo"); //expects only text
  //Debug.print(debug_show(currentValue));  //function to convert to text before printing 
  //Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  };
  
}

//func call by command line -> dfx canister call dbank func_name <'(attributes)'>
//deploying canister -> dfx start -> dfx deploy
//canister ui linkage -> dfx canister id __Candid_UI
//url : http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai
//counter canister id -> dfx canister id canister_name (dbank here)