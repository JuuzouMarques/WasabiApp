package com.wasabi;

import jakarta.persistence.*;

@Entity
public class Cliente {
    private int idCliente;
    private String nome;
    private String email;
    private String endereco;
    private String cpf;
    private String cartaoDeCredito;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idCliente", nullable = false)
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    @Basic
    @Column(name = "nome", nullable = false, length = 45)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 45)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "endereco", nullable = false, length = 90)
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    @Basic
    @Column(name = "cpf", nullable = false, length = 22)
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    @Basic
    @Column(name = "cartaoDeCredito", nullable = false, length = 45)
    public String getCartaoDeCredito() {
        return cartaoDeCredito;
    }

    public void setCartaoDeCredito(String cartaoDeCredito) {
        this.cartaoDeCredito = cartaoDeCredito;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cliente cliente = (Cliente) o;

        if (idCliente != cliente.idCliente) return false;
        if (nome != null ? !nome.equals(cliente.nome) : cliente.nome != null) return false;
        if (email != null ? !email.equals(cliente.email) : cliente.email != null) return false;
        if (endereco != null ? !endereco.equals(cliente.endereco) : cliente.endereco != null) return false;
        if (cpf != null ? !cpf.equals(cliente.cpf) : cliente.cpf != null) return false;
        if (cartaoDeCredito != null ? !cartaoDeCredito.equals(cliente.cartaoDeCredito) : cliente.cartaoDeCredito != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCliente;
        result = 31 * result + (nome != null ? nome.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (endereco != null ? endereco.hashCode() : 0);
        result = 31 * result + (cpf != null ? cpf.hashCode() : 0);
        result = 31 * result + (cartaoDeCredito != null ? cartaoDeCredito.hashCode() : 0);
        return result;
    }
}
