/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unifeob.universounifeob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author osvaldogusmao
 */
@Controller
@RequestMapping(value = "/identificacao")
public class IdentificacaoController {
    
    public String identificacao(){
        
        return "/identificacao/identifica";
    }
    
    
}
