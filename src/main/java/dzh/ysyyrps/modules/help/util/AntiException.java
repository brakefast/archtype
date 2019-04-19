package dzh.ysyyrps.modules.help.util;

public class AntiException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AntiException() {
	}

	public AntiException(String s) {
		super(s);
	}

	public AntiException(String s, Throwable throwable) {
		super(s);
		AntiCrack.fake(this, throwable);
	}
}
