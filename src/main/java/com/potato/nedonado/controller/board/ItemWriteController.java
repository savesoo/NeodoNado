package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.board.ItemWriteService;
import com.potato.nedonado.util.CategoryUtil;
import com.potato.nedonado.util.ConfigUtil;
import com.potato.nedonado.util.Util;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("/board/write")
public class ItemWriteController {
    @Autowired
    ItemWriteService itemWriteService;

    @GetMapping
    public ModelAndView writeItem(
            HttpServletRequest request
    ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemCategory", CategoryUtil.categoryNames);
        mav.setViewName("/board/itemwrite");
        return mav;
    }

    @PostMapping
    public ResponseEntity<String> writeItem(
            HttpServletRequest request,
            @RequestBody ItemEntity itemEntity
    ) {
        log.info(itemEntity);

        HttpHeaders httpHeaders = new HttpHeaders();

        if((itemEntity.getTitle() == null  || itemEntity.getTitle().isEmpty())
        || (itemEntity.getContent() == null  || itemEntity.getContent().isEmpty())
        || (itemEntity.getPrice() <= 0)) {
            return new ResponseEntity<>(null, httpHeaders, HttpStatus.BAD_REQUEST);
        }

        LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
        if(loginInfo == null) {
            return new ResponseEntity<>("/user/login", httpHeaders, HttpStatus.BAD_REQUEST);
        }

        log.info(loginInfo);

        itemEntity.setUserIdx(loginInfo.getUserIdx());
        itemEntity.setWriteDate(Util.getCurrentTimestamp());

        log.info(itemEntity);
        int result = itemWriteService.writeItem(itemEntity);

        return new ResponseEntity<>("/board/list", httpHeaders, HttpStatus.OK);
    }

    @PostMapping("/upload")
    public ResponseEntity<Map<String, List<String>>> writeItem(
            MultipartHttpServletRequest multipartRequest,
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();
        //List<String> nameList = null;
        Map<String, List<String>> nameList = null;

        try {
            multipartRequest.setCharacterEncoding("utf-8");
            // ????????? ???????????? ??? ????????? ?????? ????????? ???????????? fileList??? ?????? map??? ????????? ?????????
            //nameList = fileProcess(multipartRequest);
            nameList = fileProcess(multipartRequest);
        } catch (Exception e) {
            log.error(e.getMessage());
            log.error(e.getStackTrace());
            return new ResponseEntity<>(null, httpHeaders, HttpStatus.EXPECTATION_FAILED);
        }

        httpHeaders.set("some-header", "some-value");
        return new ResponseEntity<>(nameList, httpHeaders, HttpStatus.OK);
    }

    private Map<String, List<String>> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
        String CURR_IMAGE_REPO_PATH = (String) ConfigUtil.getConfig("fileSaveDir");

        List<String> fileList= new ArrayList<String>();
        List<String> thumbnailName = null;

        // ????????? ?????? ????????? ????????? ?????????
        Iterator<String> fileNames = multipartRequest.getFileNames();
        int count = 0;

        while(fileNames.hasNext()){
            String fileName = fileNames.next();

            log.info(fileName);

            // ?????? ????????? ?????? MultipartFile ?????? ????????????
            MultipartFile mFile = multipartRequest.getFile(fileName);
            // ?????? ?????? ?????? ????????????
            //String originalFileName = mFile.getOriginalFilename();
            String originalFileName = "T"+ Util.getCurrentTimestamp() + "." +mFile.getContentType().split("/")[1];
            // ?????? ????????? ????????? fileList??? ????????????
            fileList.add(originalFileName);

            File file = new File( CURR_IMAGE_REPO_PATH +"\\"+ fileName);

            // ????????? ????????? ??????????????? ??????
            if(mFile.getSize()!=0){
                //???????????? ????????? ???????????? ?????? ??????
                if(! file.exists()) {
                    //????????? ???????????? ??????????????? ????????????
                    if(file.getParentFile().mkdirs()){
                        // ??? ?????? ????????? ????????????
                        file.createNewFile();
                    }
                }
                // ????????? ????????? mutilpartFile??? ?????? ????????? ??????
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //????????? ????????? multipartFile??? ?????? ????????? ??????
                if(count++ == 0){
                    thumbnailName = thumbnailFile(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName);
                }
            }
        }
        // ????????? ?????? ????????? ????????? fileList ???????????????
        Map<String, List<String>> map = new HashMap<>();
        map.put("fileList", fileList);
        map.put("thumbnail", thumbnailName);
        return map;
    }

    private List<String> thumbnailFile(
            String oPath // ?????? ??????
    ) {
        List<String> list = new ArrayList<>();
        File oFile = new File(oPath);

        int index = oPath.lastIndexOf(".");
        String ext = oPath.substring(index + 1); // ?????? ?????????

        String tPath = (String)ConfigUtil.getConfig("fileSaveDir") + "/thumbnail/" + oFile.getName(); // ??????????????? ??????
        log.info(tPath);
        File tFile = new File(tPath);

        try {
            BufferedImage oImage = ImageIO.read(oFile); // ???????????????
            int tWidth = 128; // ????????? ????????????????????? ??????
            int tHeight = 128; // ????????? ????????????????????? ??????

            BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // ??????????????????
            Graphics2D graphic = tImage.createGraphics();
            Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
            graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
            graphic.dispose(); // ???????????? ?????? ??????

            ImageIO.write(tImage, ext, tFile);
            list.add(oFile.getName());
        } catch (IOException e) {
            e.printStackTrace();
            log.error(e.getMessage());
            log.error(e.getStackTrace());
        }
        return list;
    }
}
