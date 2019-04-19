package dzh.ysyyrps.modules.sys.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;

public class ValidateCodeUtils {
	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";
	private static final char[] codeSeq = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'M', 'N', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '8', '9' };
	private static final int DEFAULT_WIDTH = 130;
	private static final int DEFAULT_HEIGHT = 42;
	
	public static String createValidateCode(String filePath, String fileName) throws IOException{
		return createImage(0, 0, filePath, fileName);
	}

	public static String createImage(int width, int height, String filePath, String fileName) throws IOException {
		if (width <= 0)
			width = DEFAULT_WIDTH;
		if (height <= 0) {
			height = DEFAULT_HEIGHT;
		}
		if (width < 60){
			width = 60;
		}
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		/*
		 * 生成背景
		 */
		createBackground(g, width, height);
		/*
		 * 生成字符
		 */
		String s = createCharacter(g,width,height);
		g.dispose();
		File file = new File(filePath + File.separator + fileName);
		if (!file.exists()){
			file.getParentFile().mkdirs();
		}
		ImageIO.write(image, "JPEG", file);
		return s;
	}

	private static String createCharacter(Graphics g, int width, int height) {

		String[] fontTypes = { "Arial", "Arial Black", "AvantGarde Bk BT", "Calibri" };
		Random random = new Random();
		StringBuilder s = new StringBuilder();
		int y = height/2;		
		int x = width/2 - 35;
		int randomTmp = 0;
		for (int i = 0; i < 4; i++) {
			String r = String.valueOf(codeSeq[random.nextInt(codeSeq.length)]);// random.nextInt(10));
			g.setColor(new Color(50 + random.nextInt(100), 50 + random.nextInt(100), 50 + random.nextInt(100)));
			g.setFont(new Font(fontTypes[random.nextInt(fontTypes.length)], Font.BOLD, 26));
			randomTmp = random.nextInt(6);
			g.drawString(r, 15 * i + 5 + x, y + 10 + (randomTmp%2==0?randomTmp:(randomTmp*-1)));
			s.append(r);
		}
		return s.toString();
	}

	private static void createBackground(Graphics g, int w, int h) {
		// 填充背景
		g.setColor(getRandColor(220, 250));
		g.fillRect(0, 0, w, h);
		// 加入干扰线条
		for (int i = 0; i < 8; i++) {
			g.setColor(getRandColor(40, 150));
			Random random = new Random();
			int x = random.nextInt(w);
			int y = random.nextInt(h);
			int x1 = random.nextInt(w);
			int y1 = random.nextInt(h);
			g.drawLine(x, y, x1, y1);
		}
	}

	private static Color getRandColor(int fc, int bc) {
		int f = fc;
		int b = bc;
		Random random = new Random();
		if (f > 255) {
			f = 255;
		}
		if (b > 255) {
			b = 255;
		}
		return new Color(f + random.nextInt(b - f), f + random.nextInt(b - f), f + random.nextInt(b - f));
	}
}
