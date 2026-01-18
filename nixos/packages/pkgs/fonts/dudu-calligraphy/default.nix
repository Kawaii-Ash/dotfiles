{ stdenv, fetchzip }:

fetchzip {
  name = "dudu-calligraphy";
  extension = "zip";
  url = "https://dl.dafont.com/dl/?f=dudu_calligraphy";

  sha256 = "sha256-Slz1qilf6FNC1lwjHAwlD9OORjWNvdzOMhCJR1oNMSQ=";
}
