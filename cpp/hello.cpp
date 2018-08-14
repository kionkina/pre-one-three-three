#include <iostream>


int nthfib(int n){
    if (n == 0){
      return 0;
    }
    if (n == 1){
      return 1;
    }
    else {
      return nthfib(n-1) + nthfib(n-2);
    }
  }


int main()
{
  std::string answer;

  while (answer != "no"){
  int input;
  std::cout << "Running nthfib()... \n";
  std::cout << "Enter n: ";
  std::cin >> input;
  int d = nthfib(input);
  std::cout << "\n The " << input << "th term is: "<< d << "\nAnother entry? (yes or no) ";
  std::cin >> answer;
  }
  


}
