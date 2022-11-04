use wasabiapp;

CREATE TABLE `Produto` (
    `idProduto` INT  PRIMARY KEY AUTO_INCREMENT,
    `Nome` VARCHAR(50) NOT NULL,
    `Descricao` VARCHAR(200) NOT NULL,
    `ValorVenda` DOUBLE NOT NULL,
    `Url` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `cpf` varchar(22) NOT NULL,
  `cartaoDeCredito` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Pedido` (
    `idPedido` INT PRIMARY KEY AUTO_INCREMENT,
    `idCliente` INT NOT NULL,
    `SubTotal` DOUBLE NOT NULL,
    CONSTRAINT `Pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ListaProdutos` (
    `idLista` INT PRIMARY KEY AUTO_INCREMENT,
    `Quantidade` INT NOT NULL,
    `IdProduto` INT,
    `IdPedido` INT,
    CONSTRAINT `ListaProdutos_produto` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ListaProdutos_pedido` FOREIGN KEY (`idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE INDEX `WDIDX_ListaProdutos_IdProduto` ON `ListaProdutos` (`IdProduto`);
CREATE INDEX `WDIDX_ListaProdutos_IdPedido` ON `ListaProdutos` (`IdPedido`);

-- Constraints
ALTER TABLE `Pedido` ADD FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`idCliente`);
ALTER TABLE `ListaProdutos` ADD FOREIGN KEY (`IdProduto`) REFERENCES `Produto` (`idProduto`);
ALTER TABLE `ListaProdutos` ADD FOREIGN KEY (`IdPedido`) REFERENCES `Pedido` (`idPedido`);