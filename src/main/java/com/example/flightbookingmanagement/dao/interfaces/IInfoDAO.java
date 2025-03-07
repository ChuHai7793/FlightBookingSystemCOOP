package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.dto.InfoDTO;

public interface IInfoDAO {
    InfoDTO getUserInfo(int userId);
    boolean updateUserInfo(InfoDTO userInfo);
}
