

class Regular{
  static final RegExp mobile = new RegExp(r"(13\d|14[579]|15[^4\D]|17[^49\D]|18\d)\d{8}");
  static final RegExp email = new RegExp(r"\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}");
  static final RegExp password = new RegExp(r"^[\w._=;,'-]{6,16}$");
}