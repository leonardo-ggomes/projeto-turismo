-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Set-2023 às 18:41
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdgp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atrativos`
--

CREATE TABLE `atrativos` (
  `id_atrativos` int(11) NOT NULL,
  `nome_atrativo` varchar(45) NOT NULL,
  `lat_atrativo` varchar(45) DEFAULT NULL,
  `long_atrativo` varchar(45) DEFAULT NULL,
  `desc_atrativo` text DEFAULT NULL,
  `image_atrativo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `atrativos`
--

INSERT INTO `atrativos` (`id_atrativos`, `nome_atrativo`, `lat_atrativo`, `long_atrativo`, `desc_atrativo`, `image_atrativo`) VALUES
(1, 'Matarazzo', '-22.12009330426968', ' -51.37976290738116', 'O Centro Cultural Matarazzo é um importante espaço histórico, restaurado e projetado para ser um grande Centro Cultural na cidade de Presidente Prudente e região.', '295454950_434038968766675_8615545286653720562_n.jpeg'),
(2, 'Catedral de São Sebastião', '-22.12218265037136', '-51.38911343068033', 'Reze muito', 'catedral-sao-sebastiao.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins`
--

CREATE TABLE `coins` (
  `id_coin` int(11) NOT NULL,
  `nome_coin` varchar(45) NOT NULL,
  `value_coin` float DEFAULT NULL,
  `image_coin` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `coins`
--

INSERT INTO `coins` (`id_coin`, `nome_coin`, `value_coin`, `image_coin`) VALUES
(1, 'V-Prudens', 12.49, 'v-prudens.png'),
(2, 'V-Prudens', 12.49, 'v-prudens.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `id_cupom` int(11) NOT NULL,
  `codigo_cupom` varchar(22) NOT NULL,
  `nome_cupom` varchar(45) NOT NULL,
  `validade_cupom` date NOT NULL,
  `valor_cupom` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cupons`
--

INSERT INTO `cupons` (`id_cupom`, `codigo_cupom`, `nome_cupom`, `validade_cupom`, `valor_cupom`) VALUES
(1, '45643837', 'Cupom', '2023-09-20', 20),
(2, '844568405', 'Cupom2', '2023-09-23', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

CREATE TABLE `descontos` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `descontos`
--

INSERT INTO `descontos` (`id_desconto`, `valor_desconto`) VALUES
(1, 10),
(2, 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gamers`
--

CREATE TABLE `gamers` (
  `id_gamer` int(11) NOT NULL,
  `nome_gamer` varchar(45) NOT NULL,
  `senha_gamer` varchar(32) NOT NULL,
  `email_gamer` varchar(60) NOT NULL,
  `dtnasc_gamer` date NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL,
  `coins_id_coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `gamers`
--

INSERT INTO `gamers` (`id_gamer`, `nome_gamer`, `senha_gamer`, `email_gamer`, `dtnasc_gamer`, `personagens_id_personagem`, `coins_id_coin`) VALUES
(1, 'Felipe Pineda', '112351', 'fp@gmail.com', '2012-01-07', 1, 1),
(2, 'Andrei', '051563216', 'ab@gmail.com', '2013-08-14', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_acessos`
--

CREATE TABLE `log_acessos` (
  `id_log_acesso` int(11) NOT NULL,
  `ultimo_acesso` date NOT NULL,
  `status_acesso` varchar(4) NOT NULL,
  `gamers_id_gamer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `log_acessos`
--

INSERT INTO `log_acessos` (`id_log_acesso`, `ultimo_acesso`, `status_acesso`, `gamers_id_gamer`) VALUES
(3, '2023-09-30', '202', 2),
(4, '2023-09-26', '202', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes`
--

CREATE TABLE `missoes` (
  `id_missao` int(11) NOT NULL,
  `nome_missao` varchar(45) NOT NULL,
  `desc_missao` text DEFAULT NULL,
  `recompensa_missao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes`
--

INSERT INTO `missoes` (`id_missao`, `nome_missao`, `desc_missao`, `recompensa_missao`) VALUES
(1, 'Missão 1', 'Login diário', 10),
(2, 'Missão 2', 'Corra 50km', 1000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes_has_personagens`
--

CREATE TABLE `missoes_has_personagens` (
  `missoes_id_missao` int(11) NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes_has_personagens`
--

INSERT INTO `missoes_has_personagens` (`missoes_id_missao`, `personagens_id_personagem`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personagens`
--

CREATE TABLE `personagens` (
  `id_personagem` int(11) NOT NULL,
  `nome_personagem` varchar(45) NOT NULL,
  `genero_personagem` enum('M','F') NOT NULL,
  `tipo_personagem` enum('Humano','Coruja','Mago') NOT NULL,
  `totalcoin_personagem` decimal(10,0) NOT NULL,
  `start_latitude` varchar(30) NOT NULL DEFAULT '-22.12001041675085',
  `start_longitude` varchar(30) NOT NULL DEFAULT '-51.40542770057783'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `personagens`
--

INSERT INTO `personagens` (`id_personagem`, `nome_personagem`, `genero_personagem`, `tipo_personagem`, `totalcoin_personagem`, `start_latitude`, `start_longitude`) VALUES
(1, 'Pined', 'M', 'Humano', '0', '-22.12001041675085', '-51.40542770057783'),
(2, 'Andrei', 'M', 'Humano', '9999999999', '-22.12001041675085', '-51.40542770057783');

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id_promocao` int(11) NOT NULL,
  `nome_promocao` varchar(45) NOT NULL,
  `dt_start_promocao` date NOT NULL,
  `dt_end_promocao` date NOT NULL,
  `desc_promocao` text NOT NULL,
  `ativa_promocao` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id_promocao`, `nome_promocao`, `dt_start_promocao`, `dt_end_promocao`, `desc_promocao`, `ativa_promocao`) VALUES
(1, 'Promoção de Natal', '2023-12-24', '2023-12-25', 'Ganhe descontos e gaste muito', ''),
(2, 'Promoção', '2023-09-20', '2023-09-21', 'Ganhe descontos e gaste muito', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `skins`
--

CREATE TABLE `skins` (
  `id_skin` int(11) NOT NULL,
  `categoria_skin` enum('Acessório','Chapéu','Conjunto','Manto','Mochila') NOT NULL,
  `nome_skin` varchar(45) NOT NULL,
  `desc_skin` text NOT NULL,
  `genero_skin` enum('Masculino','Feminino') NOT NULL,
  `valor_skin` float NOT NULL,
  `raridade_skin` enum('Comum','Rara','Épico','Lendária') NOT NULL,
  `foto1_skin` varchar(200) NOT NULL,
  `foto2_skin` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `skins`
--

INSERT INTO `skins` (`id_skin`, `categoria_skin`, `nome_skin`, `desc_skin`, `genero_skin`, `valor_skin`, `raridade_skin`, `foto1_skin`, `foto2_skin`) VALUES
(1, 'Chapéu', 'Boné', 'Muito lindo', 'Masculino', 165, 'Rara', 'ffsddgfdbbb.jpeg', 'sfdsvcbgbsxvc.jpeg'),
(2, 'Conjunto', 'Roupas', 'Muito lindo', 'Masculino', 1950, 'Lendária', 'gbnbvvmssbxjhs.jpeg', 'hgnsysashsxhf\\af.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(11) NOT NULL,
  `hora_venda` time NOT NULL,
  `dia_venda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `hora_venda`, `dia_venda`) VALUES
(1, '08:31:16', '2023-09-30'),
(2, '09:31:16', '2023-09-29');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atrativos`
--
ALTER TABLE `atrativos`
  ADD PRIMARY KEY (`id_atrativos`);

--
-- Índices para tabela `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id_coin`);

--
-- Índices para tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id_cupom`);

--
-- Índices para tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices para tabela `gamers`
--
ALTER TABLE `gamers`
  ADD PRIMARY KEY (`id_gamer`),
  ADD KEY `fk_gamers_personagens_idx` (`personagens_id_personagem`),
  ADD KEY `fk_gamers_coins1_idx` (`coins_id_coin`);

--
-- Índices para tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD PRIMARY KEY (`id_log_acesso`),
  ADD KEY `fk_log_acessos_gamers1_idx` (`gamers_id_gamer`);

--
-- Índices para tabela `missoes`
--
ALTER TABLE `missoes`
  ADD PRIMARY KEY (`id_missao`);

--
-- Índices para tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD PRIMARY KEY (`missoes_id_missao`,`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_personagens1_idx` (`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_missoes1_idx` (`missoes_id_missao`);

--
-- Índices para tabela `personagens`
--
ALTER TABLE `personagens`
  ADD PRIMARY KEY (`id_personagem`);

--
-- Índices para tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id_promocao`);

--
-- Índices para tabela `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id_skin`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atrativos`
--
ALTER TABLE `atrativos`
  MODIFY `id_atrativos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `coins`
--
ALTER TABLE `coins`
  MODIFY `id_coin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id_cupom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id_desconto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gamers`
--
ALTER TABLE `gamers`
  MODIFY `id_gamer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  MODIFY `id_log_acesso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `missoes`
--
ALTER TABLE `missoes`
  MODIFY `id_missao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `personagens`
--
ALTER TABLE `personagens`
  MODIFY `id_personagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id_promocao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `skins`
--
ALTER TABLE `skins`
  MODIFY `id_skin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `gamers`
--
ALTER TABLE `gamers`
  ADD CONSTRAINT `fk_gamers_coins1` FOREIGN KEY (`coins_id_coin`) REFERENCES `coins` (`id_coin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamers_personagens` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD CONSTRAINT `fk_log_acessos_gamers1` FOREIGN KEY (`gamers_id_gamer`) REFERENCES `gamers` (`id_gamer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD CONSTRAINT `fk_missoes_has_personagens_missoes1` FOREIGN KEY (`missoes_id_missao`) REFERENCES `missoes` (`id_missao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_missoes_has_personagens_personagens1` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
