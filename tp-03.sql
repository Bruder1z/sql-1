--1)Selecione todos os clientes cujo status seja "bom" e ordene os resultados pelo nome do cliente em ordem alfabética.
--2)Liste todos os produtos na categoria "Eletrônicos" e ordene pelo nome do produto em ordem alfabética.
--3)Encontre o valor total de todos os pedidos feitos por clientes com o status "médio".
--4)Obtenha uma lista de clientes que fizeram pedidos em abril de 2024, ordenada pelo nome do cliente em ordem alfabética.
--5)Selecione todos os produtos que tenham um valor unitário superior a $100 e ordene os resultados pelo valor unitário em ordem decrescente.
--6)Encontre o cliente mais novo (em termos de data de nascimento) que tenha feito um pedido.
--7)Liste todos os produtos em ordem decrescente de quantidade vendida.
--8)Selecione o nome do cliente e o total gasto por cada cliente, ordenando os resultados pelo total gasto em ordem decrescente.
--9)Encontre a categoria com o maior número de produtos.
--10)Obtenha uma lista de produtos que não foram vendidos em nenhum pedido.

--A entrega deve ser feita pelo Teams de forma individual. (anexando o arquivo .sql)

--1
SELECT *
FROM Cliente
WHERE sg_status = 'bom'
ORDER BY nm_Cliente ASC;

--2

SELECT nm_Produto
FROM Produto
WHERE cd_categoria = 'Eletrônicos'
ORDER BY nm_Produto ASC;

--3
SELECT SUM(cd_pedido) AS ValorTotalPedidos
FROM Pedido
WHERE cd_cliente IN (
    SELECT cd_cliente
    FROM Cliente
    WHERE sg_status = 'médio'
);

--4
SELECT c.nm_cliente
FROM Cliente c
JOIN Pedido p ON c.cd_cliente = p.cd_cliente
WHERE YEAR(p.dt_pedido) = 2024 AND MONTH(p.dt_pedido) = 4
ORDER BY c.nm_cliente ASC;


--5
SELECT *
FROM produto
WHERE vl_produto > 100
ORDER BY vl_produto DESC;

--6
SELECT c.nm_cliente, c.dt_nascimento
FROM cliente c
JOIN pedido p ON c.cd_cliente = p.cd_cliente
ORDER BY c.dt_nascimento ASC

--7
SELECT *
FROM produto
ORDER BY cd_produto DESC;


--8
SELECT c.nm_cliente, SUM(p.vl_produto) AS TotalGasto
FROM Cliente c
JOIN Pedido ped ON c.cd_cliente = ped.cd_cliente
JOIN Produto p ON ped.cd_pedido = p.cd_categoria
GROUP BY c.cd_cliente, c.nm_cliente
ORDER BY TotalGasto DESC;

--9
SELECT cd_categoria, COUNT(*) AS num_produtos
FROM produto
GROUP BY cd_categoria
ORDER BY num_produtos DESC

--10
SELECT *
FROM Produto
WHERE cd_produto NOT IN (SELECT cd_produto FROM Categoria);