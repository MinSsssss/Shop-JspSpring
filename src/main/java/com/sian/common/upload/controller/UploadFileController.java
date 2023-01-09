package com.sian.common.upload.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sian.product.dto.ProductAttachDTO;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
@Controller
public class UploadFileController {
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
//	@ResponseBody
//	@PostMapping(value="/admin/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<ProductAttachDTO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
//		
//		for(MultipartFile multipartFile: uploadFile) {
//			
//			File checkfile = new File(multipartFile.getOriginalFilename());
//			String type = null;
//			
//			try {
//				type = Files.probeContentType(checkfile.toPath());
//				
//				System.out.println("MIME TYPE : " + type);
//			} catch (IOException e) {
//				
//				e.printStackTrace();
//			}
//			
//			if(!type.startsWith("image")) {
//				
//				List<ProductAttachDTO> list = null;
//				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
//				
//			}
//			
//		}
//		
//		String uploadFolder = "C:\\upload";
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		
//		Date date = new Date();
//		
//		String str = sdf.format(date);
//		
//		String datePath = str.replace("-", File.separator);
//		
//		/* �대�� ���� */
//		File uploadPath = new File(uploadFolder, datePath);
//		
//		if(uploadPath.exists() == false) {
//			uploadPath.mkdirs();
//		}
//		List<ProductAttachDTO> list = new ArrayList<ProductAttachDTO>();
//		
//		for (MultipartFile multipartFile : uploadFile) {
//			ProductAttachDTO proAtt = new ProductAttachDTO();
//			
//			
//			
//			
//			
//			
//			String uploadFileName = multipartFile.getOriginalFilename();			
//			
//			proAtt.setFileName(uploadFileName);
//			proAtt.setUploadPath(datePath);
//			
//			String uuid = UUID.randomUUID().toString();
//			proAtt.setUuid(uuid);
//			
//			uploadFileName = uuid + "_" + uploadFileName;
//			
//			/* ���� ��移�, ���� �대��� �⑹� File 媛�泥� */
//			File saveFile = new File(uploadPath, uploadFileName);
//			
//			System.out.println(saveFile.canRead());
//			/* ���� ���� */
//			try {
////				
//				
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);				
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//				
//				
//				//鍮��� 
//				double ratio = 3;
//				//���� ����
//				int width = (int) (bo_image.getWidth() / ratio);
//				int height = (int) (bo_image.getHeight() / ratio);			
//				
//				Thumbnails.of(saveFile)
//				 .size(width, height)
//			     .toFile(thumbnailFile);
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			} 
//			list.add(proAtt);
//		}
//		ResponseEntity<List<ProductAttachDTO>> result = 
//				new ResponseEntity<List<ProductAttachDTO>>(list,HttpStatus.OK);
//		
//		return result;
//		
//	}
	
	
	
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}


	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
//
//
//
	@PostMapping(value = "/admin/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<ProductAttachDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			ProductAttachDTO attachDTO = new ProductAttachDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				// check image type ile
				if (checkImageType(saveFile)) {

					attachDTO.setFileType(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
//
//	@GetMapping("/display")	
//	@ResponseBody
//	public ResponseEntity<byte[]> getFile(String fileName) {
//
//		File file = new File("c:\\upload\\" + fileName);
//
//		ResponseEntity<byte[]> result = null;
//
//		try {
//			HttpHeaders header = new HttpHeaders();
//
//			header.add("Content-Type", Files.probeContentType(file.toPath()));
//			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	
//
//	@PostMapping("/deleteFile")
//	@ResponseBody
//	public ResponseEntity<String> deleteFile(String fileName, String type) {
//
//		
//
//		File file;
//
//		try {
//			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
//
//			file.delete();
//
//			if (type.equals("image")) {
//
//				String largeFileName = file.getAbsolutePath().replace("s_", "");
//
//				
//
//				file = new File(largeFileName);
//
//				file.delete();
//			}
//
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//		}
//
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//
//	}
}
