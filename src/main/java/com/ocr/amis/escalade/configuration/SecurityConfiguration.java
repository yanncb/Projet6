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
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    UtilisateurService utilisateurService;

    private AccessDeniedHandler accessDeniedHandler;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

//    @Bean
//    public DaoAuthenticationProvider authenticationProvider() {
//        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
//        auth.setPasswordEncoder(passwordEncoder());
//        return auth;
//    }
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.authenticationProvider(authenticationProvider());
//    }

//
//    @Autowired
//    private DataSource dataSource;

//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.jdbcAuthentication()
//                .dataSource(dataSource)
//                .usersByUsernameQuery("SELECT util_pseudo, utill_mot_de_passe, true "
//                        + "FROM t_utilisateur "
//                        + "WHERE util_pseudo =?")
//                .authoritiesByUsernameQuery("SELECT util_pseudo, rol_nom "
//                        + "FROM t_utilisateur u "
//                        + "LEFT JOIN t_role_utilisateur "
//                        + "ON t_role_utilisateur.role_id = u.utilisateur_id "
//                        + "LEFT JOIN t_role "
//                        +"ON t_role.role_id = u.utilisateur_id "
//                        + "WHERE  util_pseudo = ?");
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .antMatchers("/modifier*/**").authenticated()
//                .antMatchers("/ajout*/**").authenticated()
//                .antMatchers("/supprimer*/**").authenticated()
//                .anyRequest().permitAll()
//                .and()
//                .formLogin().loginPage("/login").defaultSuccessUrl("/").failureUrl("/login?error=loginError")
//                .usernameParameter("pseudo").passwordParameter("password")
//                .and()
//                .logout().invalidateHttpSession(true)
//                .logoutUrl("/logout")
//                .logoutSuccessUrl("/login")
//                .and()
//                .csrf()
//                .and()
//                .sessionManagement().maximumSessions(1).expiredUrl("/login");
//
//    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf()
                .disable()
                .authenticationProvider(getProvider())
                .formLogin()
                .loginProcessingUrl("/login")
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

    private class AuthentificationLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
        @Override
        public void onAuthenticationSuccess(HttpServletRequest request,
                                            HttpServletResponse response, Authentication authentication)
                throws IOException, ServletException {
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    private class AuthentificationLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
        @Override
        public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                                    Authentication authentication) throws IOException, ServletException {
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    @Bean
    public AuthenticationProvider getProvider() {
        AppAuthProvider provider = new AppAuthProvider();
        provider.setUserDetailsService(userDetailsService());
        return provider;
    }
}





