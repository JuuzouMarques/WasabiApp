package com.wasabi;

import jakarta.persistence.*;

@Entity
public class ListaProdutos {
    private int idLista;
    private int quantidade;
    private Integer idProduto;
    private Integer idPedido;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idLista", nullable = false)
    public int getIdLista() {
        return idLista;
    }

    public void setIdLista(int idLista) {
        this.idLista = idLista;
    }

    @Basic
    @Column(name = "quantidade", nullable = false)
    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    @Basic
    @Column(name = "idProduto", nullable = true)
    public Integer getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    @Basic
    @Column(name = "idPedido", nullable = true)
    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ListaProdutos that = (ListaProdutos) o;

        if (idLista != that.idLista) return false;
        if (quantidade != that.quantidade) return false;
        if (idProduto != null ? !idProduto.equals(that.idProduto) : that.idProduto != null) return false;
        if (idPedido != null ? !idPedido.equals(that.idPedido) : that.idPedido != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idLista;
        result = 31 * result + quantidade;
        result = 31 * result + (idProduto != null ? idProduto.hashCode() : 0);
        result = 31 * result + (idPedido != null ? idPedido.hashCode() : 0);
        return result;
    }
}
