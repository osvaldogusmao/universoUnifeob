/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unifeob.universounifeob.dao;

import br.edu.unifeob.universounifeob.infra.EMFactory;
import br.edu.unifeob.universounifeob.model.Pergunta;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author osvaldogusmao
 */
public class QuestionarioDAO {

    private final EntityManager entityManager;
    
    public QuestionarioDAO() {
        this.entityManager = new EMFactory().getEntityManager();
    }

    public List<Pergunta> listaPerguntas(){
        return entityManager.createQuery("from Pergunta").getResultList();
    }
    
    
}
