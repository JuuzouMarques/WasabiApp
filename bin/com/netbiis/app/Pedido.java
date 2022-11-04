package com.wasabi;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
public class Pedido {
    private int idPedido;
    private int idCliente;
    private double subTotal;
    private Collection<ListaProdutos> listaprodutosByIdPedido;
    private Collection<ListaProdutos> listaprodutosByIdPedido_0;
    private Cliente clienteByIdCliente;
    private Cliente clienteByIdCliente_0;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idPedido", nullable = false)
    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    @Basic
    @Column(name = "idCliente", nullable = false)
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    @Basic
    @Column(name = "subTotal", nullable = false, precision = 0)
    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Pedido pedido = (Pedido) o;

        if (idPedido != pedido.idPedido) return false;
        if (idCliente != pedido.idCliente) return false;
        if (Double.compare(pedido.subTotal, subTotal) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idPedido;
        result = 31 * result + idCliente;
        temp = Double.doubleToLongBits(subTotal);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @OneToMany(mappedBy = "pedidoByIdPedido")
    public Collection<ListaProdutos> getListaprodutosByIdPedido() {
        return listaprodutosByIdPedido;
    }

    public void setListaprodutosByIdPedido(Collection<ListaProdutos> listaprodutosByIdPedido) {
        this.listaprodutosByIdPedido = listaprodutosByIdPedido;
    }

    @OneToMany(mappedBy = "pedidoByIdPedido_0")
    public Collection<ListaProdutos> getListaprodutosByIdPedido_0() {
        return listaprodutosByIdPedido_0;
    }

    public void setListaprodutosByIdPedido_0(Collection<ListaProdutos> listaprodutosByIdPedido_0) {
        this.listaprodutosByIdPedido_0 = listaprodutosByIdPedido_0;
    }

    @ManyToOne
    @JoinColumn(name = "idCliente", referencedColumnName = "idCliente", nullable = false)
    public Cliente getClienteByIdCliente() {
        return clienteByIdCliente;
    }

    public void setClienteByIdCliente(Cliente clienteByIdCliente) {
        this.clienteByIdCliente = clienteByIdCliente;
    }

    @ManyToOne
    @JoinColumn(name = "idCliente", referencedColumnName = "idCliente", nullable = false)
    public Cliente getClienteByIdCliente_0() {
        return clienteByIdCliente_0;
    }

    public void setClienteByIdCliente_0(Cliente clienteByIdCliente_0) {
        this.clienteByIdCliente_0 = clienteByIdCliente_0;
    }
}
