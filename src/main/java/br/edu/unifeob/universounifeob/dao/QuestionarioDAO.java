/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unifeob.universounifeob.dao;

import br.edu.unifeob.universounifeob.infra.EMFactory;
import br.edu.unifeob.universounifeob.model.Opcao;
import br.edu.unifeob.universounifeob.model.Pergunta;
import br.edu.unifeob.universounifeob.model.Resposta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.ws.rs.core.Response;

/**
 *
 * @author osvaldogusmao
 */
public class QuestionarioDAO {

    private final EntityManager entityManager;

    public QuestionarioDAO() {
        this.entityManager = new EMFactory().getEntityManager();
    }

    public List<Pergunta> listaPerguntas() {
        return entityManager.createQuery("from Pergunta").getResultList();
    }

    public Pergunta carregaPergunta(Integer id) {
        return (Pergunta) entityManager.createQuery("from Pergunta where id=:id")
                .setParameter("id", id)
                .getSingleResult();
    }

    public Opcao carregaOpcao(Integer id) {
        return (Opcao) entityManager.createQuery("from Opcao where id=:id")
                .setParameter("id", id)
                .getSingleResult();
    }

    public Resposta salvaResposta(Resposta resposta) {
        Resposta salvo = null;
        entityManager.getTransaction().begin();
        salvo = entityManager.merge(resposta);
        entityManager.getTransaction().commit();
        return salvo;
    }

    public Resposta respondida(String identificaSessao, Integer perguntaId) {

        Query query = entityManager.createQuery("from Resposta where identificacao=:identificaSessao and pergunta_id=:perguntaId")
                .setParameter("identificaSessao", identificaSessao)
                .setParameter("perguntaId", perguntaId);

        try {
            return (Resposta) query.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }


    }
}
