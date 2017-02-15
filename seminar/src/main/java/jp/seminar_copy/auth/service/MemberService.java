package jp.seminar_copy.auth.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import jp.seminar.user.model.UserVO;
import jp.seminar.user.service.UserService;

public class MemberService implements UserDetailsService{
	
	@Autowired 
	UserService userService;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		UserVO userVO = userService.getUserByID(username);
		
		if(userVO == null){
			throw new UsernameNotFoundException("No user found with username" + userVO.getUser_name());
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		UserDetails user = new User(username, userVO.getUser_pw(), roles);
		System.out.println(user.getUsername());
		return user;
	}
}
