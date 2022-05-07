




import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zl.pojo.Emp;
import com.zl.pojo.FenYe;
import com.zl.pojo.Role;
import com.zl.pojo.Student;
import com.zl.service.EmpService;
import com.zl.service.RoleService;
import com.zl.service.StudentService;


class AdviceServiceImplTest {

	public static void main(String[] args) {
		ApplicationContext app = new ClassPathXmlApplicationContext("classpath:springIOC.xml");
		/*EmpService c = app.getBean(EmpService.class);		
		Emp emp =  c.findEmp(202);
		System.out.println("emp====="+emp);
*/
		/*RoleService rs = app.getBean(RoleService.class);
		Role role = rs.queryRoleById(100);
		System.out.println(role.toString());*/
		
		StudentService ss = app.getBean(StudentService.class);
		Student s = new Student();
		s.setScore2(99);
		s.seteId(1);
		int num = ss.upScore(s);
	   System.out.println("num=="+num);	
	
		
		
	}
}
