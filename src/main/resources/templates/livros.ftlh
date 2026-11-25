<#include "cabecalho.ftlh">

<h1>Acervo</h1>

<p>
    Ordenar por:
    <a href="/livros/html?ordem=titulo">título</a>
    <a href="/livros/html?ordem=autor">autor</a>
    <a href="/livros/html?ordem=preco">preço</a>
</p>

<#if usuarioLogado??>
    <p><a href="/livros/novo">Cadastrar livro</a></p>
</#if>

<p>${livros?size} livro(s) no acervo.</p>

<table>
    <tr><th>Título</th><th>Autor</th><th>Ano</th><th>Preço</th></tr>
    <#list livros as livro>
        <tr>
            <td><a href="/livros/${livro.id?c}">${livro.titulo}</a></td>
            <td>${livro.autor}</td>
            <td>${livro.ano?c}</td>
            <td>R$ ${livro.preco?string("0.00")}</td>
        </tr>
    </#list>
</table>

</body>
</html>
