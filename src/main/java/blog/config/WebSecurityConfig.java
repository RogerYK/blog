package blog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth
//            .inMemoryAuthentication()
//                .withUser("root")
//                .password("{bcrypt}" + new BCryptPasswordEncoder().encode("root").trim())
//                .roles("ADMIN");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/admin/**").hasAuthority("ADMIN")
                .antMatchers("/account/profile/**").authenticated()
                .and()
            .formLogin()
                .loginPage("/account/login")
                .defaultSuccessUrl("/")
                .failureUrl("/account/login?error")
                .and()
            .logout()
                .logoutUrl("/account/logout")
                .logoutSuccessUrl("/");
    }
}
