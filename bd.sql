-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 16-Abr-2020 às 00:05
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordemservico`
--
CREATE DATABASE IF NOT EXISTS `ordemservico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `ordemservico`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anexos`
--

DROP TABLE IF EXISTS `anexos`;
CREATE TABLE IF NOT EXISTS `anexos` (
  `idAnexos` int(11) NOT NULL AUTO_INCREMENT,
  `anexo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  PRIMARY KEY (`idAnexos`),
  KEY `fk_anexos_os1` (`os_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anotacoes_os`
--

DROP TABLE IF EXISTS `anotacoes_os`;
CREATE TABLE IF NOT EXISTS `anotacoes_os` (
  `idAnotacoes` int(11) NOT NULL AUTO_INCREMENT,
  `anotacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_hora` datetime NOT NULL,
  `os_id` int(11) NOT NULL,
  PRIMARY KEY (`idAnotacoes`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('r099jeeh8bclcunf1igr0jv8mg0ui3sl', '::1', 1585161801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353136313830313b),
('sptl9lov9757ak2orecgb6ob5d7d2mo2', '::1', 1585162170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353136323137303b),
('226cpjaram1dm0sf92liv742151eligs', '::1', 1585162342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353136323137303b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(255) NOT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `pessoa_fisica` tinyint(1) NOT NULL DEFAULT '1',
  `documento` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `configuracoes`
--

DROP TABLE IF EXISTS `configuracoes`;
CREATE TABLE IF NOT EXISTS `configuracoes` (
  `idConfig` int(11) NOT NULL AUTO_INCREMENT,
  `config` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idConfig`),
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `configuracoes`
--

INSERT INTO `configuracoes` (`idConfig`, `config`, `valor`) VALUES
(2, 'app_name', 'Map-OS'),
(3, 'app_theme', 'white'),
(4, 'per_page', '10'),
(5, 'os_notification', 'cliente'),
(6, 'control_estoque', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas`
--

DROP TABLE IF EXISTS `contas`;
CREATE TABLE IF NOT EXISTS `contas` (
  `idContas` int(11) NOT NULL AUTO_INCREMENT,
  `conta` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banco` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idContas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

DROP TABLE IF EXISTS `documentos`;
CREATE TABLE IF NOT EXISTS `documentos` (
  `idDocumentos` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `categoria` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tamanho` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idDocumentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_queue`
--

DROP TABLE IF EXISTS `email_queue`;
CREATE TABLE IF NOT EXISTS `email_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','sending','sent','failed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emitente`
--

DROP TABLE IF EXISTS `emitente`;
CREATE TABLE IF NOT EXISTS `emitente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_logo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamentos`
--

DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE IF NOT EXISTS `equipamentos` (
  `idEquipamentos` int(11) NOT NULL AUTO_INCREMENT,
  `equipamento` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_serie` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cor` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tensao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `potencia` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voltagem` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `marcas_id` int(11) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos`),
  KEY `fk_equipanentos_marcas1_idx` (`marcas_id`),
  KEY `fk_equipanentos_clientes1_idx` (`clientes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamentos_os`
--

DROP TABLE IF EXISTS `equipamentos_os`;
CREATE TABLE IF NOT EXISTS `equipamentos_os` (
  `idEquipamentos_os` int(11) NOT NULL AUTO_INCREMENT,
  `defeito_declarado` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defeito_encontrado` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solucao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipamentos_id` int(11) DEFAULT NULL,
  `os_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos_os`),
  KEY `fk_equipamentos_os_equipanentos1_idx` (`equipamentos_id`),
  KEY `fk_equipamentos_os_os1_idx` (`os_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `garantias`
--

DROP TABLE IF EXISTS `garantias`;
CREATE TABLE IF NOT EXISTS `garantias` (
  `idGarantias` int(11) NOT NULL AUTO_INCREMENT,
  `dataGarantia` date DEFAULT NULL,
  `refGarantia` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `textoGarantia` text COLLATE utf8mb4_unicode_ci,
  `usuarios_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGarantias`),
  KEY `fk_garantias_usuarios1` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_de_vendas`
--

DROP TABLE IF EXISTS `itens_de_vendas`;
CREATE TABLE IF NOT EXISTS `itens_de_vendas` (
  `idItens` int(11) NOT NULL AUTO_INCREMENT,
  `subTotal` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendas_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  PRIMARY KEY (`idItens`),
  KEY `fk_itens_de_vendas_vendas1` (`vendas_id`),
  KEY `fk_itens_de_vendas_produtos1` (`produtos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

DROP TABLE IF EXISTS `lancamentos`;
CREATE TABLE IF NOT EXISTS `lancamentos` (
  `idLancamentos` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` varchar(15) NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `baixado` tinyint(1) DEFAULT '0',
  `cliente_fornecedor` varchar(255) DEFAULT NULL,
  `forma_pgto` varchar(100) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `anexo` varchar(250) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  `categorias_id` int(11) DEFAULT NULL,
  `contas_id` int(11) DEFAULT NULL,
  `vendas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLancamentos`),
  KEY `fk_lancamentos_clientes1` (`clientes_id`),
  KEY `fk_lancamentos_categorias1_idx` (`categorias_id`),
  KEY `fk_lancamentos_contas1_idx` (`contas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `idLogs` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tarefa` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idLogs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `idMarcas` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `situacao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idMarcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(20121031100537);

-- --------------------------------------------------------

--
-- Estrutura da tabela `os`
--

DROP TABLE IF EXISTS `os`;
CREATE TABLE IF NOT EXISTS `os` (
  `idOs` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicial` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL,
  `garantia` varchar(45) DEFAULT NULL,
  `descricaoProduto` text,
  `defeito` text,
  `status` varchar(45) DEFAULT NULL,
  `observacoes` text,
  `laudoTecnico` text,
  `valorTotal` varchar(15) DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `lancamento` int(11) DEFAULT NULL,
  `faturado` tinyint(1) NOT NULL,
  `garantias_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOs`),
  KEY `fk_os_clientes1` (`clientes_id`),
  KEY `fk_os_usuarios1` (`usuarios_id`),
  KEY `fk_os_lancamentos1` (`lancamento`),
  KEY `fk_os_garantias1` (`garantias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `idPag` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `client_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `client_secret` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `public_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `access_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `default_pag` int(1) NOT NULL,
  PRIMARY KEY (`idPag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

DROP TABLE IF EXISTS `permissoes`;
CREATE TABLE IF NOT EXISTS `permissoes` (
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissoes` text COLLATE utf8mb4_unicode_ci,
  `situacao` tinyint(1) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`idPermissao`, `nome`, `permissoes`, `situacao`, `data`) VALUES
(1, 'Administrador', 'a:45:{s:8:\"aCliente\";s:1:\"1\";s:8:\"eCliente\";s:1:\"1\";s:8:\"dCliente\";s:1:\"1\";s:8:\"vCliente\";s:1:\"1\";s:8:\"aProduto\";s:1:\"1\";s:8:\"eProduto\";s:1:\"1\";s:8:\"dProduto\";s:1:\"1\";s:8:\"vProduto\";s:1:\"1\";s:8:\"aServico\";s:1:\"1\";s:8:\"eServico\";s:1:\"1\";s:8:\"dServico\";s:1:\"1\";s:8:\"vServico\";s:1:\"1\";s:3:\"aOs\";s:1:\"1\";s:3:\"eOs\";s:1:\"1\";s:3:\"dOs\";s:1:\"1\";s:3:\"vOs\";s:1:\"1\";s:6:\"aVenda\";s:1:\"1\";s:6:\"eVenda\";s:1:\"1\";s:6:\"dVenda\";s:1:\"1\";s:6:\"vVenda\";s:1:\"1\";s:9:\"aGarantia\";s:1:\"1\";s:9:\"eGarantia\";s:1:\"1\";s:9:\"dGarantia\";s:1:\"1\";s:9:\"vGarantia\";s:1:\"1\";s:8:\"aArquivo\";s:1:\"1\";s:8:\"eArquivo\";s:1:\"1\";s:8:\"dArquivo\";s:1:\"1\";s:8:\"vArquivo\";s:1:\"1\";s:11:\"aLancamento\";s:1:\"1\";s:11:\"eLancamento\";s:1:\"1\";s:11:\"dLancamento\";s:1:\"1\";s:11:\"vLancamento\";s:1:\"1\";s:8:\"cUsuario\";s:1:\"1\";s:9:\"cEmitente\";s:1:\"1\";s:10:\"cPermissao\";s:1:\"1\";s:7:\"cBackup\";s:1:\"1\";s:10:\"cAuditoria\";s:1:\"1\";s:6:\"cEmail\";s:1:\"1\";s:8:\"cSistema\";s:1:\"1\";s:8:\"rCliente\";s:1:\"1\";s:8:\"rProduto\";s:1:\"1\";s:8:\"rServico\";s:1:\"1\";s:3:\"rOs\";s:1:\"1\";s:6:\"rVenda\";s:1:\"1\";s:11:\"rFinanceiro\";s:1:\"1\";}', 1, '2014-09-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProdutos` int(11) NOT NULL AUTO_INCREMENT,
  `codDeBarra` varchar(70) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `unidade` varchar(10) DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `estoqueMinimo` int(11) DEFAULT NULL,
  `saida` tinyint(1) DEFAULT NULL,
  `entrada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_os`
--

DROP TABLE IF EXISTS `produtos_os`;
CREATE TABLE IF NOT EXISTS `produtos_os` (
  `idProdutos_os` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `preco` varchar(15) DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  `subTotal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idProdutos_os`),
  KEY `fk_produtos_os_os1` (`os_id`),
  KEY `fk_produtos_os_produtos1` (`produtos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

DROP TABLE IF EXISTS `servicos`;
CREATE TABLE IF NOT EXISTS `servicos` (
  `idServicos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idServicos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos_os`
--

DROP TABLE IF EXISTS `servicos_os`;
CREATE TABLE IF NOT EXISTS `servicos_os` (
  `idServicos_os` int(11) NOT NULL AUTO_INCREMENT,
  `servico` varchar(80) DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `preco` varchar(15) DEFAULT NULL,
  `os_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `subTotal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idServicos_os`),
  KEY `fk_servicos_os_os1` (`os_id`),
  KEY `fk_servicos_os_servicos1` (`servicos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) NOT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `situacao` tinyint(1) NOT NULL,
  `dataCadastro` date NOT NULL,
  `permissoes_id` int(11) NOT NULL,
  `dataExpiracao` date DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_usuarios_permissoes1_idx` (`permissoes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nome`, `rg`, `cpf`, `rua`, `numero`, `bairro`, `cidade`, `estado`, `email`, `senha`, `telefone`, `celular`, `situacao`, `dataCadastro`, `permissoes_id`, `dataExpiracao`) VALUES
(1, 'admin', 'MG-25.502.560', '600.021.520-87', 'Rua Acima', '12', 'Alvorada', 'Teste', 'MG', 'darlanscosta1996@gmail.com', '$2y$10$aKbVZYx/.XifxVYYIP7HsuqPlweHCcvEIAzO3rVhOCkleCPJNYk3K', '000000-0000', '', 1, '2012-01-01', 1, '3000-01-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `idVendas` int(11) NOT NULL AUTO_INCREMENT,
  `dataVenda` date DEFAULT NULL,
  `valorTotal` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desconto` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faturado` tinyint(1) DEFAULT NULL,
  `clientes_id` int(11) NOT NULL,
  `usuarios_id` int(11) DEFAULT NULL,
  `lancamentos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVendas`),
  KEY `fk_vendas_clientes1` (`clientes_id`),
  KEY `fk_vendas_usuarios1` (`usuarios_id`),
  KEY `fk_vendas_lancamentos1` (`lancamentos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `anexos`
--
ALTER TABLE `anexos`
  ADD CONSTRAINT `fk_anexos_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD CONSTRAINT `fk_equipanentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipanentos_marcas1` FOREIGN KEY (`marcas_id`) REFERENCES `marcas` (`idMarcas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `equipamentos_os`
--
ALTER TABLE `equipamentos_os`
  ADD CONSTRAINT `fk_equipamentos_os_equipanentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`idEquipamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipamentos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `garantias`
--
ALTER TABLE `garantias`
  ADD CONSTRAINT `fk_garantias_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens_de_vendas`
--
ALTER TABLE `itens_de_vendas`
  ADD CONSTRAINT `fk_itens_de_vendas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_de_vendas_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `vendas` (`idVendas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `fk_lancamentos_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`idCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lancamentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lancamentos_contas1` FOREIGN KEY (`contas_id`) REFERENCES `contas` (`idContas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `os`
--
ALTER TABLE `os`
  ADD CONSTRAINT `fk_os_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_os_lancamentos1` FOREIGN KEY (`lancamento`) REFERENCES `lancamentos` (`idLancamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_os_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos_os`
--
ALTER TABLE `produtos_os`
  ADD CONSTRAINT `fk_produtos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_os_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servicos_os`
--
ALTER TABLE `servicos_os`
  ADD CONSTRAINT `fk_servicos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicos_os_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`idServicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_permissoes1` FOREIGN KEY (`permissoes_id`) REFERENCES `permissoes` (`idPermissao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_lancamentos1` FOREIGN KEY (`lancamentos_id`) REFERENCES `lancamentos` (`idLancamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
