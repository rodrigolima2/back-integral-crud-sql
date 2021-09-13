-- 1 - Você acaba de conseguir fechar um freela pra estruturar um banco de dados de uma aplicação e a primeira demanda 
-- é trabalhar na tabela de usuários. Sabendo que essa tabela será a principal tabela desse banco de dados, é de suma 
-- importância que toda estrutura seja pensada nos mínimos detalhes para que não haja problemas futuros, quando o sistema 
-- já estiver funcionando.

-- Sendo assim, faça a criação da tabela `usuarios` seguindo os pré requisitos:

-- a) Um campo com identificador que seja incrementado automaticamente.
-- b) Um campo nome que suporte texto e seja obrigatório.
-- c) Um campo idade que possa receber um número inteiro pequeno.
-- d) Um campo e-mail que suporte, no máximo, 80 caracteres.
-- e) Um campo senha com limite de 8 caracteres que seja obrigatório.

CREATE TABLE usuarios (
  id serial,
  nome text NOT NULL,
  idade smallint,
  email varchar(80),
  senha varchar(8) NOT NULL
);

-- 2 - Após criar a tabela, chegou a hora de inserir os registros conforme solicitado pelo cliente. 
-- Seguindo a tabela abaixo cadastre todos os registros.

-- | nome                 | idade | email                            | senha    |
-- | -------------------- | ----- | -------------------------------- | -------- |
-- | Aretha Montgomery    | 30    | augue.id.ante@odioAliquam.com    | a0B13O3L |
-- | Camden H. Bartlett   | 15    | turpis.vitae.purus@risusDuisa.ca | p3P96F3Q |
-- | Raja W. Coffey       | 30    | raja.feugiat@nonummy.com         | s5F51T7L |
-- | Elton D. Olsen       | 29    | auctor@duiFuscediam.edu          | k5X25B0R |
-- | Shelley E. Frederick | 20    | raja.feugiat@nonummy.com         | u2D18F6E |

INSERT INTO usuarios (nome, idade, email, senha)
VALUES 
('Aretha Montgomery', 30, 'augue.id.ante@odioAliquam.com', 'a0B13O3L'),
('Camden H. Bartlett', 15, 'turpis.vitae.purus@risusDuisa.ca', 'p3P96F3Q'),
('Raja W. Coffey', 30, 'raja.feugiat@nonummy.com', 's5F51T7L'),
('Elton D. Olsen', 29, 'auctor@duiFuscediam.edu', 'k5X25B0R'),
('Shelley E. Frederick', 20, 'raja.feugiat@nonummy.com', 'u2D18F6E');

-- 3 - Após ter inserido os registros na tabela `usuarios`, foi identificado que o registro que possui o e-mail
-- `raja.feugiat@nonummy.com` informou seu nome errado. Faça uma atualização nesse registro alterando o nome para 
-- `Raja W. Coffey Thomas`.

UPDATE usuarios
SET nome = 'Raja W. Coffey Thomas'
WHERE id = 3;

-- 4 - O cliente percebeu que na tabela enviada anteriormente para inserir os usuários no banco de dados tinha um problema. 
-- Dois registros possui o mesmo e-mail e ao atualizar o nome do registro de e-mail `raja.feugiat@nonummy.com` essa alteração 
-- acabou afetando os dois registros que possui o mesmo e-mail. Isso precisa ser resolvido urgentemente e a solução é alterar 
-- o campo e-mail para não permitir e-mails duplicados, nem que seja necessário apagar todos os registros com o mesmo e-mail.

DELETE FROM usuarios
WHERE id = 5;

ALTER TABLE usuarios
ADD CONSTRAINT email UNIQUE(email);

-- 5 - Ufa!! Ainda bem que o problema foi resolvido. O cliente acabou de mandar outra tabela com mais cadastros para serem 
-- inseridos na tabela `usuarios`.

-- | nome                | idade | email                                | senha    |
-- | ------------------- | ----- | ------------------------------------ | -------- |
-- | Jermaine G. Sellers | 16    | ligula.Nullam@tortordictum.co.uk     | o2P56U9U |
-- | James D. Kennedy    | 23    | amet@Nulladignissim.com              | q6B78V3V |
-- | Amelia S. Harris    | 29    | nec.metus.facilisis@vitaealiquet.edu | l4S64Y3A |
-- | Joel M. Hartman     | 18    | montes.nascetur@odiotristique.co.uk  | c4Q27D7O |
-- | Elmo K. Greer       | 18    | risus.Duis@eget.ca                   | e3P92I7R |

