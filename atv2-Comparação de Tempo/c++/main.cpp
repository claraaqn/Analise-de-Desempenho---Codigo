#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

// Estrutura do nó da lista ligada
struct Node {
    int valor;
    Node* proximo;

    Node(int valor) {
        this->valor = valor;
        this->proximo = nullptr;
    }
};

// Classe da lista ligada
class ListaLigada {
private:
    Node* cabeca;

public:
    ListaLigada() {
        cabeca = nullptr;
    }

    ~ListaLigada() {
        while (cabeca != nullptr) {
            Node* temp = cabeca;
            cabeca = cabeca->proximo;
            delete temp;
        }
    }

    bool buscaElemento(int valor) {
        Node* atual = cabeca;
        while (atual != nullptr) {
            if (atual->valor == valor) {
                return true;
            }
            atual = atual->proximo;
        }
        return false;
    }

    int minimo() {
        if (cabeca == nullptr) {
            throw runtime_error("Lista está vazia.");
        }
        int menor = cabeca->valor;
        Node* atual = cabeca;
        while (atual != nullptr) {
            if (atual->valor < menor) {
                menor = atual->valor;
            }
            atual = atual->proximo;
        }
        return menor;
    }

    int maximo() {
        if (cabeca == nullptr) {
            throw runtime_error("Lista está vazia.");
        }
        int maior = cabeca->valor;
        Node* atual = cabeca;
        while (atual != nullptr) {
            if (atual->valor > maior) {
                maior = atual->valor;
            }
            atual = atual->proximo;
        }
        return maior;
    }

    void insereElemento(int valor) {
        insereFim(valor);
    }

    void insereElementoPosicao(int valor, int posicao) {
        Node* novo = new Node(valor);
        if (posicao == 0) {
            insereInicio(valor);
            return;
        }

        Node* atual = cabeca;
        int count = 0;
        while (atual != nullptr && count < posicao - 1) {
            atual = atual->proximo;
            count++;
        }

        if (atual == nullptr) {
            throw out_of_range("Posição fora do alcance.");
        }

        novo->proximo = atual->proximo;
        atual->proximo = novo;
    }

    void insereInicio(int valor) {
        Node* novo = new Node(valor);
        novo->proximo = cabeca;
        cabeca = novo;
    }

    void insereFim(int valor) {
        Node* novo = new Node(valor);
        if (cabeca == nullptr) {
            cabeca = novo;
        } else {
            Node* atual = cabeca;
            while (atual->proximo != nullptr) {
                atual = atual->proximo;
            }
            atual->proximo = novo;
        }
    }

    void remove(int valor) {
        Node* atual = cabeca;
        Node* anterior = nullptr;

        while (atual != nullptr) {
            if (atual->valor == valor) {
                if (anterior == nullptr) {
                    cabeca = atual->proximo;
                } else {
                    anterior->proximo = atual->proximo;
                }
                delete atual;
                return;
            }
            anterior = atual;
            atual = atual->proximo;
        }

        throw runtime_error("Elemento não encontrado.");
    }

    void imprimeLista() {
        Node* atual = cabeca;
        cout << "[";
        while (atual != nullptr) {
            cout << atual->valor;
            if (atual->proximo != nullptr) {
                cout << ", ";
            }
            atual = atual->proximo;
        }
        cout << "]" << endl;
    }
};

// Função principal
int main() {
    ListaLigada lista;

    try {
        ifstream arquivo("C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv2\\arq_novo.txt");
        if (!arquivo.is_open()) {
            throw runtime_error("Não foi possível abrir o arquivo.");
        }

        string linha;
        int contagemLinhas = 0;

        while (getline(arquivo, linha)) {
            if (linha.empty()) {
                continue;
            }

            contagemLinhas++;

            if (contagemLinhas == 1) {
                stringstream ss(linha);
                int valor;
                while (ss >> valor) {
                    lista.insereElemento(valor);
                }
            } else if (contagemLinhas > 2) {
                stringstream ss(linha);
                char acao;
                ss >> acao;

                switch (acao) {
                    case 'P': {
                        cout << "Lista atual: ";
                        lista.imprimeLista();
                        break;
                    }
                    case 'A': {
                        int numero, posicao;
                        ss >> numero >> posicao;
                        lista.insereElementoPosicao(numero, posicao);
                        break;
                    }
                    case 'R': {
                        int numero;
                        ss >> numero;
                        lista.remove(numero);
                        break;
                    }
                    default:
                        cout << "Ação inválida!" << endl;
                        break;
                }
            }
        }

        arquivo.close();
    } catch (const exception& e) {
        cerr << "Erro: " << e.what() << endl;
    }

    return 0;
}
