import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/ui/notification/notification.dart';

class NotificationService {	
  static Future<void> initialNotification() async{   
    await AwesomeNotifications().initialize(
      null, 
      [
        NotificationChannel(
        channelGroupKey: 'high_importante_channel',
        channelKey: 'high_importante_channel', 
        channelName: 'Basic Notification', 
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        importance: NotificationImportance.Max,     
        ledColor: Colors.white,
        channelShowBadge: true,  
        onlyAlertOnce: true,
        playSound: true,    
        criticalAlerts: true,
       )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'high_importante_channel_group', 
        channelGroupName: 'Grupo 1',
      )
    ],
    debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async{
        if(!isAllowed){
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      }
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  //Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification) async {
      debugPrint('onNotificationCreatedMethod');
    }

   //Use this method to detect every time that a new notification is displayed
   static Future<void> onNotificationDisplayedMethod(
     ReceivedNotification receivedNotification) async {
      debugPrint('onNotificationDisplayedMethod');
    }

    //Use this method to detectif the user dismissed a notification
    static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
        debugPrint('onDismissActionReceivedMethod');
    }

    //Use this method to detect when the user taps on a notification or action button
    static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
        debugPrint('onActionReceivedMethod');
        final payload = receivedAction.payload ?? {}; 
        if(payload["navigate"] == "true"){
          Get.to(NotificaPage());    
        }
      }  


    static Future<void> showNotification({
        required final String title,
        required final String body,
        final String? sumary,
        final Map<String, String>? payload,
        final ActionType actionType = ActionType.Default,
        final NotificationLayout notificationLayout = NotificationLayout.Default,
        final NotificationCategory? category,
        final bool wakeUpScreen = false,
        final int? hour,
        final int? minute,
        final int? second,
        //final autoDismissible = false,
        final String? bigPicture,
        final List<NotificationActionButton>? actionButtons,
        final bool schedule = false,        
        required DateTime scheduleTime,
        final int? interval,
      }) async {
       // assert(!schedule || (schedule && interval != null));
      DateTime date30DaysBefore = scheduleTime.subtract(Duration(days: 30));
      DateTime date15DaysBefore = scheduleTime.subtract(Duration(days: 15));
      DateTime date7DaysBefore = scheduleTime.subtract(Duration(days: 7));

     // Agendar a notificação para 30 dias antes
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'high_importante_channel',
          title: title,
          body: 'Faltam 30 dias! $body',
          notificationLayout: notificationLayout,
          actionType: actionType,
          summary: sumary, 
          category: category,        
          payload: payload,      
          wakeUpScreen: wakeUpScreen,
        ), 
        schedule: NotificationCalendar.fromDate(date: date30DaysBefore),
      );

      // Agendar a notificação para 15 dias antes
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 2,
          channelKey: 'high_importante_channel',
          title: title,
          body: 'Faltam 15 dias! $body',
          notificationLayout: notificationLayout,
          actionType: actionType,
          summary: sumary,
          category: category,      
          payload: payload,      
          wakeUpScreen: wakeUpScreen,
        ),
        schedule: NotificationCalendar.fromDate(date: date15DaysBefore),
      );

      // Agendar a notificação para 7 dias antes
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: 'high_importante_channel',
          title: title,
          body: 'Faltam 7 dias! $body',
          notificationLayout: notificationLayout,
          actionType: actionType,
          summary: sumary,
          category: category,      
          payload: payload,      
          wakeUpScreen: wakeUpScreen,
        ),
        schedule: NotificationCalendar.fromDate(date: date7DaysBefore),
      );
    await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1, 
      channelKey: 'high_importante_channel',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: sumary,
      category: category,
      payload: payload,
      wakeUpScreen: wakeUpScreen,
      ),
      actionButtons: actionButtons,
      schedule: schedule 
        ? NotificationCalendar.fromDate(
          date: scheduleTime,
        )
      : null,             
  );
}
}