/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unifeob.universounifeob.controller;

import br.edu.unifeob.universounifeob.dao.QuestionarioDAO;
import br.edu.unifeob.universounifeob.model.Opcao;
import br.edu.unifeob.universounifeob.model.Pergunta;
import br.edu.unifeob.universounifeob.model.Resposta;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author osvaldogusmao
 */
@Controller
@RequestMapping(value = "/questionario")
public class QuestionarioController {

    /**
     *
     * @param id
     * @param opcao
     * @param escolha
     * @param httpSessio
     * @return
     */
    @RequestMapping(value = "salva/{id}/{opcao}/{escolha}", method = RequestMethod.GET)
    public @ResponseBody String salva(@PathVariable Integer id, @PathVariable Integer opcao, @PathVariable Boolean escolha,
            HttpSession httpSessio){

        String nomeUsuario = httpSessio.getAttribute("nome").toString();
        String identificaSessao = httpSessio.getAttribute("identificaSessao").toString();
        String json = "ERROR";
        
        QuestionarioDAO dao = new QuestionarioDAO();
        
        Pergunta pergunta = dao.carregaPergunta(id);
        Opcao op = dao.carregaOpcao(opcao);

        Resposta respondida = dao.respondida(identificaSessao, id);
        
        if(respondida != null){
            json = "RESPONDIDA";
        }else{
            Resposta resposta = new Resposta();
            resposta.setNomeUsuario(nomeUsuario);
            resposta.setIdentificacao(identificaSessao);
            resposta.setOpcao(op);
            resposta.setPergunta(pergunta);
            resposta = dao.salvaResposta(resposta);
            
            if(resposta.getId() > 0){
                json = "PONTO";
            }else{
                json = "ERROR";
            }
        }

        return json;
    }
}
