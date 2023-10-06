INSERT INTO tbl_produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod)
VALUES (170, 2, 'LEITE CONDENSADO MOCOCA', '2010-12-30 00:00:00', 45.40);



UPDATE tbl_produtos
SET preco_prod = 95.40
WHERE cod_prod = 170 AND loj_prod = 2;


SELECT *
FROM tbl_produtos
WHERE loj_prod IN (1, 2);


SELECT MAX(dt_inclu_prod) AS maior_data, MIN(dt_inclu_prod) AS menor_data
FROM tbl_produtos;

SELECT COUNT(*) AS total_registros
FROM tbl_produtos;


SELECT *
FROM tbl_produtos
WHERE desc_prod LIKE 'L%';


SELECT loj_prod, SUM(preco_prod) AS total_preco
FROM tbl_produtos
GROUP BY loj_prod;



SELECT loj_prod, SUM(preco_prod) AS total_preco
FROM tbl_produtos
GROUP BY loj_prod
HAVING SUM(preco_prod) > 100000;


a)
SELECT
    le.loj_prod AS codigo_loja,
    ll.desc_loj AS descricao_loja,
    te.cod_prod AS codigo_produto,
    tp.desc_prod AS descricao_produto,
    tp.preco_prod AS preco_produto,
    te.qtd_prod AS quantidade_em_estoque
FROM
    tbl_estoque te
JOIN
    tbl_lojas ll ON te.loj_prod = ll.loj_prod
JOIN
    tbl_produtos tp ON te.cod_prod = tp.cod_prod
WHERE
    le.loj_prod = 1;

b)
SELECT tp.cod_prod, tp.desc_prod, tp.preco_prod
FROM tbl_produtos tp
LEFT JOIN tbl_estoque te ON tp.cod_prod = te.cod_prod
WHERE te.cod_prod IS NULL;



c)
SELECT te.cod_prod, te.loj_prod, te.qtd_prod
FROM tbl_estoque te
LEFT JOIN tbl_produtos tp ON te.cod_prod = tp.cod_prod
WHERE tp.cod_prod IS NULL;


