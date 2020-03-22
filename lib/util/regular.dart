

class Regular{
  static final RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
  static final RegExp email = new RegExp(r"\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}");
  static final RegExp password = new RegExp(r"^[\w._=;,'-]{6,16}$");
}