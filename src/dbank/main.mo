import Debug "mo:base/Debug"; 
import Time "mo:base/Time";
import Float "mo:base/Float";

//creating a canister
actor DBank {

  stable var currentValue : Float = 300; 
  //currentValue := 100;

  stable var startTime = Time.now();

  let id = 2622211906; 

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let temp : Float = currentValue - amount;
    if (temp >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    }else{
      Debug.print("balance is less to reduce the input amount")
    }
  };

  public query func checkBalance() : async Float{
    return currentValue;
  };

  public func compund(){
    //calculating the nono seconds elapsed to compute the interest
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;

    //compound interest per sec rate of 1%-> amt = p(1+0.01)^numsec
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

    startTime := currentTime;
  };
};

//func call by command line -> dfx canister call dbank func_name <'(attributes)'>
//deploying canister -> dfx start -> dfx deploy
//canister ui linkage -> dfx canister id __Candid_UI
//url : http://127.0.0.1:8000/?canisterId=r7inp-6aaaa-aaaaa-aaabq-cai
//counter canister id -> dfx canister id canister_name (dbank here)
