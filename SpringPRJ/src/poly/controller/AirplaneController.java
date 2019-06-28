package poly.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.lang.management.MonitorInfo;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import poly.dto.AirplaneDTO;
import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.service.IBoardService;
import poly.service.INoticeService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.Parse1;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class AirplaneController {
	private Logger log = Logger.getLogger(this.getClass());

	

	private String getTagValue(String tag, Element e) {

		NodeList nodeList = e.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nodeList.item(0);
		if (nValue == null)

		return null;

		return nValue.getNodeValue();
	}

	@RequestMapping(value = "AirplaneOperation")
	public String AirplaneOperation(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		
		System.out.println("welcome AirplaneOperation");
		
		return "/AirplaneOperation";
	}
	
	@RequestMapping(value = "AirplaneSelect")
	public String AirplaneSelect(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		
		System.out.println("welcome AirplaneSelect");
		
		return "/AirplaneSelect";
	}
	
	@RequestMapping(value = "AjaxAirplaneOperation")
	public String AjaxAirplaneOperation(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {

		System.out.println("welcome AjaxAirplaneOperation");

		String schLineType = CmmUtil.nvl(request.getParameter("schLineType"));
		log.info("schLineType : " + schLineType);
		String schIOType = CmmUtil.nvl(request.getParameter("schIOType"));
		log.info("schIOType : " + schIOType);
		String schAirCode = CmmUtil.nvl(request.getParameter("schAirCode"));
		log.info("schAirCode : " + schAirCode);

		try {

			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList" /* URL */
							+ "?ServiceKey=ENABwqlZ4Cl0OdKtb1FR7EY%2FBpSzgXyRkjhOLh0qXtWpKI95uPzG4TbtU%2Fyykg1bsVy4HrIStxBAb2rBGAjZDA%3D%3D"
							+ "&schLineType=" + schLineType + "&schIOType=" + schIOType + "&schAirCode=" + schAirCode + "&numOfRows=1000");

			URL url = new URL(urlBuilder.toString()); /* 위의 urlBuilder를 하나로 합쳐서 url 이라는 변수에 저장 */
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");/* 데이터를 받아오는 형식을 정함(GET or POST) */
			conn.setRequestProperty("Content-type", "application/xml");
			System.out.println("Response code: " + conn.getResponseCode());/* 응답(Response code)를 보여준느 부분 */
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();/* stringBuilder인 sb를 생성 */
			String result = "";
			String line; /* 문자열 line 생성 */
			while ((line = rd.readLine()) != null) {/* 만약 rd로부터 받아온 readLine이 0이 아니면 sb에 line 값을 계속 추가 */
				sb.append(line);
				result = result + line.trim();
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());

			InputSource is = new InputSource(new StringReader(result));

			/* xml 파싱 */
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  // 자신의 static 메서드를 가지고 객체를 생성
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(is);

			doc.getDocumentElement().normalize();
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

			NodeList nodeList = doc.getElementsByTagName("item");/* xml태그이름 중 item 부분을 전부 긁어모음 */

			System.out.println("파싱할 리스트 수" + nodeList.getLength());

			List<AirplaneDTO> rList = new ArrayList<AirplaneDTO>();

			for (int temp = 0; temp < nodeList.getLength(); temp++) {

				Node node = nodeList.item(temp); // 태그안에 있는 요소를 가져오기위해 Element를 형변환 하여 다시 담아줌

				Element e = (Element) node;

				System.out.println("#################");
				

				System.out.println("항공사 : " + getTagValue("airlineKorean", e));
				String airlineKorean = CmmUtil.nvl(getTagValue("airlineKorean", e).toString());

				System.out.println("항공편명 : " + getTagValue("airFln", e));
				String airFln = CmmUtil.nvl(getTagValue("airFln", e).toString());

				System.out.println("출발공항 : " + getTagValue("boardingKor", e));
				String boardingKor = CmmUtil.nvl(getTagValue("boardingKor", e).toString());

				System.out.println("도착공항 : " + getTagValue("arrivedKor", e));
				String arrivedKor = CmmUtil.nvl(getTagValue("arrivedKor", e).toString());

				System.out.println("예정시간 : " + getTagValue("std", e));
				String std = CmmUtil.nvl(getTagValue("std", e).toString());
				
				
				AirplaneDTO AirplaneDTO = new AirplaneDTO();
				AirplaneDTO.setAirlineKorean(airlineKorean);
				AirplaneDTO.setAirFln(airFln);
				AirplaneDTO.setBoardingKor(boardingKor);
				AirplaneDTO.setArrivedKor(arrivedKor);
				AirplaneDTO.setStd(std);
				

				System.out.println("#############################");

				rList.add(AirplaneDTO);

			}

			model.addAttribute("rList", rList);

//			pageNo++;
//
//			if (pageNo > 3)
//				break label;

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		

		return "/air/AirplaneOperationJson";
	}
	
	@RequestMapping(value = "example")
	public String example(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		
		System.out.println("welcome example");
		
		return "/example";
	}
	
	
	

}
