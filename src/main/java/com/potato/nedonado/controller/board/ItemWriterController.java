package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.service.board.ItemWriteService;
import com.potato.nedonado.util.CategoryUtil;
import com.potato.nedonado.util.ConfigUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("/board/write")
public class ItemWriterController {
    @Autowired
    ItemWriteService itemWriteService;

    @GetMapping
    public ModelAndView writeItem(
            HttpServletRequest request
    ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemCategory", CategoryUtil.categoryNames);
        mav.setViewName("/board/writeitem");
        return mav;
    }

    @PostMapping
    public String writeItem(
            HttpServletRequest request,
            @RequestParam(required = false) ItemEntity itemEntity
    ) {
        return null;
    }

    @PostMapping("/upload")
    public ResponseEntity<> writeItem(
            MultipartHttpServletRequest multipartRequest,
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();

        try {
            multipartRequest.setCharacterEncoding("utf-8");
            // 파일을 업로드한 후 반환된 파일 이름이 저장되는 fileList를 다시 map에 저장할 것이다
            fileProcess(multipartRequest);
        } catch (Exception e) {
            return new ResponseEntity<>("insert Fail!!!", httpHeaders, HttpStatus.EXPECTATION_FAILED);
        }

        httpHeaders.set("some-header", "some-value");
        return new ResponseEntity<>("insert OK", httpHeaders, HttpStatus.OK);
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
