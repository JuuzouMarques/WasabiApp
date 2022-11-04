package com.wasabi;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
public class Produto {
    private int idProduto;
    private String nome;
    private String descricao;
    private double preco;
    private String url;
    private Collection<ListaProdutos> listaprodutosByIdProduto;
    private Collection<ListaProdutos> listaprodutosByIdProduto_0;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idProduto", nullable = false)
    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    @Basic
    @Column(name = "nome", nullable = false, length = 50)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Basic
    @Column(name = "descricao", nullable = false, length = 200)
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Basic
    @Column(name = "preco", nullable = false, precision = 0)
    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    @Basic
    @Column(name = "url", nullable = true, length = 50)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Produto produto = (Produto) o;

        if (idProduto != produto.idProduto) return false;
        if (Double.compare(produto.preco, preco) != 0) return false;
        if (nome != null ? !nome.equals(produto.nome) : produto.nome != null) return false;
        if (descricao != null ? !descricao.equals(produto.descricao) : produto.descricao != null) return false;
        if (url != null ? !url.equals(produto.url) : produto.url != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idProduto;
        result = 31 * result + (nome != null ? nome.hashCode() : 0);
        result = 31 * result + (descricao != null ? descricao.hashCode() : 0);
        temp = Double.doubleToLongBits(preco);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (url != null ? url.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "produtoByIdProduto")
    public Collection<ListaProdutos> getListaprodutosByIdProduto() {
        return listaprodutosByIdProduto;
    }

    public void setListaprodutosByIdProduto(Collection<ListaProdutos> listaprodutosByIdProduto) {
        this.listaprodutosByIdProduto = listaprodutosByIdProduto;
    }

    @OneToMany(mappedBy = "produtoByIdProduto_0")
    public Collection<ListaProdutos> getListaprodutosByIdProduto_0() {
        return listaprodutosByIdProduto_0;
    }

    public void setListaprodutosByIdProduto_0(Collection<ListaProdutos> listaprodutosByIdProduto_0) {
        this.listaprodutosByIdProduto_0 = listaprodutosByIdProduto_0;
    }
}
