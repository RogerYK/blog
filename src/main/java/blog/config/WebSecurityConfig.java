package blog.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

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
