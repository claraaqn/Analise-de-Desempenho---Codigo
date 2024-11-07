package linked;


public class ListaLigada{

    private No cabeca;

    public ListaLigada() {
        cabeca = null;
    }

    public boolean buscaElemento(int valor) {
        No n = new No(valor);
        n = this.cabeca;
        while (true) {
            if(n != null) {
                if (n.getValor() == valor){
                    return true;
                } else {
                    n = n.getProximo();
                }
            }
            else {
                break;
            }
        }
        return false;
    }

    public int buscaIndice(int valor) {
        No n = new No(valor);
        n = this.cabeca;
        int count = 0;
        while (true) {
            if (n != null) {
                if(valor == count){
                    return n.getValor();
                } else {
                    n = n.getProximo();
                }
                count += 1;
            }
        }
    }

    public int minimo() {
        No n = this.cabeca;
        int menor = n.getValor();
        while (n.getProximo() != null){
            n = n.getProximo();
            if (menor > n.getValor()) {
                menor = n.getValor();
            }
        }
        return menor;
    }

    public int maximo() {
        No n = this.cabeca;
        int maior = n.getValor();
        while (n.getProximo() != null){
            n = n.getProximo();
            if (maior < n.getValor()) {
                maior = n.getValor();
            }
        }
        return maior;
    }

    public int predecessor(int valor) {
        No n = this.cabeca;
        No anterior = null;
        int count = 0;
        while (n.getProximo() != null) {
            if (count != 0){
                count += 1;
                anterior = n;
               if (n.getValor() == valor){
                    break;
                } else {
                    n = n.getProximo();
                } 
            }
        }
        return anterior.getValor();
    }

    public int sucessor(int valor) {
        No n = this.cabeca;
        No proximo = null;
        while (n.getProximo() != null){
            proximo = n.getProximo();
        }
        return proximo.getValor();
    }

    public void insereElemento(int valor) {
        insereFim(valor);
    }

    public void insereElementoPosicao(int valor, int buscaIndice) {
        No n = new No(valor);
        No in = this.cabeca;
        int count = 0;
        if (buscaIndice == 0) {
            insereInicio(valor);
            return;
        }
        while (in.getProximo() != null){
            if (count == buscaIndice) {
                n.setProximo(in.getProximo());
                in.setProximo(n);
                break;
            } else {
                count += 1;
                in = in.getProximo();
            }
        }
    }

    public void insereInicio(int valor) {
        if(this.cabeca == null) {
            this.cabeca = new No(valor);
        } else {
            No n = new No(valor);
            n.setProximo(this.cabeca);
            this.cabeca = n;
        }
    }

    public void insereFim(int valor) {
       No n = new No(valor);
        if (this.cabeca == null) {
            this.cabeca = n;
        } else {
            No atual = this.cabeca;
            while (atual.getProximo() != null) {
               atual = atual.getProximo(); 
            }
            atual.setProximo(n);
       }
    }

    public void remove(int valor) {
        No n = this.cabeca;
        No antes = null;
        while (n != null) {
            if (n.getValor() == valor){
                antes.setProximo(n.getProximo());
                return;
            } else {
                antes = n;
                n = n.getProximo(); 
            }
        }
    }

    public void removeIndice(int indice) {
        No n = this.cabeca;
        No antes = null;
        int count = 0;
        if (indice == 0) {
            removeInicio();
            return;
        }
        while (n != null) {
            if(indice == count){
                antes.setProximo(n.getProximo());
                return;
            } else {
                antes = n;
                n = n.getProximo();
            }
        }
    }

    public void removeInicio() {
        if (this.cabeca != null){
           this.cabeca = this.cabeca.getProximo(); 
        }
    }

    public void removeFim() {
        No n = this.cabeca;
        No anterior = null;
    
        if (n == null) {
            return;
        }
    
        while (n.getProximo() != null) {
            anterior = n;
            n = n.getProximo();
        }
    
        if (anterior == null) {
            this.cabeca = null;
        } else {
            anterior.setProximo(null);
        }
    }

    public int getIndice() {
        No n = this.cabeca;
        int count = 0;
        while(n.getProximo() != null){
            count += 1;
        }
        return count;
    }

    @Override
  public String toString() {
    StringBuilder sb = new StringBuilder("[");
    No atual = cabeca;

    while (atual != null) {
      sb.append(atual.getValor());
      if (atual.getProximo() != null) {
        sb.append(", ");
      }
      atual = atual.getProximo();
    }

    sb.append("]");
    return sb.toString();
  }
}
