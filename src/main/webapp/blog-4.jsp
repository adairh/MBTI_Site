<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/6/2023
  Time: 9:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url = "insert/uphead.html" />
<title>MBTI, PHỔ BIẾN LIỆU CÓ ĐI KÈM VỚI CHẤT LƯỢNG?</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Add your custom CSS styles here if needed */
    body {
      background-color: #f8f9fa;
    }
    .article-container {
      background-color: #ffffff;
      padding: 20px;
      margin: 20px auto;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
  </style>
<c:import url = "insert/header.html" />
<div class="container">
  <div class="article-container">
    <div class="article-main__content max-w-[744px]">
      <p>MBTI là bài test tính cách (personality) phổ biến nhất thế giới, <a href="https://www.washingtonpost.com/national/on-leadership/myers-briggs-does-it-pay-to-know-your-type/2012/12/14/eaed51ae-3fcc-11e2-bca3-aadc9b7e29c5_story.html" target="_blank" rel="nofollow noopener">hiện nay</a> có khoảng 2 triệu người thực hiện bài test này mỗi năm đem lại doanh thu 20 triệu đô cho công ty tổ chức thực hiện. MBTI được sử dụng rộng rãi trong nhiều đơn vị tổ chức, và cả trường đại học với mục đích chính là phân loại tính cách giúp người ta hiểu hơn về mình và chọn nghề, chọn bạn, chọn bạn đời “phù hợp”. </p>
      <p>Thế nhưng, như sự đời vẫn thường hay thế, sự phổ biến không phải là bảo chứng cho tính đúng đắn, việc MBTI được nhiều nơi sử dụng không có nghĩa rằng nó là một công cụ tốt dùng để đánh giá bạn và tôi.</p>
      <h2>💡 Ý tưởng khởi nguồn</h2>
      <p>Trước hết mô tả qua một chút về bài test MBTI, MBTI là một công cụ đo lường tính cách sử dụng bộ câu hỏi trắc nghiệm 2 đáp án để đánh giá và phân loại con người dựa trên 4 tiêu chí lưỡng phân (tức 4 tiêu chí với 2 mục nhỏ bên trong):</p>
      <ol>
        <li>Thang EI - Xu hướng Tự nhiên: Hướng ngoại (Extroversion) - Hướng nội (Introversion)</li>
        <li>Thang SN - Tìm hiểu và Nhận thức Thế giới: Giác quan (Sensing) - Trực giác (INtution)</li>
        <li>Thang TF - Quyết định và chọn lựa: Lý trí (Thinking) - Cảm tính (Feeling)</li>
        <li>Thang JP - Cách thức và Hành động: Nguyên tắc (Judgment) - Linh hoạt (Perception)</li>
      </ol>
      <p>Bài test MBTI được hai mẹ con người Mỹ, Katherine Cook Briggs và Isabel Briggs Meyers, phát triển và quảng bá.</p>
      <p>Katherine (người mẹ) là người khởi nguồn cho ý tưởng của bài test. Katherine xuất thân trong một gia đình tiến bộ từ cuối thế kỷ 19, được bố (một giảng viên đại học) dạy dỗ tại nhà (home-schooled) và có bằng đại học ở cái thời mà người ta vẫn còn tin rằng phụ nữ được giáo dục quá nhiều thì sẽ bị ảnh hưởng khả năng sinh đẻ.</p>
      <p>Katherine có một niềm tin mạnh mẽ vào việc tìm ra cách nuôi dạy trẻ đúng đắn khi bà nuôi dạy Isabel, đứa con gái duy nhất và cũng chính là đồng sự sau này sẽ giúp bà hoàn thành nốt lý thuyết của mình. Bà bắt đầu tìm hiểu tài liệu từ nhiều nhà nghiên cứu khác nhau và thu thập dữ liệu để thai nghén cho lý thuyết về tính cách của mình. Nỗ lực và sản phẩm đầu tiên của Katherine được xác định từ năm 1917 với sự phân loại ra 4 dạng tính cách cơ bản: Trung tính, Ngẫu hứng, Điều hành, Hòa đồng (meditative types, spontaneous types, executive types, and sociable types).</p>
      <p>Tuy vậy, Katherine phải vất vả thêm vài năm với việc nghiên cứu nhiều loại lý thuyết từ triết học, tâm lý, khoa học mà vẫn không tìm ra một lý thuyết thống nhất cho tới tận năm 1923, khi bà bắt được cuốn sách “Personality Types” của Carl Jung, thứ có trình bày lý thuyết mà sau này sẽ thành bộ khung của bài test MBTI. Gật gù với cách phân loại của Carl, Katherine liên lạc với ông, đào sâu vào tìm hiểu lý thuyết này, và đồng thời cũng áp dụng nó vào công việc viết của mình.</p>
      <blockquote>
        <a href="https://web.archive.org/web/20170120192949/http://www.becomewhoyouare.net/MBTI-history-and-tributes-newest-ver.html" target="_blank" rel="nofollow noopener">MBTI history</a>
      </blockquote>
      <blockquote>
        <a href="https://www.truity.com/myers-briggs/story-of-mbti-briggs-myers-biography" target="_blank" rel="nofollow noopener">The History of Katharine Briggs, Isabel Myers, and the MBTI®</a>
      </blockquote>
      <p>Katherine tiếp tục nỗ lực nghiên cứu tính cách trong nhiều năm sau đó và cố thu hút Isabel làm cùng, nhưng cô con gái tỏ ra vẻ hứng thú với việc viết văn và chăm con hơn. Isabel chỉ thực sự tham gia vào công việc phân loại tính cách cùng mẹ từ những năm 40, khi thế giới đang trải qua cuộc đại chiến thứ 2. Cô tham gia với niềm tin rằng bài test MBTI sẽ là một công cụ tốt giúp phân bổ và sử dụng nhân công hợp lý để tối ưu hoá lực lượng lao động phục vụ sản xuất trong chiến tranh.</p>
      <p>Số phận của bài test sau đó được mang vác chính bởi Isabel. Bà học hỏi phương pháp thống kê và xây dựng bài test từ một trưởng phòng nhân sự tại Philadelphia. Bà thu thập dữ liệu, nghiên cứu thêm về tính cách con người với lần lấy mẫu đáng chú ý nhất bao gồm hơn 5000 sinh viên Trường Y khoa George Washington. Bài test MBTI sau đó nhận được sự chú ý từ nhiều tổ chức và dần được biết đến trên khắp nước Mỹ rồi sau đó nổi lên thành công cụ đo lường tính cách được sử dụng rộng rãi từ những năm 80.</p>
      <p>Tuy vậy, có lẽ cần phải nhắc tới thêm một chi tiết đó là cả Katherine và Isabel đều không có nền tảng giáo dục về tâm lý học. Mặc dù cả hai đều tốt nghiệp đại học, nhưng chuyên môn của Katherine là nông nghiệp còn Isabel thì có bằng khoa học chính trị. Ngay đó là một chi tiết để ta có thể đặt câu hỏi về tính khoa học của bài test tính cách MBTI. Bộ khung của nó được phát triển bởi 2 người không có nền tảng tâm lý học và các ý tưởng cũng chỉ dựa trên quan sát và kinh nghiệm. Điều này cũng đúng với Carl Jung, mặc dù ông là nhà tâm lý học hàng xịn nhất trong số khởi nguồn nên MBTI (trên thực tế ông khá nổi tiếng và có nhiều ảnh hưởng lên ngành tâm lý học sơ khai), tuy nhiên sự phân loại tính cách mà ông trình bày trong “Personality Types” cũng chỉ dựa trên kinh nghiệm nhiều năm hành nghề chứ không phải bằng chứng thực nghiệm (thực ra thì thuở này tâm lý học vẫn chưa phải khoa học dựa trên bằng chứng thực nghiệm).</p>
      <h2>👎 Những lời chỉ trích</h2>
      <p>Như đã nhắc ở phần đầu, sự phổ biến của MBTI không thể bảo lãnh cho nó khỏi nhưng lời chỉ trích. Trên thực tế, bài test không nhận được nhiều sự ủng hộ của giới chuyên gia, mặc dù hàng năm vẫn có những bài báo khoa học viết về MBTI nhưng khá nhiều trong số đó được kiểm duyệt và công bố bởi Center for the Application of Psychological Type hoặc Journal of Psychological Type vốn là những tổ chức được lập nên để ủng hộ MBTI ngay từ những ngày đầu (Xem <a href="https://web.archive.org/web/20081205043419/http://www.lsda.org.uk/files/PDF/1543.pdf" target="_blank" rel="nofollow noopener">link</a>, cuối trang 49). </p>
      <p>Các thảo luận về tính khoa học của MBTI đã xuất hiện từ 30-40 năm trước trong các bài báo khoa học, bài test dính phải nhiều lỗi thống kê cơ bản, chẳng hạn như: độ bình ổn (hay còn gọi độ tin cậy - reliability) thấp - tức một người làm test nhiều lần sẽ ra các kết quả khác nhau, độ chuẩn xác thấp do lưỡng phân các tiêu chí một cách thiếu cơ sở, hiện tượng tương quan (correlation) giữa các biến đo lường, độ khả dụng kém do không có giá trị dự đoán (predictive validity).</p>
      <p>Những lỗi này sẽ kéo theo nhiều kết quả khó có thể chấp nhận được. Lấy sự lưỡng phân ẩu của MBTI làm ví dụ, tỉ như có 2 người đi làm test, trên thang Hướng Nội - Hướng Ngoại, một người đạt 49% sẽ được cho là Hướng Nội, trong khi đó một người khác chỉ cách biệt 2 điểm - 51% - được tính là Hướng Ngoại. Hai người này khi test xong sẽ nhận được hai kết quả hoàn toàn khác nhau, mặc dù biểu hiện thực tế sẽ gần như không khác biệt. Cách làm này của MBTI đã cào bằng vài khía cạnh của tính cách con người bởi lẽ không có ai hoàn toàn nằm về một phía trong 4 tiêu chí của MBTI. Hầu hết trong mỗi người đều tồn tại cả hai, cả Hướng Nội và Hướng Ngoại (ambivert), cả Lý Trí và Cảm Tính (thậm chí, số liệu còn cho thấy rằng một người có thể vừa lý trí vừa cảm tính ở mức độ cao), etc. thế nhưng sau khi làm test thì mỗi người nhất định chỉ còn có 1 và nhận được phân tích cho duy nhất 1 mặt của vấn đề.</p>
      <p>Cùng với đó, số liệu của MBTI được kì vọng là sẽ phân hóa và cho thấy sự tập trung của một số dạng tính cách trong một số ngành nghề nhất định (ví dụ như bác sĩ nhiều tính cách loại A, nhân sự nhiều tính cách loại B, kĩ sư nhiều tính cách loại C) nhưng phân bổ của số liệu lại cho thấy tỷ lệ các loại tính cách trong một ngành nghề không khác gì tỷ lệ của một mẫu dân ngẫu nhiên. Đây chính là cơ sở để nghi ngờ khả năng dự đoán của MBTI - nhiệm vụ mà thông thường người ta vẫn hay giao cho nó.</p>
      <blockquote>
        <a href="https://en.wikipedia.org/wiki/Myers%E2%80%93Briggs_Type_Indicator#Terminology" target="_blank" rel="nofollow noopener">Myers-Briggs Type Indicator - Wikipedia</a>
      </blockquote>
      <p>Ngoài nhiều thiếu sót liên quan đến thống kê và toán học kể trên thì MBTI cũng mang <a href="https://aps.onlinelibrary.wiley.com/doi/abs/10.1111/j.1742-9544.1995.tb01750.x" target="_blank" rel="nofollow noopener">những điểm yếu chung của phương pháo khảo sát tự báo cáo</a> (self-reporting: người tham gia tự trả lời các câu hỏi về mình chứ không phải được đánh giá bởi một bên khác), kể như: bị ảnh hưởng bởi sự thiếu hiểu biết về chính bản thân mình, xu hướng trả lời dựa theo kì vọng xã hội và tâm trạng của người tham gia khi thực hiện test. Tất cả những điều này đều ảnh hưởng lên tính chính xác của MBTI nhưng bài test này không xây dựng được một công cụ nào để kiểm soát chúng. </p>
      <p>Thêm nữa, MBTI còn bị ảnh hưởng bởi một vài hiệu ứng tâm lý làm cho kết quả bài test <strong>trông-có-vẻ-đúng-hơn-nó-thực-sự-là</strong>, trong đó tiêu biểu là thiên kiến xác nhận (confirmation bias) và Hiệu ứng Forer (tên khác: hiệu ứng Barnum). <a href="https://www.britannica.com/science/confirmation-bias" target="_blank" rel="nofollow noopener">Thiên kiến xác nhận</a> là xu hướng chỉ tập trung tìm kiếm và thu thập những thông tin để khẳng định một niềm tin có sẵn, theo đó khi nhận được kết quả tính cách, người tham gia sẽ chỉ tập trung vào các nhận xét mà nó đưa ra, quá trình hồi tưởng và suy nghĩ của anh/chị ta sẽ bị thiên lệch và xác nhận chính thông tin vừa tiếp nhận. <a href="https://www.britannica.com/science/Barnum-Effect" target="_blank" rel="nofollow noopener">Hiệu ứng Forer</a> thậm chí còn đáng ngạc nhiên hơn nữa, nó là một kĩ thuật được các bộ môn chiêm tinh học, tử vi, xem bói sử dụng rất nhiều. Năm 1949, Bertram Forer thực hiện một thí nghiệm trong đó ông cho người tham gia thực hiện một bài test tính cách rồi sau đó đưa cho tất cả mọi người kết quả giống hệt nhau. Kết quả chứa các câu kiểu như: “bạn rất cần được người khác yêu quý và ngưỡng mộ”, “bạn có xu hướng tự đánh giá và chỉ trích các điểm yếu của mình”. Những nhận xét này rất chung chung, đem áp vào ai cũng trúng vì thế nên phần lớn người tham gia đều cho rằng bài test fake kia là chính xác. </p>
      <h2>✍️ Một vài dòng cuối</h2>
      <p>Có thể nói MBTI là một công cụ tồi để tiên đoán khả năng làm việc của một nhân viên, dự đoán xem anh/chị ta liệu có hạnh phúc khi làm công việc sắp nhận, hay là nói cho một đứa trẻ biết nó nên theo đuổi một nghề nghiệp nào. MBTI là một công cụ đo lường sự ưu tiên, không phải năng lực (preferences, not ability), nhưng đáng buồn là nó lại thường được sử dụng vào chính những mục đích đó. <a href="https://www.nature.com/articles/nj7412-545a" target="_blank" rel="nofollow noopener">Có những thảo luận</a> đã cho rằng MBTI được sử dụng rộng rãi vì nó dễ hiểu (do đã đơn giản hóa vấn đề), và có quá nhiều nguồn hỗ trợ quảng bá như sách, trang web, người thực hành, và cả giảng dạy tại trường lớp. <a href="https://aps.onlinelibrary.wiley.com/doi/abs/10.1111/j.1742-9544.1995.tb01750.x" target="_blank" rel="nofollow noopener">Các chuyên gia cho rằng</a> MBTI chỉ nên được coi là một sự tham khảo trong việc dự đoán hành vi của các cá nhân, trong việc tiếp cận với kiến thức và tương tác với các cá nhân khác chứ <strong>không-nên-dùng-để-ra-quyết-định</strong>. </p>
      <p>Theo <a href="https://www.theguardian.com/science/brain-flapping/2013/mar/19/myers-briggs-test-unscientific#comment-22127760" target="_blank" rel="nofollow noopener">một bài đăng trên The Guardian</a>, ở trong môi trường làm việc, bộ phận Nhân Sự (HR) sử dụng rộng rãi MBTI để hỗ trợ thực hiện các tác vụ tuyển dụng, đào tạo và phát triển nhân viên tuy nhiên nhiều khi không nhận biết được sự hạn chế của công cụ này. </p>
      <p>Người viết chắc chắn không thể kiểm chứng hết các dẫn chứng trong bài viết trên The Guardian vì chúng là bằng chứng truyền khẩu và được viết ở một bối cảnh một quốc gia khác. Nhưng với số lượng các bài viết tiếng Việt ủng hộ MBTI tìm thấy được trên internet và bản thân cũng từng học qua một chương trình đào tạo có giảng về MBTI, có thể thấy MBTI ở Việt Nam cũng có độ phổ biến không hề kém cạnh.</p>
      <p>Tính cách con người vốn là một vấn đề phức tạp, như rất nhiều vấn đề liên quan đến con người khác cũng vậy, con người thì thường có xu hướng đi theo bất cứ điều gì cung cấp một giải pháp đơn giản. Test MBTI hay có thể mở rộng ra một thứ có nhiều điểm chung khác là ngành công nghiệp self-help chỉ là một biểu hiện cho thiên hướng đó. Dễ thấy, đơn giản hóa mọi thứ không phải là giải pháp căn cơ cho các vấn đề này.</p>
      <p>Suy nghĩ phức tạp thì đời (có lẽ) sẽ đơn giản. Ngược lại chắc cũng đúng. </p>
      <p>-------</p>
      <p>
        <strong>Đọc thêm:</strong>
      </p>
      <p>
        <a href="https://www.vox.com/2014/7/15/5881947/myers-briggs-personality-test-meaningless" target="_blank" rel="nofollow noopener">Why the Myers-Briggs test is totally meaningless</a>
      </p>
      <p>
        <a href="https://www.psychologytoday.com/us/blog/people-are-strange/201909/when-personality-test-results-are-wrong-feel-so-right" target="_blank" rel="nofollow noopener">When Personality Test Results Are Wrong, But Feel So Right</a>
      </p>
      <p>
        <a href="https://www.theguardian.com/science/brain-flapping/2013/mar/19/myers-briggs-test-unscientific?utm_source=pocket_mylist" target="_blank" rel="nofollow noopener">Nothing Personal: The questionable Myers-Briggs test</a>
      </p>
    </div>
  </div>
</div>


<c:import url = "insert/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<c:import url = "insert/downfoot.html" />
