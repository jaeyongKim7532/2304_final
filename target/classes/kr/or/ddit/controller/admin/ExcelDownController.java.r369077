package kr.or.ddit.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IAdminEmpService;
import kr.or.ddit.vo.EmpVO;

@Controller
public class ExcelDownController {

	@Inject
	private IAdminEmpService service;

	// 급여명세서 양식 다운로드
	@ResponseBody
	@PostMapping(value = "/excelFormDown.do", produces = "text/plain; charset=utf-8")
	public String ExcelFormDown(HttpServletRequest request) throws IOException {
		List<EmpVO> empList = service.selectList();
		String uploadPath = "E:/temp";
		File uploadFolder = new File(uploadPath);
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
	
		try (InputStream is = new FileInputStream("E:\\99.JSP_SPRING\\02.SPRING2\\workspace_spring2\\Groupware_final\\src\\main\\webapp\\resources\\assets\\gw\\payForm.xlsx");	OutputStream os = new FileOutputStream(uploadPath+"/payForm.xlsx")) 
		{
			Context context = new Context();
			context.putVar("empList", empList);
			JxlsHelper.getInstance().processTemplate(is, os, context);
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}

		return "ok";
	}
	
	@ResponseBody
	@PostMapping(value = "/regiserFormDown.do", produces = "text/plain; charset=utf-8")
	public String regiserFormDown() {
		System.out.println("registerForm 을 타나 ");
		String uploadPath = "E:/temp";
		File uploadFolder = new File(uploadPath);
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		try (InputStream is = new FileInputStream("E:\\99.JSP_SPRING\\02.SPRING2\\workspace_spring2\\Groupware_final\\src\\main\\webapp\\resources\\assets\\gw\\regiserForm.xlsx");	OutputStream os = new FileOutputStream(uploadPath+"/regiserForm.xlsx")) 
		{
			Context context = new Context();
			JxlsHelper.getInstance().processTemplate(is, os, context);
			return "ok";
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}
		
	}

}
