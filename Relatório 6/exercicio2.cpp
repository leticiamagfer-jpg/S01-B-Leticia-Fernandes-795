#include <iostream>
#include <string>
using namespace std;

class LinkSocial {
    
private:
    string nome;
    string arcana;
    int rank;

public:

    string getNome() const { return nome; }
    string getArcana() const { return arcana; }
    int getRank() const { return rank; }

    void setNome(const string &n) { nome = n; }
    void setArcana(const string &a) { arcana = a; }
    void setRank(int r) { rank = r; }

    void subirRank() {
        rank++;
    }
};

int main() {

    LinkSocial link;

    link.setNome("Yukari Takeba");
    link.setArcana("Lovers");
    link.setRank(1);

    link.subirRank();

    cout << "Personagem: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}