INSERT INTO usuarios (nome, idade, email, senha)
VALUES
('Jermaine G. Sellers', 16, 'ligula.Nullam@tortordictum.co.uk', 'o2P56U9U'),
('James D. Kennedy', 23, 'amet@Nulladignissim.com', 'q6B78V3V'),
('Amelia S. Harris', 29, 'nec.metus.facilisis@vitaealiquet.edu', 'l4S64Y3A'),
('Joel M. Hartman', 18, 'montes.nascetur@odiotristique.co.uk', 'c4Q27D7O'),
('Elmo K. Greer', 18, 'risus.Duis@eget.ca', 'e3P92I7R');

-- 6 - A próxima demanda que surgiu foi adicionar um novo campo a tabela `usuarios` que aceite somente dois valores 
-- (Verdadeiro ou Falso). Nesse campo, caso não seja informado nada ao inserir um registro, significa que por padrão é 
-- verdadeiro. Ahh... O cliente pediu que esse campo fosse chamado `situacao`, pois será identificado a situação do usuário, 
-- se está ativo ou não.

ALTER TABLE usuarios
ADD COLUMN situacao boolean DEFAULT TRUE;

-- 7 - A solicitação anterior não era a toa. O cliente acabou de mandar o primeiro usuario que ele precisa inativar. 
-- Sendo assim, você precisa atualizar o registro que possui o e-mail `montes.nascetur@odiotristique.co.uk` alterando a 
-- situação dele para falso.

UPDATE usuarios
SET situacao = FALSE
WHERE email ILIKE 'montes.nascetur@odiotristique.co.uk';

-- 8 - Temos uma outra pequena demanda. O registro que possui o e-mail `risus.Duis@eget.ca` solicitou alteração da sua senha 
-- para `k9P31H1O`.

UPDATE usuarios
SET senha = 'k9P31H1O'
WHERE email ILIKE 'risus.Duis@eget.ca';

-- 9 - Só agora o cliente percebeu que seria melhor armazenar a data de nascimento do usuário no lugar da idade. Será 
-- necessário excluir o campo `idade` e adicionar um novo campo chamado `data_nascimento` que receberá uma data no formado 
-- `YYYY-MM-DD` que corresponde a `Ex.: 2021-05-30`.

ALTER TABLE usuarios
DROP COLUMN idade;

ALTER TABLE usuarios
ADD COLUMN data_nascimento date;

-- 10 - Nesse momento, foi solicitado de cada usuário que enviasse a data de nascimento para que fosse atualizada no banco 
-- de dados e até o momento apenas dois enviaram. Faça a atualização dos respectivos registros:

-- a) O registro que possui o e-mail `auctor@duiFuscediam.edu` nasceu em `1991-09-29`;
-- a) O registro que possui o e-mail `nec.metus.facilisis@vitaealiquet.edu` nasceu em `1988-11-02`;

UPDATE usuarios
SET data_nascimento = '1991-09-29'
WHERE email ILIKE 'auctor@duiFuscediam.edu';

UPDATE usuarios
SET data_nascimento = '1988-11-02'
WHERE email ILIKE 'nec.metus.facilisis@vitaealiquet.edu';

-- 11 - Depois de tanto solicitar a data de nascimento para os usuários e até o momento somente dois enviaram, o cliente 
-- resolveu excluir definitivamente todos os registros que estão sem a data de nascimento. Esse Job precisa ser feito com 
-- muito cuidado, portanto, prossiga com cautela.

DELETE from usuarios
WHERE data_nascimento IS NULL;

-- 12 - Para que nenhum outro registro seja adicionado sem a data de nascimento, o cliente solicitou que adicionasse uma 
-- restrição ao campo `data_nascimento` para que fosse um campo obrigatório.

ALTER TABLE usuarios
ALTER COLUMN data_nascimento
SET NOT NULL;

-- 13 - Agora que a tabela de usuários parece ter ficado pronta, restaram apenas dois registros pendente de cadastro. 
-- Cadastre os registros a seguir para concluir seu Job.

-- | nome              | data_nascimento | email                      | senha    |
-- | ----------------- | --------------- | -------------------------- | -------- |
-- | Tate I. Dean      | 1989-05-01      | Nunc@etmagnis.edu          | d3V25D6Y |
-- | Arsenio K. Harmon | 1985-10-23      | adipiscing.elit@turpis.com | m3T58S0C |

INSERT INTO usuarios (nome, email, senha, data_nascimento)
VALUES
('Tate I. Dean', 'Nunc@etmagnis.edu', 'd3V25D6Y', '1989-05-01'),
('Arsenio K. Harmon', 'adipiscing.elit@turpis.com', 'm3T58S0C', '1985-10-23');