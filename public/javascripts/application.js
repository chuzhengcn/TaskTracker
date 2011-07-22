// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  //add task_state
  $(".task_state").each(function(){
    var task_state_val = $(this).find("a").html();
    switch(task_state_val)
  {
    case "需求已提交":
      $(this).find("a").attr("class","task_state_requirement_ready");
      break;
    case "任务已分配":
      $(this).find("a").attr("class","task_state_developing");
      break;
    case "已提交测试":
      $(this).find("a").attr("class","task_state_testing");
      break;
    case "已发布外网":
      $(this).find("a").attr("class","task_state_delivered");
      break;
    case "需求未提交":
      $(this).find("a").attr("class","task_state_requirement_not_ready");
      break;
    case "测试已通过":
      $(this).find("a").attr("class","task_state_tested");
      break;
    default:
      $(this).find("a").attr("class","");
      break;
  }
  });
  add_flash_notice_style();
  add_selected_link();
  add_data_picker();
});

//add_flash_notice_style
function add_flash_notice_style(){
  if($(".flash_notice").html()!="")
  {
    $(".flash_notice").addClass("set_flash_notice_dispaly");
  }
}
//add_selected_link();
function add_selected_link(){
    var current_loaction_pathname = location.pathname;
    $(".sub_nav a").each(function(){
      var currentNavLink = $(this).attr("href");
      if(currentNavLink==current_loaction_pathname)
    {
      $(this).addClass("selected");
    }
    });
}

function add_data_picker(){
$("input.datepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            dateFormat: 'yy-mm-dd',
            monthNamesShort: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            yearRange: '-1:+1',
            duration: 'fast'
            });  
}
