<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EstanteWeb</title>
    <style>
        body { font-family: system-ui, sans-serif; margin: 0 auto; max-width: 54rem;
               padding: 1rem; line-height: 1.5; }
        header { display: flex; justify-content: space-between; align-items: center;
                 border-bottom: 1px solid #ddd; padding-bottom: .75rem; margin-bottom: 1.5rem; }
        nav a { margin-right: .75rem; }
        table { border-collapse: collapse; width: 100%; }
        th, td { text-align: left; padding: .4rem .6rem; border-bottom: 1px solid #eee; }
        .erro { background: #fde8e8; border: 1px solid #f8b4b4; padding: .6rem; }
        label { display: block; margin-bottom: .6rem; }
        input { padding: .3rem; }
    </style>
</head>
<body>
<header>
    <div>
        <strong>EstanteWeb</strong>
        <nav>
            <a href="/livros/html">Acervo</a>
            <a href="/sugestoes">Sugestões</a>
            <a href="/sugestoes/nova">Sugerir um livro</a>
        </nav>
    </div>
    <div>
        <#if usuarioLogado??>
            Olá, ${usuarioLogado.nome}
            <form action="/logout" method="post" style="display: inline;">
                <button type="submit">Sair</button>
            </form>
        <#else>
            <a href="/login">Entrar</a>
        </#if>
    </div>
</header>
