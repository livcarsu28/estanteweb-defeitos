package br.com.estanteweb;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LivroRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final List<String> COLUNAS_PERMITIDAS =
        List.of("titulo", "autor", "ano", "preco");

    public List<Livro> listarTodos() {
        String sql = "SELECT * FROM livro";
        return deLinhas(jdbcTemplate.queryForList(sql));
    }

    public List<Livro> listarOrdenadoPor(String coluna) {
        String sql = "SELECT * FROM livro";

        if (coluna != null && COLUNAS_PERMITIDAS.contains(coluna)) {
            sql = sql + " ORDER BY " + coluna;
        }

        return deLinhas(jdbcTemplate.queryForList(sql));
    }

    public Livro buscarPorId(Long id) {
        String sql = "SELECT * FROM livro WHERE id = ?";
        List<Map<String, Object>> linhas = jdbcTemplate.queryForList(sql, id);

        if (linhas.isEmpty()) {
            return null;
        }
        return Livro.deMap(linhas.get(0));
    }

    public void salvar(Livro livro) {
        String sql = "INSERT INTO livro (titulo, autor, ano, preco) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            livro.getTitulo(), livro.getAutor(), livro.getAno(), livro.getPreco());
    }

    public void atualizar(Livro livro) {
        String sql = "UPDATE livro SET titulo = ?, autor = ?, ano = ?, preco = ?";
        jdbcTemplate.update(sql,
            livro.getTitulo(), livro.getAutor(), livro.getAno(), livro.getPreco());
    }

    public void excluir(Long id) {
        String sql = "DELETE FROM livro WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    private List<Livro> deLinhas(List<Map<String, Object>> linhas) {
        List<Livro> livros = new ArrayList<>();
        for (Map<String, Object> linha : linhas) {
            livros.add(Livro.deMap(linha));
        }
        return livros;
    }
}
