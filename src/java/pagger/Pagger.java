/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pagger;

/**
 *
 * @author Hp-Pc
 */
public class Pagger {

    private static String generateHyperLink(String label, String urlFormat, int page) {
        return "<a href=\"" + urlFormat + page + "\">" + label + "</a>";
    }

    public static String generate(int pageIndex, int pageSize, int total, String urlFormat, int gap) {

        // lấy tổng số trang
        int numberOfPage = total / pageSize + (total % pageSize == 0 ? 0 : 1);
        String result = "";

        // nếu chỉ có 1 trang => không phân trang
        if (numberOfPage == 1) {
            return result;
        }

        // nếu trang hiện tại> gap +1 => tạo trang đầu tiên
        if (pageIndex > gap + 1) {
            result += generateHyperLink("First", urlFormat, 1);
        }

        // tao cac trang truoc va sau trang index
        //pageindex thi k la link
        for (int i = pageIndex - gap; i <= pageIndex + gap; i++) {
            if (i > 0 && i != pageIndex && i <= numberOfPage) {
                result += "\t" + generateHyperLink("" + i, urlFormat, i);
            } else if (i == pageIndex) {
                result += "\t" + pageIndex;
            }
        }

        //sau khi tao cac page trc thi hien thi page cuoi
        if (pageIndex < numberOfPage - gap) {
            result += "\t" + generateHyperLink("Last", urlFormat, numberOfPage);
        }

        return result;
    }

}
