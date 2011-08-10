// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  //ie reject
  if($.browser.msie)
{
  alert("程序不支持ie浏览器，请移步Firefox或Chorme")
}
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
    case "测试打回":
      $(this).find("a").attr("class","task_state_test_result_not_ready");
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
  init_task_history_form();
  set_show_view_task_state();
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

function  init_task_history_form(){
 $("#apply_to_test_in_task_history,#test_failed_in_task_history,#test_pass_in_task_history").click(function(){
   //pass state_id to select
    var dialog_title = $(this).html();
    var state_id = $(this).attr("name");
    $('#task_history_state_id').val(state_id);
    $('#task_history_form').dialog({ 
      title: dialog_title,
      height: 285,
      width:735,
      resizable: false
    });
    return false;
 }); 
}

function set_show_view_task_state(){
    var task_state_val = $("#task_show_view_state").html();
    switch(task_state_val)
  {
    case "需求已提交":
      $("#task_show_view_state").addClass("task_state_show_requirement_ready");
      break;
    case "任务已分配":
      $("#task_show_view_state").addClass("task_state_show_developing");
      break;
    case "已提交测试":
      $("#task_show_view_state").addClass("task_state_show_testing");
      break;
    case "已发布外网":
      $("#task_show_view_state").addClass("task_state_show_delivered");
      break;
    case "测试打回":
      $("#task_show_view_state").addClass("task_state_show_test_result_not_ready");
      break;
    case "测试已通过":
      $("#task_show_view_state").addClass("task_state_show_tested");
      break;
    default:
      break;
  }

}
