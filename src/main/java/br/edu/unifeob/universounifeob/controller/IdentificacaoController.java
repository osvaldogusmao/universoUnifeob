/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unifeob.universounifeob.controller;

import br.edu.unifeob.universounifeob.dao.QuestionarioDAO;
import br.edu.unifeob.universounifeob.model.Pergunta;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author osvaldogusmao
 */
@Controller
@RequestMapping(value = "/identificacao")
public class IdentificacaoController {
    
    @RequestMapping(value = "/identifica")
    public String identificacao(){
        return "/identificacao/identifica";
    }
    
    @RequestMapping(value = "/iniciar")
    public String criaSessao(String nome, String identificaSessao, HttpSession httpSession, Model model){
        
        httpSession.setAttribute("nome", nome);
        httpSession.setAttribute("identificaSessao", identificaSessao);
        
        List<Pergunta> perguntas = new QuestionarioDAO().listaPerguntas();
        
        model.addAttribute("perguntas", perguntas);
        
        return "/questionario/questionario";
    }
}