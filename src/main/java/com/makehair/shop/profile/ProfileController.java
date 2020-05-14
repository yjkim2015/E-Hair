package com.makehair.shop.profile;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.makehair.shop.commom.util.CommonController;
import com.makehair.shop.commom.util.MediaUtils;
import com.makehair.shop.commom.util.UploadFileUtils;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.common.constants.ResultVo;
import com.makehair.shop.common.constants.SearchCriteria;

@Controller
public class ProfileController extends CommonController {
	@Autowired
	private ProfileService profileService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test() {
		
		return "profile/test";
	}
	
	@RequestMapping(value="/allProfile", method = RequestMethod.GET)
	public String allProfile(@ModelAttribute("cri") SearchCriteria cri, Model model) {
	
		model.addAttribute("list",profileService.selectAllProfile(cri));
		return "profile/list";
	}
	
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public String profile(Model model, CommonUserVo adminVo) {
		
		model.addAttribute("userId", adminVo.getUserId());
		return "profile/profileView";
	}
	
	@RequestMapping(value="/profile/detail", method = RequestMethod.GET)
	public String profileDetail(Model model, CommonUserVo adminVo) {
		
		//model.addAttribute("userId", adminVo.getUserId());
		model.addAttribute("adminNo", adminVo.getAdminNo());
		return "profile/profileDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/profileView", method = RequestMethod.GET)
	public ResponseEntity<ResultVo> profileView(Model model, CommonUserVo adminVo) {
		
		ResultVo resultVo = null;
		
		try {
			CommonUserVo result = profileService.selectProfile(adminVo);
			System.out.println(result.toString());
			resultVo = new ResultVo(HttpStatus.OK);
			resultVo.setData(result);
		}
		catch(Exception ex) {
			resultVo = new ResultVo(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultVo.build();
	}
	
	@ResponseBody
	@RequestMapping(value="/profileUpdate", method = RequestMethod.POST)
	public ResponseEntity<ResultVo> profileUpdate(String profile, String imgUrl, String userId){
		
		ResultVo resultVo = null;
		CommonUserVo adminVo = new CommonUserVo();
		adminVo.setProfile(profile);
		adminVo.setImgUrl(imgUrl.replace("s_", ""));
		adminVo.setUserId(userId);
		int result = profileService.updateProfile(adminVo);
		resultVo = new ResultVo(result, HttpStatus.OK);
		
		return resultVo.build();
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadProfileImg", method = RequestMethod.POST ,produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadProfileImg(MultipartFile file) throws Exception {
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath,
						file.getOriginalFilename(),
						file.getBytes()),
						HttpStatus.CREATED);
	}
	
	@ResponseBody 
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if ( mType != null ) {
				headers.setContentType(mType);
			}
			else {
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" +
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
				
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers, HttpStatus.CREATED);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		finally {
			in.close();
		}
		
		return entity;
	}
	
}
