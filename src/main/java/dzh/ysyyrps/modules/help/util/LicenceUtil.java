package dzh.ysyyrps.modules.help.util;

import java.io.File;
import java.io.FileInputStream;

import org.apache.commons.codec.binary.Base64;

import com.ciocem.common.utils.security.AESUtil;
import com.ciocem.common.utils.security.Constant;
import com.ciocem.common.utils.security.MD5Util;
import com.ciocem.common.utils.security.RSAUtil;


/**
 * 
 * @author jkd5170
 *
 */
public class LicenceUtil {
	
	@SuppressWarnings("unused")
	private void invalidate() throws AntiException {
		try {
			System.currentTimeMillis();
		} catch (Exception e) {
			throw new AntiException(e.getMessage(),e);
		}
	}
	
	public static String resloveData(String filePath) {		
		try {
			File file =  new File(filePath);
			if (file.exists() && file.isFile()){
				Long fileLength = file.length();
				byte[] content = new byte[fileLength.intValue()];
				FileInputStream fileInputStream = new FileInputStream(file);
				fileInputStream.read(content);
				fileInputStream.close();
				String readString = new String(content);
				System.out.println(readString);
				byte[] decodeBase64Byte = Base64.decodeBase64(readString);
				String orginStr = new String(decodeBase64Byte, Constant.CHART_SET_NAME);
				System.out.println(orginStr);
				String[] strs = orginStr.split("\\$jkd\\$");
				if (strs.length == 3) {
					String rsaData = strs[0];
					String enData = strs[1];
					String pubKey = strs[2];
					byte[] decryptRsaData = RSAUtil.decryptByPublicKey(Base64.decodeBase64(rsaData), pubKey);
					String decryptRsa = new String(decryptRsaData, Constant.CHART_SET_NAME);
					System.out.println(decryptRsa);
					String[] keys = decryptRsa.split("\\$jkd\\$");
					if (keys.length == 3) {
						String aesKey = keys[1];
						String sign = keys[0];
						String serverInfo = keys[2];
						System.out.println(serverInfo);
						if (sign.equals(MD5Util.MD5(enData))) {
							String authData = AESUtil.detrypt(enData, aesKey);
							System.out.println(authData);
							return authData;
						}
					}
				}
			}
			
			return "";
		} catch (Exception e) {
			return "";
		}
	}
}
