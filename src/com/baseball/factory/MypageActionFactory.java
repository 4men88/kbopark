package com.baseball.factory;



import com.baseball.mypage.action.ModifyInfoAction;
import com.baseball.mypage.action.MypageMainAction;

public class MypageActionFactory {

   
   private static ModifyInfoAction modifyInfoAction;
   private static MypageMainAction mypageMainAction;
   
   
   
   static {
      modifyInfoAction = new ModifyInfoAction();
      mypageMainAction = new MypageMainAction();
   }

   
   public static ModifyInfoAction getModifyInfoAction() {
      return modifyInfoAction;
   }


   public static MypageMainAction getMypageMainAction() {
   
      return mypageMainAction;
   }



   
   
}