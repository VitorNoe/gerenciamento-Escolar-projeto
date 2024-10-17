-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/10/2024 às 00:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_gerenciamento_escolar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `ID_agendamento` int(11) NOT NULL,
  `TimeStamp_inicio` datetime NOT NULL,
  `ID_locatario` int(11) DEFAULT NULL,
  `Tipo_locatario` varchar(50) DEFAULT NULL,
  `ID_turma` int(11) DEFAULT NULL,
  `TimeStamp_fim` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andares`
--

CREATE TABLE `andares` (
  `ID_andar` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `ID_predio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias`
--

CREATE TABLE `dias` (
  `ID_dia` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disponibilidade`
--

CREATE TABLE `disponibilidade` (
  `ID_disponibilidade` int(11) NOT NULL,
  `ID_dia` int(11) DEFAULT NULL,
  `ID_turno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disponibilidade_professores`
--

CREATE TABLE `disponibilidade_professores` (
  `ID_disponibilidade_professor` int(11) NOT NULL,
  `ID_professor` int(11) DEFAULT NULL,
  `ID_disponibilidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `predios`
--

CREATE TABLE `predios` (
  `ID_predio` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Andares` int(11) NOT NULL,
  `Cor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `ID_professor` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Area` varchar(100) DEFAULT NULL,
  `CargaHoraria` int(11) DEFAULT NULL,
  `TipoContrato` varchar(50) DEFAULT NULL,
  `ID_disponibilidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recursos`
--

CREATE TABLE `recursos` (
  `ID_recurso` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `ID_sala` int(11) DEFAULT NULL,
  `Identificacao` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recursos_alugaveis`
--

CREATE TABLE `recursos_alugaveis` (
  `ID_recurso_alugavel` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Identificacao` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ID_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recursos_alugaveis_disponibilidade`
--

CREATE TABLE `recursos_alugaveis_disponibilidade` (
  `ID_recurso_alugavel_disponibilidade` int(11) NOT NULL,
  `Data` date NOT NULL,
  `ID_turno` int(11) DEFAULT NULL,
  `ID_recurso_alugavel` int(11) DEFAULT NULL,
  `ID_locatario` int(11) DEFAULT NULL,
  `Tipo_locatario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `salas`
--

CREATE TABLE `salas` (
  `ID_sala` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `ID_andar` int(11) DEFAULT NULL,
  `Capacidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `ID_turma` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `ID_turno` int(11) DEFAULT NULL,
  `Curso` varchar(100) DEFAULT NULL,
  `Cor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_dias`
--

CREATE TABLE `turma_dias` (
  `ID_turma_dia` int(11) NOT NULL,
  `ID_turma` int(11) DEFAULT NULL,
  `ID_dia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `ID_turno` int(11) NOT NULL,
  `Nome_turno` varchar(50) NOT NULL,
  `HorarioInicio` time NOT NULL,
  `HorarioFim` time NOT NULL,
  `Cor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuario` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`ID_agendamento`),
  ADD KEY `ID_locatario` (`ID_locatario`),
  ADD KEY `ID_turma` (`ID_turma`);

--
-- Índices de tabela `andares`
--
ALTER TABLE `andares`
  ADD PRIMARY KEY (`ID_andar`),
  ADD KEY `ID_predio` (`ID_predio`);

--
-- Índices de tabela `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`ID_dia`);

--
-- Índices de tabela `disponibilidade`
--
ALTER TABLE `disponibilidade`
  ADD PRIMARY KEY (`ID_disponibilidade`),
  ADD KEY `ID_dia` (`ID_dia`),
  ADD KEY `ID_turno` (`ID_turno`);

--
-- Índices de tabela `disponibilidade_professores`
--
ALTER TABLE `disponibilidade_professores`
  ADD PRIMARY KEY (`ID_disponibilidade_professor`),
  ADD KEY `ID_professor` (`ID_professor`),
  ADD KEY `ID_disponibilidade` (`ID_disponibilidade`);

--
-- Índices de tabela `predios`
--
ALTER TABLE `predios`
  ADD PRIMARY KEY (`ID_predio`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`ID_professor`),
  ADD KEY `ID_disponibilidade` (`ID_disponibilidade`);

--
-- Índices de tabela `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`ID_recurso`),
  ADD KEY `ID_sala` (`ID_sala`);

--
-- Índices de tabela `recursos_alugaveis`
--
ALTER TABLE `recursos_alugaveis`
  ADD PRIMARY KEY (`ID_recurso_alugavel`),
  ADD KEY `ID_sala` (`ID_sala`);

--
-- Índices de tabela `recursos_alugaveis_disponibilidade`
--
ALTER TABLE `recursos_alugaveis_disponibilidade`
  ADD PRIMARY KEY (`ID_recurso_alugavel_disponibilidade`),
  ADD KEY `ID_turno` (`ID_turno`),
  ADD KEY `ID_recurso_alugavel` (`ID_recurso_alugavel`),
  ADD KEY `ID_locatario` (`ID_locatario`);

--
-- Índices de tabela `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`ID_sala`),
  ADD KEY `ID_andar` (`ID_andar`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`ID_turma`),
  ADD KEY `ID_turno` (`ID_turno`);

--
-- Índices de tabela `turma_dias`
--
ALTER TABLE `turma_dias`
  ADD PRIMARY KEY (`ID_turma_dia`),
  ADD KEY `ID_turma` (`ID_turma`),
  ADD KEY `ID_dia` (`ID_dia`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`ID_turno`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `ID_agendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `andares`
--
ALTER TABLE `andares`
  MODIFY `ID_andar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dias`
--
ALTER TABLE `dias`
  MODIFY `ID_dia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disponibilidade`
--
ALTER TABLE `disponibilidade`
  MODIFY `ID_disponibilidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disponibilidade_professores`
--
ALTER TABLE `disponibilidade_professores`
  MODIFY `ID_disponibilidade_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `predios`
--
ALTER TABLE `predios`
  MODIFY `ID_predio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `ID_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recursos`
--
ALTER TABLE `recursos`
  MODIFY `ID_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `recursos_alugaveis`
--
ALTER TABLE `recursos_alugaveis`
  MODIFY `ID_recurso_alugavel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recursos_alugaveis_disponibilidade`
--
ALTER TABLE `recursos_alugaveis_disponibilidade`
  MODIFY `ID_recurso_alugavel_disponibilidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `ID_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `ID_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `turma_dias`
--
ALTER TABLE `turma_dias`
  MODIFY `ID_turma_dia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turnos`
--
ALTER TABLE `turnos`
  MODIFY `ID_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`ID_locatario`) REFERENCES `usuarios` (`ID_usuario`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`ID_turma`) REFERENCES `turmas` (`ID_turma`);

--
-- Restrições para tabelas `andares`
--
ALTER TABLE `andares`
  ADD CONSTRAINT `andares_ibfk_1` FOREIGN KEY (`ID_predio`) REFERENCES `predios` (`ID_predio`);

--
-- Restrições para tabelas `disponibilidade`
--
ALTER TABLE `disponibilidade`
  ADD CONSTRAINT `disponibilidade_ibfk_1` FOREIGN KEY (`ID_dia`) REFERENCES `dias` (`ID_dia`),
  ADD CONSTRAINT `disponibilidade_ibfk_2` FOREIGN KEY (`ID_turno`) REFERENCES `turnos` (`ID_turno`);

--
-- Restrições para tabelas `disponibilidade_professores`
--
ALTER TABLE `disponibilidade_professores`
  ADD CONSTRAINT `disponibilidade_professores_ibfk_1` FOREIGN KEY (`ID_professor`) REFERENCES `professores` (`ID_professor`),
  ADD CONSTRAINT `disponibilidade_professores_ibfk_2` FOREIGN KEY (`ID_disponibilidade`) REFERENCES `disponibilidade` (`ID_disponibilidade`);

--
-- Restrições para tabelas `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`ID_disponibilidade`) REFERENCES `disponibilidade` (`ID_disponibilidade`);

--
-- Restrições para tabelas `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`ID_sala`) REFERENCES `salas` (`ID_sala`);

--
-- Restrições para tabelas `recursos_alugaveis`
--
ALTER TABLE `recursos_alugaveis`
  ADD CONSTRAINT `recursos_alugaveis_ibfk_1` FOREIGN KEY (`ID_sala`) REFERENCES `salas` (`ID_sala`);

--
-- Restrições para tabelas `recursos_alugaveis_disponibilidade`
--
ALTER TABLE `recursos_alugaveis_disponibilidade`
  ADD CONSTRAINT `recursos_alugaveis_disponibilidade_ibfk_1` FOREIGN KEY (`ID_turno`) REFERENCES `turnos` (`ID_turno`),
  ADD CONSTRAINT `recursos_alugaveis_disponibilidade_ibfk_2` FOREIGN KEY (`ID_recurso_alugavel`) REFERENCES `recursos_alugaveis` (`ID_recurso_alugavel`),
  ADD CONSTRAINT `recursos_alugaveis_disponibilidade_ibfk_3` FOREIGN KEY (`ID_locatario`) REFERENCES `usuarios` (`ID_usuario`);

--
-- Restrições para tabelas `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`ID_andar`) REFERENCES `andares` (`ID_andar`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`ID_turno`) REFERENCES `turnos` (`ID_turno`);

--
-- Restrições para tabelas `turma_dias`
--
ALTER TABLE `turma_dias`
  ADD CONSTRAINT `turma_dias_ibfk_1` FOREIGN KEY (`ID_turma`) REFERENCES `turmas` (`ID_turma`),
  ADD CONSTRAINT `turma_dias_ibfk_2` FOREIGN KEY (`ID_dia`) REFERENCES `dias` (`ID_dia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
