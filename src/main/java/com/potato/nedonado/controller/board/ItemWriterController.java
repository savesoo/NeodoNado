package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.util.ConfigUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/board/write")
public class ItemWriterController {

    @GetMapping
    public String writeItem(
            HttpServletRequest request
    ) {
        return null;
    }

    @PostMapping
    public String writeItem(
            HttpServletRequest request,
            @RequestParam(required = false) ItemEntity itemEntity,
            MultipartHttpServletRequest multipartRequest
    ) {
        return null;
    }

    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
        String CURR_IMAGE_REPO_PATH = (String) ConfigUtil.getConfig("");

        List<String> fileList= new ArrayList<String>();

        // 첨부된 파일 이름을 가져올 것이다
        Iterator<String> fileNames = multipartRequest.getFileNames();

        while(fileNames.hasNext()){
            String fileName = fileNames.next();

            log.info(fileName);

            // 파일 이름에 대한 MultipartFile 객체 가져오기
            MultipartFile mFile = multipartRequest.getFile(fileName);
            // 실제 파일 이름 가져오기
            String originalFileName=mFile.getOriginalFilename();
            // 파일 이름을 하나씩 fileList에 저장하기
            fileList.add(originalFileName);

            File file = new File( CURR_IMAGE_REPO_PATH +"\\"+ fileName);

            // 첨부된 파일이 존재하는지 체크
            if(mFile.getSize()!=0){
                //경로상에 파일이 존재하지 않을 경우
                if(! file.exists()) {
                    //경로에 해당하는 디렉토리를 만들어라
                    if(file.getParentFile().mkdirs()){
                        // 그 후에 파일을 생성해라
                        file.createNewFile();
                    }
                }
                // 임시로 저장된 mutilpartFile을 실제 파일로 저장
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
            }
        }
        // 첨부한 파일 이름이 저장된 fileList 반환해줘라
        return fileList;
    }
}
