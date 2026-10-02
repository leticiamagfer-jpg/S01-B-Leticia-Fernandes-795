#include <iostream>
#include <string>
using namespace std;

class Banda {

public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " subiu ao palco e se apresentou contra " << rival.nome << "!" << endl;
        rival.energia -= static_cast<int>(potenciaSom);
    }

    void exibirStatus() const {
        cout << "Banda: " << nome
             << " | Integrantes: " << integrantes
             << " | Potencia do som: " << potenciaSom
             << " | Energia da plateia: " << energia << endl;
    }
};

int main() {
    
    Banda b1, b2;

    b1.nome = "Os Trovadores";
    b1.integrantes = 4;
    b1.potenciaSom = 30.5f;
    b1.energia = 100;

    b2.nome = "Eletro Rock";
    b2.integrantes = 5;
    b2.potenciaSom = 25.0f;
    b2.energia = 100;

    b1.duelar(b2);

    cout << "\n--- Status apos o duelo ---" << endl;
    b1.exibirStatus();
    b2.exibirStatus();

    return 0;
}
