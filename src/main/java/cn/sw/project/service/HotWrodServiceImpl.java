package cn.sw.project.service;

import cn.sw.project.bean.HotWord;
import cn.sw.project.dao.HotWordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HotWrodServiceImpl implements HotWordService {

    @Autowired
    HotWordMapper hotWordMapper;

    @Override
    public List<HotWord> getHotWrods(Map<String,Object> param) {
        return hotWordMapper.queryHotWordsList(param);
    }

    @Override
    public int addHotWord(HotWord hotWord) {
        return hotWordMapper.add(hotWord);
    }

    @Override
    public void updateHotWord(Integer num, String keyword) {
        hotWordMapper.update(num,keyword);
    }
}
