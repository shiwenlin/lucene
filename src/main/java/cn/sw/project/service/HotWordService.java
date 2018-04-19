package cn.sw.project.service;

import cn.sw.project.bean.HotWord;

import java.util.List;
import java.util.Map;

public interface HotWordService {

    List<HotWord> getHotWrods(Map<String,Object> param);

    int addHotWord(HotWord hotWord);

    void updateHotWord(Integer num,String keyword);
}
