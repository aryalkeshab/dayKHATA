enum APIPath { login, register, ticket, categoryList, userList }
// class APIPath {

// }
// class login extends APIPath{

// }

class APIPathHelper {
  // home

  static const String apiUrl = "http://www.daykhata.helpnepaltax.com.np/api";

  // static const String imageUrl = "http://172.20.10.4:2222";

  static String authAPIs(
    APIPath path, {
    String? keyword,
    String? id,
  }) {
    switch (path) {
      case APIPath.login:
        return "/adminUserLogin";

      case APIPath.register:
        return "/addAdminUser";
      default:
        return "";
    }
  }

  static String userListAPIs(
    APIPath path, {
    String? keyword,
    String? id,
  }) {
    switch (path) {
      case APIPath.userList:
        return "/searchPartyName/$keyword/Sundry Debtors/2";
      default:
        return "";
    }
  }

  // static String userTicketUsed(
  //   APIPath path, {
  //   String? keyword,
  //   String? uuid,
  // }) {
  //   switch (path) {
  //     case APIPath.ticket:
  //       return "/account/users/${uuid}/ticket/";

  //     case APIPath.categoryList:
  //       return "/account/ticket-category/";
  //     default:
  //       return "";
  //   }
  // }
}
