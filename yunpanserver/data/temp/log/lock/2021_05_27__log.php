<?php exit;?>
[21:13:26.127]  lock error;time=5;;{
    "0": "C:\\phpstudy_pro\\WWW\\yunpanserver\\index.php[6] {415}#Application->run()",
    "1": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {415}#Application->appRun("admin.setting.clearCache")",
    "2": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] ActionCall("admin.setting.clearCache")",
    "3": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] ActionApply("admin.setting.clearCache",[])",
    "4": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {407}#adminSetting->clearCache()",
    "5": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\controller\\admin\\setting.class.php[108] {b2d}#explorerAttachment->clearCache()",
    "6": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\controller\\explorer\\attachment.class.php[73] KodIO::systemFolder("attachmentTemp/")",
    "7": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] Cache::get("{source:19}/attachmentTemp/")",
    "8": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] CacheLock::lock("{source:19}/attachmentTemp/")",
    "memory": "8.530M"
}
[21:13:35.963]  lock error;time=5;;{
    "0": "C:\\phpstudy_pro\\WWW\\yunpanserver\\index.php[6] {0a0}#Application->run()",
    "1": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {0a0}#Application->appRun("user.view.call")",
    "2": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] ActionCall("user.view.call")",
    "3": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] ActionApply("user.view.call",[])",
    "4": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {914}#userView->call()",
    "5": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\controller\\user\\view.class.php[112] AutoTask::start()",
    "6": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] AutoTask::valueGet("status")",
    "7": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {880}#SystemOptionModel->get("status","System.autoTask")",
    "8": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {880}#SystemOptionModel->cacheGet("System.autoTask")",
    "9": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] Cache::get("SystemOption_System.autoTask")",
    "10": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] CacheLock::lock("SystemOption_System.autoTask")",
    "memory": "8.713M"
}
[21:13:35.965]  lock error;time=5;;{
    "0": "beforeShutdown()",
    "1": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] Hook::trigger("beforeShutdown")",
    "2": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] Hook::apply("AutoTask.shutdownEvent",[])",
    "3": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] ActionApply("AutoTask.shutdownEvent",[])",
    "4": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {3fe}#AutoTask->shutdownEvent()",
    "5": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] AutoTask::valueSet("running","0")",
    "6": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {880}#SystemOptionModel->set("running","0","System.autoTask")",
    "7": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] {880}#SystemOptionModel->cacheRemove("System.autoTask")",
    "8": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] Cache::remove("SystemOption_System.autoTask")",
    "9": "C:\\phpstudy_pro\\WWW\\yunpanserver\\app\\autoload.php[2] CacheLock::lock("SystemOption_System.autoTask")",
    "memory": "8.703M"
}
