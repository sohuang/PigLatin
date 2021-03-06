// TO DO: punctuation at the end of the hymn lines

import java.util.*;

public String[] vowels = {"a", "e", "i", "o", "u"};

public void setup() {
	String words[] = loadStrings("words.txt");
	System.out.println("there are " + words.length + " lines");
	for (int i = 0 ; i < words.length; i++) {
		System.out.println(pigLatin(words[i]));
	}
	println();

	// doesn't print commas or periods
	String hymn[] = loadStrings("LowellHymn.txt");
	System.out.println("there are " + hymn.length + " lines");
	for (int i = 0; i < hymn.length; i++) {
		String line = new String();
		// for precondition
		if (hymn[i].length() > 0) {
			String split[] = hymn[i].split("([^\\w&&[^'-]])");
			for (int j = 0;  j < split.length; j++) {
				line += pigLatin(split[j]) + " ";
			}
			// System.out.println(Arrays.toString(split));
		}
		System.out.println(line);
	}
}

public void draw() {
}

public int findFirstVowel(String sWord) {
	//precondition: sWord is a valid String of length greater than 0.
	//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	for (int i = 0; i < sWord.length(); i++) {
		for (String vowel : vowels) {
			if (sWord.substring(i, i+1).equalsIgnoreCase(vowel)) {
				return i;
			}
		}
	}
	return -1;
}

public String pigLatin(String sWord) {
	//precondition: sWord is a valid String of length greater than 0
	//postcondition: returns the pig latin equivalent of sWord
	int firstVowelIndex = findFirstVowel(sWord);
	if (firstVowelIndex == -1) {
		return sWord + "ay";
	}
	if (firstVowelIndex == 0) {
		return sWord + "way";
	}
	if (sWord.substring(0, 2).equals("qu")) {
		return sWord.substring(2) + "quay";
	}
	return sWord.substring(firstVowelIndex) + sWord.substring(0, firstVowelIndex) + "ay";
}