-- Calcular Volume(Qtd de pedidos), Faturamento, Ticket médio. Responder as perguntas de negócio se , faturamento, quantidade de pedidos e ticket medio decresceram ou aumentarem em relação a compra anterior do cliente

with ticket as (SELECT p.id_cliente, razao_social, p.data_emissao_pedido, round(sum(valor_geral_pedido),2) as valor_total, count(p.id_pedido) as pedidos_totais,round((sum(valor_geral_pedido)/count(p.id_pedido)),2) as ticket_medio 
from `portifolio-vendas-462510.dados.pedidos` p
inner join `portifolio-vendas-462510.dados.clientes` c on p.id_cliente = c.id_cliente
group by id_cliente,razao_social,p.data_emissao_pedido
order by sum(valor_geral_pedido) desc
)

SELECT ticket.id_cliente,razao_social,data_emissao_pedido,ticket,
LAG(ticket.ticket_medio) over (partition by id_cliente order by data_emissao_pedido) as ticket_anterior,
LAG(ticket.pedidos_totais) over (partition by id_cliente order by data_emissao_pedido) as qtd_anterior,
LAG(ticket.valor_total) over (partition by id_cliente order by data_emissao_pedido) as faturamento_anterior,
CASE
  WHEN ticket.pedidos_totais> LAG(ticket.pedidos_totais) over (partition by id_cliente order by data_emissao_pedido)  then "Crescente"
  WHEN ticket.pedidos_totais = LAG(ticket.pedidos_totais) over (partition by id_cliente order by data_emissao_pedido) then "Igual"
  else "Decrescente" end as tendencia_pedidos,
CASE
  WHEN ticket.ticket_medio> LAG(ticket.ticket_medio) over (partition by id_cliente order by data_emissao_pedido) then "Crescente"
  WHEN ticket.ticket_medio = LAG(ticket.ticket_medio) over (partition by id_cliente order by data_emissao_pedido) then "Igual"
  else "Decrescente" END AS  tendencia_ticket,
CASE
  WHEN ticket.valor_total> LAG(ticket.valor_total) over (partition by id_cliente order by data_emissao_pedido) then "Crescente"
  WHEN ticket.ticket_medio =LAG(ticket.valor_total) over (partition by id_cliente order by data_emissao_pedido) then "Igual"
  else "Decrescente" END AS  tendencia_faturamento
from ticket
order by data_emissao_pedido;

