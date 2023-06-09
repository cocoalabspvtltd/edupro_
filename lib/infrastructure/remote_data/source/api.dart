class Api {
  static String registerWithEmailAndPassword = 'api/register';
  static String logInWithEmailAndPassword = 'api/user/login';
  static String eduproUserVerification = 'api/verification';
  static String getMyProfile = 'api/user/profile';
  static String editMyProfile = 'api/user/update_profile';
  static String updateDisplayPicture = 'api/user/update_profile_picture';
  static String changePassword = 'api/user/change_password';
  static String getMembershipDetails = 'api/user/membership';
  static String getMyCources = 'api/my_courses';
  static String getInstructorCources = 'api/course_list';
  static String getMyCourseVideos = 'api/classes';
  static String getCount = 'api/count_list';
  static String getQuestions = 'api/get_questions';
  static String askQuestion = 'api/ask_question';
  static String submitAnswer = 'api/submit_answer';
  static String getAnswers = 'api/get_answers';
  static String deleteAnswer = 'api/delete_answer';
  static String courseAnnouncements = 'api/course_announcement';
  static String getAdsList = 'api/ad_list';
  static String getCourseReport = 'api/my_courses/report';
  static String getCourseCategories = 'api/category';
  static String getCoursesInCategory = 'api/list_courses';
  static String getTrendingVideos = 'api/trending-videos';
  static String getTopVideos = 'api/top-videos';
  static String getLiveVideos = 'api/live-videos';
  static String getPaymentData = 'api/payment_order';
  static String postOaymentId = 'api/payment';
  static String getHotelList = 'api/hotel-list';
  static String getVoucherList = 'api/voucher-list';
  static String getBidList = 'api/bid_products';
  static String getLiveProductList = 'api/live/bid_products';
  static String getUpcomingProductList = 'api/upcoming/bid_products';
  static String getClosedProductList = 'api/closed/bid_products';
  static String getProductDetails = 'api/products_details';
  static String getCrowd = 'api/oranizations';
  static String getCrowdDetails = 'api/organization_details';
  static String getBidInstructionsList = 'api/luckydraw_instructions';

  ///////////////////////////////////////////////////INSTRUCTOR//////////////////////////////////////
  static String addCourses = "api/instructor/add_course";
  static String addInstructors = "api/create_instructor";
  static String addCoursesInstitution="api/institution/add_course";
  static String addClassesInstitution="api/institution/add_class";
  ////////////////////////////////////////INSISTUTION//////////////////////////
  static String insistutionCategoriesList = "api/course_list";
  static String insistutionStudentadd = "api/create_students";
  static String insistutionStudentEdit = 'api/edit_student';
  static String insistutionInstructorEdit = 'api/edit_instructor';
  static String insistutionCourseEdit = 'api/edit_course ';
  static String insistutionClassList = 'api/institution/class_list';
  static String deletionStudent = 'api/delete_student';
  static String deletionClass = 'api/institution/delete_class';
  static String deletionInstructor = 'api/delete_instructor';
  static String deletionCourse = 'api/institution/delete_course';
  static String getDepartmentschool = 'api/institution/department_list';
  static String deletionDepartment = 'api/institution/remove_department';
  static String addDepartmentSchool = 'api/institution/add_department';
  static String editDepartemnt="api/institution/update_department";
}
