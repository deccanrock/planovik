package com.deccanrock.planovik.security;

import java.security.GeneralSecurityException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AESSecure {

	private static final String commonkey = "aXb@#s2&479%8+=1";
	
	public static byte[] convertToAES(String plaintext, SecretKey key) throws InvalidKeySpecException, GeneralSecurityException {
		
	    // Create the cipher 
		Cipher desCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

	    // Initialize the cipher for encryption
	    desCipher.init(Cipher.ENCRYPT_MODE, key);
	    
	    byte[] textEncrypted = desCipher.doFinal(plaintext.getBytes());
	    
	    return textEncrypted;

	}
	
	public static String convertToSecureURI(String plaintextURI, SecretKey key) throws InvalidKeySpecException, GeneralSecurityException {
		
		if (key == null) {
			// Assume common AES encryption is required
			byte[] encodedKey = commonkey.getBytes();
			key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");			
		}
	    // Create the cipher 
		Cipher desCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		byte[] iv = new byte[desCipher.getBlockSize()];
		IvParameterSpec ivParams = new IvParameterSpec(iv);
		desCipher.init(Cipher.ENCRYPT_MODE, key,ivParams);	   
	    byte[] encryptedURI = desCipher.doFinal(plaintextURI.getBytes());
		String encodedURI = Base64.encodeBase64String(encryptedURI);
	    return encodedURI;
	}
	
	public static String convertToPlainURI(String encryptedURI, SecretKey key) throws InvalidKeySpecException, GeneralSecurityException {

		if (key == null) {
			// Assume common AES encryption is required
			byte[] encodedKey = commonkey.getBytes();
			key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");			
		}
		
		Cipher desCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		byte[] iv = new byte[desCipher.getBlockSize()];
		IvParameterSpec ivParams = new IvParameterSpec(iv);
	    // Initialize the cipher for encryption
		desCipher.init(Cipher.DECRYPT_MODE, key,ivParams);
		byte[] decodedURI = Base64.decodeBase64(encryptedURI);
	    byte[] decryptedURI = desCipher.doFinal(decodedURI);
	    String s = new String(decryptedURI);
	    return s;
	}


	public static String convertToText(String enctext, SecretKey key) throws GeneralSecurityException, NoSuchPaddingException {
		
		// Initialize the same cipher for decryption
		Cipher desCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

		desCipher.init(Cipher.DECRYPT_MODE, key);

	    // Decrypt the text
	    byte[] textDecrypted = desCipher.doFinal(enctext.getBytes());

	    return new String(textDecrypted);
	}
}
