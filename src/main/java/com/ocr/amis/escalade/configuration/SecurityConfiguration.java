package com.ocr.amis.escalade.configuration;

import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    UtilisateurService utilisateurService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf()
                .disable()
                .authenticationProvider(getProvider())
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/").failureUrl("/login?error=loginError")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .and()
                .authorizeRequests()
                .antMatchers("/modifier*/**").authenticated()
                .antMatchers("/ajout*/**").authenticated()
                .antMatchers("/supprimer*/**").authenticated()
                .anyRequest().permitAll();
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(utilisateurService);
    }

    @Bean
    public AuthenticationProvider getProvider() {
        AppAuthProvider provider = new AppAuthProvider();
        provider.setUserDetailsService(utilisateurService);
        return provider;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
