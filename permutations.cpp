#include <iostream>
#include <string>

void show_permutations( std::string base, std::string letters ) {
  unsigned int i;
  if( base.size( ) >= 3 ) {
    std::cout << base << std::endl;
  }
  for( i = 0; i < letters.size( ); i++ ) {
    show_permutations( base + letters.substr( i, 1 ),
                       letters.substr( 0, i ) + letters.substr( i+1 ) );
  }

}

int main( int argc, char **argv ) {

  if( argc < 2 ) {
    std::cerr << "usage: " << argv[ 0 ] << " letters" << std::endl;
    return 1;
  }

  std::string letters = argv[ 1 ];
  std::string base = "";
  
  show_permutations( base, letters );
  return 0;
}
