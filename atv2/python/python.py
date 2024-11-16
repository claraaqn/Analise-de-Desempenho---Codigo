class Node:
    def __init__(self, valor):
        self.valor = valor
        self.proximo = None

    def get_valor(self):
        return self.valor

    def get_proximo(self):
        return self.proximo

    def set_proximo(self, proximo):
        self.proximo = proximo


class ListaLigada:
    def __init__(self):
        self.cabeca = None

    def busca_elemento(self, valor):
        atual = self.cabeca
        while atual is not None:
            if atual.get_valor() == valor:
                return True
            atual = atual.get_proximo()
        return False

    def busca_indice(self, indice):
        atual = self.cabeca
        count = 0
        while atual is not None:
            if count == indice:
                return atual.get_valor()
            count += 1
            atual = atual.get_proximo()
        raise IndexError("Índice fora do alcance.")

    def minimo(self):
        if self.cabeca is None:
            raise ValueError("Lista está vazia.")
        atual = self.cabeca
        menor = atual.get_valor()
        while atual is not None:
            if atual.get_valor() < menor:
                menor = atual.get_valor()
            atual = atual.get_proximo()
        return menor

    def maximo(self):
        if self.cabeca is None:
            raise ValueError("Lista está vazia.")
        atual = self.cabeca
        maior = atual.get_valor()
        while atual is not None:
            if atual.get_valor() > maior:
                maior = atual.get_valor()
            atual = atual.get_proximo()
        return maior

    def predecessor(self, valor):
        atual = self.cabeca
        anterior = None
        while atual is not None:
            if atual.get_valor() == valor:
                if anterior is None:
                    raise ValueError("O elemento não possui predecessor.")
                return anterior.get_valor()
            anterior = atual
            atual = atual.get_proximo()
        raise ValueError("Elemento não encontrado.")

    def sucessor(self, valor):
        atual = self.cabeca
        while atual is not None:
            if atual.get_valor() == valor:
                if atual.get_proximo() is None:
                    raise ValueError("O elemento não possui sucessor.")
                return atual.get_proximo().get_valor()
            atual = atual.get_proximo()
        raise ValueError("Elemento não encontrado.")

    def insere_elemento(self, valor):
        self.insere_fim(valor)

    def insere_elemento_posicao(self, valor, posicao):
        novo = Node(valor)
        if posicao == 0:
            self.insere_inicio(valor)
            return
        atual = self.cabeca
        count = 0
        while atual is not None:
            if count == posicao - 1:
                novo.set_proximo(atual.get_proximo())
                atual.set_proximo(novo)
                return
            count += 1
            atual = atual.get_proximo()
        raise IndexError("Posição fora do alcance.")

    def insere_inicio(self, valor):
        novo = Node(valor)
        novo.set_proximo(self.cabeca)
        self.cabeca = novo

    def insere_fim(self, valor):
        novo = Node(valor)
        if self.cabeca is None:
            self.cabeca = novo
        else:
            atual = self.cabeca
            while atual.get_proximo() is not None:
                atual = atual.get_proximo()
            atual.set_proximo(novo)

    def remove(self, valor):
        atual = self.cabeca
        anterior = None
        while atual is not None:
            if atual.get_valor() == valor:
                if anterior is None:
                    self.cabeca = atual.get_proximo()
                else:
                    anterior.set_proximo(atual.get_proximo())
                return
            anterior = atual
            atual = atual.get_proximo()
        raise ValueError("Elemento não encontrado.")

    def remove_indice(self, indice):
        atual = self.cabeca
        anterior = None
        count = 0
        while atual is not None:
            if count == indice:
                if anterior is None:
                    self.cabeca = atual.get_proximo()
                else:
                    anterior.set_proximo(atual.get_proximo())
                return
            anterior = atual
            atual = atual.get_proximo()
            count += 1
        raise IndexError("Índice fora do alcance.")

    def remove_inicio(self):
        if self.cabeca is not None:
            self.cabeca = self.cabeca.get_proximo()

    def remove_fim(self):
        if self.cabeca is None:
            return
        if self.cabeca.get_proximo() is None:
            self.cabeca = None
            return
        atual = self.cabeca
        anterior = None
        while atual.get_proximo() is not None:
            anterior = atual
            atual = atual.get_proximo()
        if anterior is not None:
            anterior.set_proximo(None)

    def __str__(self):
        valores = []
        atual = self.cabeca
        while atual is not None:
            valores.append(str(atual.get_valor()))
            atual = atual.get_proximo()
        return "[" + ", ".join(valores) + "]"


def main():
    lista = ListaLigada()
    try:
        with open("C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv2\\arq_novo.txt", "r") as arquivo:
            linhas = arquivo.readlines()
            for i, linha in enumerate(linhas):
                if linha.strip() == "":
                    continue
                if i == 0:
                    valores = map(int, linha.split())
                    for valor in valores:
                        lista.insere_elemento(valor)
                elif i > 1:
                    partes = linha.split()
                    acao = partes[0]
                    if acao == "P":
                        print("Lista atual:", lista)
                    elif acao == "A":
                        numero = int(partes[1])
                        posicao = int(partes[2])
                        lista.insere_elemento_posicao(numero, posicao)
                    elif acao == "R":
                        numero = int(partes[1])
                        lista.remove(numero)
    except Exception as e:
        print("Erro:", e)


if __name__ == "__main__":
    main()
