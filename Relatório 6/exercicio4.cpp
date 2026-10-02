#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Hobbit {

protected:
    string nome;

public:

    Hobbit(const string &n) : nome(n) {}

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }

    virtual ~Hobbit() {}
};

class Jardineiro : public Hobbit {

public:
    Jardineiro(const string &n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {

public:
    Cozinheiro(const string &n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {

public:
    Fazendeiro(const string &n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " esta colhendo vegetais e hortalicas em suas terras!" << endl;
    }
};

int main() {
    
    vector<Hobbit*> hobbits;

    hobbits.push_back(new Jardineiro("Sam"));
    hobbits.push_back(new Cozinheiro("Rosie"));
    hobbits.push_back(new Fazendeiro("Maggot"));

    for (Hobbit *h : hobbits) {
        h->fazerAtividade();
    }

    for (Hobbit *h : hobbits) {
        delete h;
    }
    hobbits.clear();

    return 0;
}
