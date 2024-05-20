package com.sky.lms_web_service.common;


import com.sky.lms_web_service.dto.BoardFile;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
public class FileUtils {

	public List<BoardFile> parseFileInfo(int boardIdx, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		if (ObjectUtils.isEmpty(multipartHttpServletRequest)) {
			return null;
		}

		List<BoardFile> fileList = new ArrayList<>();

		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		ZonedDateTime current = ZonedDateTime.now();
		String basePath = "C:\\path\\to\\your\\directory" + current.format(format); // 수정된 경로
		File baseDir = new File(basePath);
		if (!baseDir.exists()) {
			baseDir.mkdirs();
		}

		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			List<MultipartFile> multipartFiles = multipartHttpServletRequest.getFiles(uploadFileName);

			for (MultipartFile multipartFile : multipartFiles) {
				if (!multipartFile.isEmpty()) {
					String originalFilename = multipartFile.getOriginalFilename();
					String storedFilePath = basePath + File.separator + originalFilename;

					File file = new File(storedFilePath);
					int fileCnt = 1;
					while (file.exists()) {
						String fileNameOnly = originalFilename.substring(0, originalFilename.lastIndexOf('.'));
						String fileExtension = originalFilename.substring(originalFilename.lastIndexOf('.'));
						storedFilePath = basePath + File.separator + fileNameOnly + "_" + fileCnt + fileExtension;
						file = new File(storedFilePath);
						fileCnt++;
					}

					BoardFile boardFile = new BoardFile();
					boardFile.setBoardIdx(boardIdx);
					boardFile.setFileSize(multipartFile.getSize());
					boardFile.setOriginalFileName(originalFilename);
					boardFile.setStoredFilePath(storedFilePath);
					fileList.add(boardFile);

					multipartFile.transferTo(file);
				}
			}
		}
		return fileList;
	}
}
