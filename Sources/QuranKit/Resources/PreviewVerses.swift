//
//  File.swift
//  
//
//  Created by Imthath on 5/23/21.
//

import Foundation

extension QuranStore {
  public static var previewVerses: [CDVerse] {
    previewItems.map { item in 
      let verse = CDVerse(context: QuranStore.preview.currentContext)
      verse.surah = item.sura
      verse.ayah = item.ayah
      verse.text = item.text
      return verse
    }
  }

  private static var previewItems: [Verse] {
    var result = [Verse]()
    result.append(Verse(sura: 73, ayah: 1, text: "يَٰٓأَيُّهَا ٱلۡمُزَّمِّلُ"))
    result.append(Verse(sura: 73, ayah: 2, text: "قُمِ ٱلَّيۡلَ إِلَّا قَلِيلٗا"))
    result.append(Verse(sura: 73, ayah: 3, text: "نِّصۡفَهُۥٓ أَوِ ٱنقُصۡ مِنۡهُ قَلِيلًا"))
    result.append(Verse(sura: 73, ayah: 4, text: "أَوۡ زِدۡ عَلَيۡهِ وَرَتِّلِ ٱلۡقُرۡءَانَ تَرۡتِيلًا"))
    result.append(Verse(sura: 73, ayah: 5, text: "إِنَّا سَنُلۡقِي عَلَيۡكَ قَوۡلٗا ثَقِيلًا"))
    result.append(Verse(sura: 73, ayah: 6, text: "إِنَّ نَاشِئَةَ ٱلَّيۡلِ هِيَ أَشَدُّ وَطۡـٔٗا وَأَقۡوَمُ قِيلًا"))
    result.append(Verse(sura: 73, ayah: 7, text: "إِنَّ لَكَ فِي ٱلنَّهَارِ سَبۡحٗا طَوِيلٗا"))
    result.append(Verse(sura: 73, ayah: 8, text: "وَٱذۡكُرِ ٱسۡمَ رَبِّكَ وَتَبَتَّلۡ إِلَيۡهِ تَبۡتِيلٗا"))
    result.append(Verse(sura: 73, ayah: 9, text: "رَّبُّ ٱلۡمَشۡرِقِ وَٱلۡمَغۡرِبِ لَآ إِلَٰهَ إِلَّا هُوَ فَٱتَّخِذۡهُ وَكِيلٗا"))
    result.append(Verse(sura: 73, ayah: 10, text: "وَٱصۡبِرۡ عَلَىٰ مَا يَقُولُونَ وَٱهۡجُرۡهُمۡ هَجۡرٗا جَمِيلٗا"))
    result.append(Verse(sura: 73, ayah: 11, text: "وَذَرۡنِي وَٱلۡمُكَذِّبِينَ أُوْلِي ٱلنَّعۡمَةِ وَمَهِّلۡهُمۡ قَلِيلًا"))
    result.append(Verse(sura: 73, ayah: 12, text: "إِنَّ لَدَيۡنَآ أَنكَالٗا وَجَحِيمٗا"))
    result.append(Verse(sura: 73, ayah: 13, text: "وَطَعَامٗا ذَا غُصَّةٖ وَعَذَابًا أَلِيمٗا"))
    result.append(Verse(sura: 73, ayah: 14, text: "يَوۡمَ تَرۡجُفُ ٱلۡأَرۡضُ وَٱلۡجِبَالُ وَكَانَتِ ٱلۡجِبَالُ كَثِيبٗا مَّهِيلًا"))
    result.append(Verse(sura: 73, ayah: 15, text: "إِنَّآ أَرۡسَلۡنَآ إِلَيۡكُمۡ رَسُولٗا شَٰهِدًا عَلَيۡكُمۡ كَمَآ أَرۡسَلۡنَآ إِلَىٰ فِرۡعَوۡنَ رَسُولٗا"))
    result.append(Verse(sura: 73, ayah: 16, text: "فَعَصَىٰ فِرۡعَوۡنُ ٱلرَّسُولَ فَأَخَذۡنَٰهُ أَخۡذٗا وَبِيلٗا"))
    result.append(Verse(sura: 73, ayah: 17, text: "فَكَيۡفَ تَتَّقُونَ إِن كَفَرۡتُمۡ يَوۡمٗا يَجۡعَلُ ٱلۡوِلۡدَٰنَ شِيبًا"))
    result.append(Verse(sura: 73, ayah: 18, text: "ٱلسَّمَآءُ مُنفَطِرُۢ بِهِۦۚ كَانَ وَعۡدُهُۥ مَفۡعُولًا"))
    result.append(Verse(sura: 73, ayah: 19, text: "إِنَّ هَٰذِهِۦ تَذۡكِرَةٞۖ فَمَن شَآءَ ٱتَّخَذَ إِلَىٰ رَبِّهِۦ سَبِيلًا"))
    result.append(Verse(sura: 73, ayah: 20, text: "۞إِنَّ رَبَّكَ يَعۡلَمُ أَنَّكَ تَقُومُ أَدۡنَىٰ مِن ثُلُثَيِ ٱلَّيۡلِ وَنِصۡفَهُۥ وَثُلُثَهُۥ وَطَآئِفَةٞ مِّنَ ٱلَّذِينَ مَعَكَۚ وَٱللَّهُ يُقَدِّرُ ٱلَّيۡلَ وَٱلنَّهَارَۚ عَلِمَ أَن لَّن تُحۡصُوهُ فَتَابَ عَلَيۡكُمۡۖ فَٱقۡرَءُواْ مَا تَيَسَّرَ مِنَ ٱلۡقُرۡءَانِۚ عَلِمَ أَن سَيَكُونُ مِنكُم مَّرۡضَىٰ وَءَاخَرُونَ يَضۡرِبُونَ فِي ٱلۡأَرۡضِ يَبۡتَغُونَ مِن فَضۡلِ ٱللَّهِ وَءَاخَرُونَ يُقَٰتِلُونَ فِي سَبِيلِ ٱللَّهِۖ فَٱقۡرَءُواْ مَا تَيَسَّرَ مِنۡهُۚ وَأَقِيمُواْ ٱلصَّلَوٰةَ وَءَاتُواْ ٱلزَّكَوٰةَ وَأَقۡرِضُواْ ٱللَّهَ قَرۡضًا حَسَنٗاۚ وَمَا تُقَدِّمُواْ لِأَنفُسِكُم مِّنۡ خَيۡرٖ تَجِدُوهُ عِندَ ٱللَّهِ هُوَ خَيۡرٗا وَأَعۡظَمَ أَجۡرٗاۚ وَٱسۡتَغۡفِرُواْ ٱللَّهَۖ إِنَّ ٱللَّهَ غَفُورٞ رَّحِيمُۢ"))
    result.append(Verse(sura: 74, ayah: 1, text: "يَٰٓأَيُّهَا ٱلۡمُدَّثِّرُ"))
    result.append(Verse(sura: 74, ayah: 2, text: "قُمۡ فَأَنذِرۡ"))
    result.append(Verse(sura: 74, ayah: 3, text: "وَرَبَّكَ فَكَبِّرۡ"))
    result.append(Verse(sura: 74, ayah: 4, text: "وَثِيَابَكَ فَطَهِّرۡ"))
    result.append(Verse(sura: 74, ayah: 5, text: "وَٱلرُّجۡزَ فَٱهۡجُرۡ"))
    result.append(Verse(sura: 74, ayah: 6, text: "وَلَا تَمۡنُن تَسۡتَكۡثِرُ"))
    result.append(Verse(sura: 74, ayah: 7, text: "وَلِرَبِّكَ فَٱصۡبِرۡ"))
    result.append(Verse(sura: 74, ayah: 8, text: "فَإِذَا نُقِرَ فِي ٱلنَّاقُورِ"))
    result.append(Verse(sura: 74, ayah: 9, text: "فَذَٰلِكَ يَوۡمَئِذٖ يَوۡمٌ عَسِيرٌ"))
    result.append(Verse(sura: 74, ayah: 10, text: "عَلَى ٱلۡكَٰفِرِينَ غَيۡرُ يَسِيرٖ"))
    result.append(Verse(sura: 74, ayah: 11, text: "ذَرۡنِي وَمَنۡ خَلَقۡتُ وَحِيدٗا"))
    result.append(Verse(sura: 74, ayah: 12, text: "وَجَعَلۡتُ لَهُۥ مَالٗا مَّمۡدُودٗا"))
    result.append(Verse(sura: 74, ayah: 13, text: "وَبَنِينَ شُهُودٗا"))
    result.append(Verse(sura: 74, ayah: 14, text: "وَمَهَّدتُّ لَهُۥ تَمۡهِيدٗا"))
    result.append(Verse(sura: 74, ayah: 15, text: "ثُمَّ يَطۡمَعُ أَنۡ أَزِيدَ"))
    result.append(Verse(sura: 74, ayah: 16, text: "كَلَّآۖ إِنَّهُۥ كَانَ لِأٓيَٰتِنَا عَنِيدٗا"))
    result.append(Verse(sura: 74, ayah: 17, text: "سَأُرۡهِقُهُۥ صَعُودًا"))
    result.append(Verse(sura: 74, ayah: 18, text: "إِنَّهُۥ فَكَّرَ وَقَدَّرَ"))
    result.append(Verse(sura: 74, ayah: 19, text: "فَقُتِلَ كَيۡفَ قَدَّرَ"))
    result.append(Verse(sura: 74, ayah: 20, text: "ثُمَّ قُتِلَ كَيۡفَ قَدَّرَ"))
    result.append(Verse(sura: 74, ayah: 21, text: "ثُمَّ نَظَرَ"))
    result.append(Verse(sura: 74, ayah: 22, text: "ثُمَّ عَبَسَ وَبَسَرَ"))
    result.append(Verse(sura: 74, ayah: 23, text: "ثُمَّ أَدۡبَرَ وَٱسۡتَكۡبَرَ"))
    result.append(Verse(sura: 74, ayah: 24, text: "فَقَالَ إِنۡ هَٰذَآ إِلَّا سِحۡرٞ يُؤۡثَرُ"))
    result.append(Verse(sura: 74, ayah: 25, text: "إِنۡ هَٰذَآ إِلَّا قَوۡلُ ٱلۡبَشَرِ"))
    result.append(Verse(sura: 74, ayah: 26, text: "سَأُصۡلِيهِ سَقَرَ"))
    result.append(Verse(sura: 74, ayah: 27, text: "وَمَآ أَدۡرَىٰكَ مَا سَقَرُ"))
    result.append(Verse(sura: 74, ayah: 28, text: "لَا تُبۡقِي وَلَا تَذَرُ"))
    result.append(Verse(sura: 74, ayah: 29, text: "لَوَّاحَةٞ لِّلۡبَشَرِ"))
    result.append(Verse(sura: 74, ayah: 30, text: "عَلَيۡهَا تِسۡعَةَ عَشَرَ"))
    result.append(Verse(sura: 74, ayah: 31, text: "وَمَا جَعَلۡنَآ أَصۡحَٰبَ ٱلنَّارِ إِلَّا مَلَٰٓئِكَةٗۖ وَمَا جَعَلۡنَا عِدَّتَهُمۡ إِلَّا فِتۡنَةٗ لِّلَّذِينَ كَفَرُواْ لِيَسۡتَيۡقِنَ ٱلَّذِينَ أُوتُواْ ٱلۡكِتَٰبَ وَيَزۡدَادَ ٱلَّذِينَ ءَامَنُوٓاْ إِيمَٰنٗا وَلَا يَرۡتَابَ ٱلَّذِينَ أُوتُواْ ٱلۡكِتَٰبَ وَٱلۡمُؤۡمِنُونَ وَلِيَقُولَ ٱلَّذِينَ فِي قُلُوبِهِم مَّرَضٞ وَٱلۡكَٰفِرُونَ مَاذَآ أَرَادَ ٱللَّهُ بِهَٰذَا مَثَلٗاۚ كَذَٰلِكَ يُضِلُّ ٱللَّهُ مَن يَشَآءُ وَيَهۡدِي مَن يَشَآءُۚ وَمَا يَعۡلَمُ جُنُودَ رَبِّكَ إِلَّا هُوَۚ وَمَا هِيَ إِلَّا ذِكۡرَىٰ لِلۡبَشَرِ"))
    result.append(Verse(sura: 74, ayah: 32, text: "كَلَّا وَٱلۡقَمَرِ"))
    result.append(Verse(sura: 74, ayah: 33, text: "وَٱلَّيۡلِ إِذۡ أَدۡبَرَ"))
    result.append(Verse(sura: 74, ayah: 34, text: "وَٱلصُّبۡحِ إِذَآ أَسۡفَرَ"))
    result.append(Verse(sura: 74, ayah: 35, text: "إِنَّهَا لَإِحۡدَى ٱلۡكُبَرِ"))
    result.append(Verse(sura: 74, ayah: 36, text: "نَذِيرٗا لِّلۡبَشَرِ"))
    result.append(Verse(sura: 74, ayah: 37, text: "لِمَن شَآءَ مِنكُمۡ أَن يَتَقَدَّمَ أَوۡ يَتَأَخَّرَ"))
    result.append(Verse(sura: 74, ayah: 38, text: "كُلُّ نَفۡسِۭ بِمَا كَسَبَتۡ رَهِينَةٌ"))
    result.append(Verse(sura: 74, ayah: 39, text: "إِلَّآ أَصۡحَٰبَ ٱلۡيَمِينِ"))
    result.append(Verse(sura: 74, ayah: 40, text: "فِي جَنَّٰتٖ يَتَسَآءَلُونَ"))
    result.append(Verse(sura: 74, ayah: 41, text: "عَنِ ٱلۡمُجۡرِمِينَ"))
    result.append(Verse(sura: 74, ayah: 42, text: "مَا سَلَكَكُمۡ فِي سَقَرَ"))
    result.append(Verse(sura: 74, ayah: 43, text: "قَالُواْ لَمۡ نَكُ مِنَ ٱلۡمُصَلِّينَ"))
    result.append(Verse(sura: 74, ayah: 44, text: "وَلَمۡ نَكُ نُطۡعِمُ ٱلۡمِسۡكِينَ"))
    result.append(Verse(sura: 74, ayah: 45, text: "وَكُنَّا نَخُوضُ مَعَ ٱلۡخَآئِضِينَ"))
    result.append(Verse(sura: 74, ayah: 46, text: "وَكُنَّا نُكَذِّبُ بِيَوۡمِ ٱلدِّينِ"))
    result.append(Verse(sura: 74, ayah: 47, text: "حَتَّىٰٓ أَتَىٰنَا ٱلۡيَقِينُ"))
    result.append(Verse(sura: 74, ayah: 48, text: "فَمَا تَنفَعُهُمۡ شَفَٰعَةُ ٱلشَّٰفِعِينَ"))
    result.append(Verse(sura: 74, ayah: 49, text: "فَمَا لَهُمۡ عَنِ ٱلتَّذۡكِرَةِ مُعۡرِضِينَ"))
    result.append(Verse(sura: 74, ayah: 50, text: "كَأَنَّهُمۡ حُمُرٞ مُّسۡتَنفِرَةٞ"))
    result.append(Verse(sura: 74, ayah: 51, text: "فَرَّتۡ مِن قَسۡوَرَةِۭ"))
    result.append(Verse(sura: 74, ayah: 52, text: "بَلۡ يُرِيدُ كُلُّ ٱمۡرِيٕٖ مِّنۡهُمۡ أَن يُؤۡتَىٰ صُحُفٗا مُّنَشَّرَةٗ"))
    result.append(Verse(sura: 74, ayah: 53, text: "كَلَّاۖ بَل لَّا يَخَافُونَ ٱلۡأٓخِرَةَ"))
    result.append(Verse(sura: 74, ayah: 54, text: "كَلَّآ إِنَّهُۥ تَذۡكِرَةٞ"))
    result.append(Verse(sura: 74, ayah: 55, text: "فَمَن شَآءَ ذَكَرَهُۥ"))
    result.append(Verse(sura: 74, ayah: 56, text: "وَمَا يَذۡكُرُونَ إِلَّآ أَن يَشَآءَ ٱللَّهُۚ هُوَ أَهۡلُ ٱلتَّقۡوَىٰ وَأَهۡلُ ٱلۡمَغۡفِرَةِ"))
    result.append(Verse(sura: 75, ayah: 1, text: "لَآ أُقۡسِمُ بِيَوۡمِ ٱلۡقِيَٰمَةِ"))
    result.append(Verse(sura: 75, ayah: 2, text: "وَلَآ أُقۡسِمُ بِٱلنَّفۡسِ ٱللَّوَّامَةِ"))
    result.append(Verse(sura: 75, ayah: 3, text: "أَيَحۡسَبُ ٱلۡإِنسَٰنُ أَلَّن نَّجۡمَعَ عِظَامَهُۥ"))
    result.append(Verse(sura: 75, ayah: 4, text: "بَلَىٰ قَٰدِرِينَ عَلَىٰٓ أَن نُّسَوِّيَ بَنَانَهُۥ"))
    result.append(Verse(sura: 75, ayah: 5, text: "بَلۡ يُرِيدُ ٱلۡإِنسَٰنُ لِيَفۡجُرَ أَمَامَهُۥ"))
    result.append(Verse(sura: 75, ayah: 6, text: "يَسۡـَٔلُ أَيَّانَ يَوۡمُ ٱلۡقِيَٰمَةِ"))
    result.append(Verse(sura: 75, ayah: 7, text: "فَإِذَا بَرِقَ ٱلۡبَصَرُ"))
    result.append(Verse(sura: 75, ayah: 8, text: "وَخَسَفَ ٱلۡقَمَرُ"))
    result.append(Verse(sura: 75, ayah: 9, text: "وَجُمِعَ ٱلشَّمۡسُ وَٱلۡقَمَرُ"))
    result.append(Verse(sura: 75, ayah: 10, text: "يَقُولُ ٱلۡإِنسَٰنُ يَوۡمَئِذٍ أَيۡنَ ٱلۡمَفَرُّ"))
    result.append(Verse(sura: 75, ayah: 11, text: "كَلَّا لَا وَزَرَ"))
    result.append(Verse(sura: 75, ayah: 12, text: "إِلَىٰ رَبِّكَ يَوۡمَئِذٍ ٱلۡمُسۡتَقَرُّ"))
    result.append(Verse(sura: 75, ayah: 13, text: "يُنَبَّؤُاْ ٱلۡإِنسَٰنُ يَوۡمَئِذِۭ بِمَا قَدَّمَ وَأَخَّرَ"))
    result.append(Verse(sura: 75, ayah: 14, text: "بَلِ ٱلۡإِنسَٰنُ عَلَىٰ نَفۡسِهِۦ بَصِيرَةٞ"))
    result.append(Verse(sura: 75, ayah: 15, text: "وَلَوۡ أَلۡقَىٰ مَعَاذِيرَهُۥ"))
    result.append(Verse(sura: 75, ayah: 16, text: "لَا تُحَرِّكۡ بِهِۦ لِسَانَكَ لِتَعۡجَلَ بِهِۦٓ"))
    result.append(Verse(sura: 75, ayah: 17, text: "إِنَّ عَلَيۡنَا جَمۡعَهُۥ وَقُرۡءَانَهُۥ"))
    result.append(Verse(sura: 75, ayah: 18, text: "فَإِذَا قَرَأۡنَٰهُ فَٱتَّبِعۡ قُرۡءَانَهُۥ"))
    result.append(Verse(sura: 75, ayah: 19, text: "ثُمَّ إِنَّ عَلَيۡنَا بَيَانَهُۥ"))
    result.append(Verse(sura: 75, ayah: 20, text: "كَلَّا بَلۡ تُحِبُّونَ ٱلۡعَاجِلَةَ"))
    result.append(Verse(sura: 75, ayah: 21, text: "وَتَذَرُونَ ٱلۡأٓخِرَةَ"))
    result.append(Verse(sura: 75, ayah: 22, text: "وُجُوهٞ يَوۡمَئِذٖ نَّاضِرَةٌ"))
    result.append(Verse(sura: 75, ayah: 23, text: "إِلَىٰ رَبِّهَا نَاظِرَةٞ"))
    result.append(Verse(sura: 75, ayah: 24, text: "وَوُجُوهٞ يَوۡمَئِذِۭ بَاسِرَةٞ"))
    result.append(Verse(sura: 75, ayah: 25, text: "تَظُنُّ أَن يُفۡعَلَ بِهَا فَاقِرَةٞ"))
    result.append(Verse(sura: 75, ayah: 26, text: "كَلَّآ إِذَا بَلَغَتِ ٱلتَّرَاقِيَ"))
    result.append(Verse(sura: 75, ayah: 27, text: "وَقِيلَ مَنۡۜ رَاقٖ"))
    result.append(Verse(sura: 75, ayah: 28, text: "وَظَنَّ أَنَّهُ ٱلۡفِرَاقُ"))
    result.append(Verse(sura: 75, ayah: 29, text: "وَٱلۡتَفَّتِ ٱلسَّاقُ بِٱلسَّاقِ"))
    result.append(Verse(sura: 75, ayah: 30, text: "إِلَىٰ رَبِّكَ يَوۡمَئِذٍ ٱلۡمَسَاقُ"))
    result.append(Verse(sura: 75, ayah: 31, text: "فَلَا صَدَّقَ وَلَا صَلَّىٰ"))
    result.append(Verse(sura: 75, ayah: 32, text: "وَلَٰكِن كَذَّبَ وَتَوَلَّىٰ"))
    result.append(Verse(sura: 75, ayah: 33, text: "ثُمَّ ذَهَبَ إِلَىٰٓ أَهۡلِهِۦ يَتَمَطَّىٰٓ"))
    result.append(Verse(sura: 75, ayah: 34, text: "أَوۡلَىٰ لَكَ فَأَوۡلَىٰ"))
    result.append(Verse(sura: 75, ayah: 35, text: "ثُمَّ أَوۡلَىٰ لَكَ فَأَوۡلَىٰٓ"))
    result.append(Verse(sura: 75, ayah: 36, text: "أَيَحۡسَبُ ٱلۡإِنسَٰنُ أَن يُتۡرَكَ سُدًى"))
    result.append(Verse(sura: 75, ayah: 37, text: "أَلَمۡ يَكُ نُطۡفَةٗ مِّن مَّنِيّٖ يُمۡنَىٰ"))
    result.append(Verse(sura: 75, ayah: 38, text: "ثُمَّ كَانَ عَلَقَةٗ فَخَلَقَ فَسَوَّىٰ"))
    result.append(Verse(sura: 75, ayah: 39, text: "فَجَعَلَ مِنۡهُ ٱلزَّوۡجَيۡنِ ٱلذَّكَرَ وَٱلۡأُنثَىٰٓ"))
    result.append(Verse(sura: 75, ayah: 40, text: "أَلَيۡسَ ذَٰلِكَ بِقَٰدِرٍ عَلَىٰٓ أَن يُحۡـِۧيَ ٱلۡمَوۡتَىٰ"))
    result.append(Verse(sura: 76, ayah: 1, text: "هَلۡ أَتَىٰ عَلَى ٱلۡإِنسَٰنِ حِينٞ مِّنَ ٱلدَّهۡرِ لَمۡ يَكُن شَيۡـٔٗا مَّذۡكُورًا"))
    result.append(Verse(sura: 76, ayah: 2, text: "إِنَّا خَلَقۡنَا ٱلۡإِنسَٰنَ مِن نُّطۡفَةٍ أَمۡشَاجٖ نَّبۡتَلِيهِ فَجَعَلۡنَٰهُ سَمِيعَۢا بَصِيرًا"))
    result.append(Verse(sura: 76, ayah: 3, text: "إِنَّا هَدَيۡنَٰهُ ٱلسَّبِيلَ إِمَّا شَاكِرٗا وَإِمَّا كَفُورًا"))
    result.append(Verse(sura: 76, ayah: 4, text: "إِنَّآ أَعۡتَدۡنَا لِلۡكَٰفِرِينَ سَلَٰسِلَاْ وَأَغۡلَٰلٗا وَسَعِيرًا"))
    result.append(Verse(sura: 76, ayah: 5, text: "إِنَّ ٱلۡأَبۡرَارَ يَشۡرَبُونَ مِن كَأۡسٖ كَانَ مِزَاجُهَا كَافُورًا"))
    result.append(Verse(sura: 76, ayah: 6, text: "عَيۡنٗا يَشۡرَبُ بِهَا عِبَادُ ٱللَّهِ يُفَجِّرُونَهَا تَفۡجِيرٗا"))
    result.append(Verse(sura: 76, ayah: 7, text: "يُوفُونَ بِٱلنَّذۡرِ وَيَخَافُونَ يَوۡمٗا كَانَ شَرُّهُۥ مُسۡتَطِيرٗا"))
    result.append(Verse(sura: 76, ayah: 8, text: "وَيُطۡعِمُونَ ٱلطَّعَامَ عَلَىٰ حُبِّهِۦ مِسۡكِينٗا وَيَتِيمٗا وَأَسِيرًا"))
    result.append(Verse(sura: 76, ayah: 9, text: "إِنَّمَا نُطۡعِمُكُمۡ لِوَجۡهِ ٱللَّهِ لَا نُرِيدُ مِنكُمۡ جَزَآءٗ وَلَا شُكُورًا"))
    result.append(Verse(sura: 76, ayah: 10, text: "إِنَّا نَخَافُ مِن رَّبِّنَا يَوۡمًا عَبُوسٗا قَمۡطَرِيرٗا"))
    result.append(Verse(sura: 76, ayah: 11, text: "فَوَقَىٰهُمُ ٱللَّهُ شَرَّ ذَٰلِكَ ٱلۡيَوۡمِ وَلَقَّىٰهُمۡ نَضۡرَةٗ وَسُرُورٗا"))
    result.append(Verse(sura: 76, ayah: 12, text: "وَجَزَىٰهُم بِمَا صَبَرُواْ جَنَّةٗ وَحَرِيرٗا"))
    result.append(Verse(sura: 76, ayah: 13, text: "مُّتَّكِـِٔينَ فِيهَا عَلَى ٱلۡأَرَآئِكِۖ لَا يَرَوۡنَ فِيهَا شَمۡسٗا وَلَا زَمۡهَرِيرٗا"))
    result.append(Verse(sura: 76, ayah: 14, text: "وَدَانِيَةً عَلَيۡهِمۡ ظِلَٰلُهَا وَذُلِّلَتۡ قُطُوفُهَا تَذۡلِيلٗا"))
    result.append(Verse(sura: 76, ayah: 15, text: "وَيُطَافُ عَلَيۡهِم بِـَٔانِيَةٖ مِّن فِضَّةٖ وَأَكۡوَابٖ كَانَتۡ قَوَارِيرَا۠"))
    result.append(Verse(sura: 76, ayah: 16, text: "قَوَارِيرَاْ مِن فِضَّةٖ قَدَّرُوهَا تَقۡدِيرٗا"))
    result.append(Verse(sura: 76, ayah: 17, text: "وَيُسۡقَوۡنَ فِيهَا كَأۡسٗا كَانَ مِزَاجُهَا زَنجَبِيلًا"))
    result.append(Verse(sura: 76, ayah: 18, text: "عَيۡنٗا فِيهَا تُسَمَّىٰ سَلۡسَبِيلٗا"))
    result.append(Verse(sura: 76, ayah: 19, text: "۞وَيَطُوفُ عَلَيۡهِمۡ وِلۡدَٰنٞ مُّخَلَّدُونَ إِذَا رَأَيۡتَهُمۡ حَسِبۡتَهُمۡ لُؤۡلُؤٗا مَّنثُورٗا"))
    result.append(Verse(sura: 76, ayah: 20, text: "وَإِذَا رَأَيۡتَ ثَمَّ رَأَيۡتَ نَعِيمٗا وَمُلۡكٗا كَبِيرًا"))
    result.append(Verse(sura: 76, ayah: 21, text: "عَٰلِيَهُمۡ ثِيَابُ سُندُسٍ خُضۡرٞ وَإِسۡتَبۡرَقٞۖ وَحُلُّوٓاْ أَسَاوِرَ مِن فِضَّةٖ وَسَقَىٰهُمۡ رَبُّهُمۡ شَرَابٗا طَهُورًا"))
    result.append(Verse(sura: 76, ayah: 22, text: "إِنَّ هَٰذَا كَانَ لَكُمۡ جَزَآءٗ وَكَانَ سَعۡيُكُم مَّشۡكُورًا"))
    result.append(Verse(sura: 76, ayah: 23, text: "إِنَّا نَحۡنُ نَزَّلۡنَا عَلَيۡكَ ٱلۡقُرۡءَانَ تَنزِيلٗا"))
    result.append(Verse(sura: 76, ayah: 24, text: "فَٱصۡبِرۡ لِحُكۡمِ رَبِّكَ وَلَا تُطِعۡ مِنۡهُمۡ ءَاثِمًا أَوۡ كَفُورٗا"))
    result.append(Verse(sura: 76, ayah: 25, text: "وَٱذۡكُرِ ٱسۡمَ رَبِّكَ بُكۡرَةٗ وَأَصِيلٗا"))
    result.append(Verse(sura: 76, ayah: 26, text: "وَمِنَ ٱلَّيۡلِ فَٱسۡجُدۡ لَهُۥ وَسَبِّحۡهُ لَيۡلٗا طَوِيلًا"))
    result.append(Verse(sura: 76, ayah: 27, text: "إِنَّ هَٰٓؤُلَآءِ يُحِبُّونَ ٱلۡعَاجِلَةَ وَيَذَرُونَ وَرَآءَهُمۡ يَوۡمٗا ثَقِيلٗا"))
    result.append(Verse(sura: 76, ayah: 28, text: "نَّحۡنُ خَلَقۡنَٰهُمۡ وَشَدَدۡنَآ أَسۡرَهُمۡۖ وَإِذَا شِئۡنَا بَدَّلۡنَآ أَمۡثَٰلَهُمۡ تَبۡدِيلًا"))
    result.append(Verse(sura: 76, ayah: 29, text: "إِنَّ هَٰذِهِۦ تَذۡكِرَةٞۖ فَمَن شَآءَ ٱتَّخَذَ إِلَىٰ رَبِّهِۦ سَبِيلٗا"))
    result.append(Verse(sura: 76, ayah: 30, text: "وَمَا تَشَآءُونَ إِلَّآ أَن يَشَآءَ ٱللَّهُۚ إِنَّ ٱللَّهَ كَانَ عَلِيمًا حَكِيمٗا"))
    result.append(Verse(sura: 76, ayah: 31, text: "يُدۡخِلُ مَن يَشَآءُ فِي رَحۡمَتِهِۦۚ وَٱلظَّٰلِمِينَ أَعَدَّ لَهُمۡ عَذَابًا أَلِيمَۢا"))
    result.append(Verse(sura: 77, ayah: 1, text: "وَٱلۡمُرۡسَلَٰتِ عُرۡفٗا"))
    result.append(Verse(sura: 77, ayah: 2, text: "فَٱلۡعَٰصِفَٰتِ عَصۡفٗا"))
    result.append(Verse(sura: 77, ayah: 3, text: "وَٱلنَّٰشِرَٰتِ نَشۡرٗا"))
    result.append(Verse(sura: 77, ayah: 4, text: "فَٱلۡفَٰرِقَٰتِ فَرۡقٗا"))
    result.append(Verse(sura: 77, ayah: 5, text: "فَٱلۡمُلۡقِيَٰتِ ذِكۡرًا"))
    result.append(Verse(sura: 77, ayah: 6, text: "عُذۡرًا أَوۡ نُذۡرًا"))
    result.append(Verse(sura: 77, ayah: 7, text: "إِنَّمَا تُوعَدُونَ لَوَٰقِعٞ"))
    result.append(Verse(sura: 77, ayah: 8, text: "فَإِذَا ٱلنُّجُومُ طُمِسَتۡ"))
    result.append(Verse(sura: 77, ayah: 9, text: "وَإِذَا ٱلسَّمَآءُ فُرِجَتۡ"))
    result.append(Verse(sura: 77, ayah: 10, text: "وَإِذَا ٱلۡجِبَالُ نُسِفَتۡ"))
    result.append(Verse(sura: 77, ayah: 11, text: "وَإِذَا ٱلرُّسُلُ أُقِّتَتۡ"))
    result.append(Verse(sura: 77, ayah: 12, text: "لِأَيِّ يَوۡمٍ أُجِّلَتۡ"))
    result.append(Verse(sura: 77, ayah: 13, text: "لِيَوۡمِ ٱلۡفَصۡلِ"))
    result.append(Verse(sura: 77, ayah: 14, text: "وَمَآ أَدۡرَىٰكَ مَا يَوۡمُ ٱلۡفَصۡلِ"))
    result.append(Verse(sura: 77, ayah: 15, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 16, text: "أَلَمۡ نُهۡلِكِ ٱلۡأَوَّلِينَ"))
    result.append(Verse(sura: 77, ayah: 17, text: "ثُمَّ نُتۡبِعُهُمُ ٱلۡأٓخِرِينَ"))
    result.append(Verse(sura: 77, ayah: 18, text: "كَذَٰلِكَ نَفۡعَلُ بِٱلۡمُجۡرِمِينَ"))
    result.append(Verse(sura: 77, ayah: 19, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 20, text: "أَلَمۡ نَخۡلُقكُّم مِّن مَّآءٖ مَّهِينٖ"))
    result.append(Verse(sura: 77, ayah: 21, text: "فَجَعَلۡنَٰهُ فِي قَرَارٖ مَّكِينٍ"))
    result.append(Verse(sura: 77, ayah: 22, text: "إِلَىٰ قَدَرٖ مَّعۡلُومٖ"))
    result.append(Verse(sura: 77, ayah: 23, text: "فَقَدَرۡنَا فَنِعۡمَ ٱلۡقَٰدِرُونَ"))
    result.append(Verse(sura: 77, ayah: 24, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 25, text: "أَلَمۡ نَجۡعَلِ ٱلۡأَرۡضَ كِفَاتًا"))
    result.append(Verse(sura: 77, ayah: 26, text: "أَحۡيَآءٗ وَأَمۡوَٰتٗا"))
    result.append(Verse(sura: 77, ayah: 27, text: "وَجَعَلۡنَا فِيهَا رَوَٰسِيَ شَٰمِخَٰتٖ وَأَسۡقَيۡنَٰكُم مَّآءٗ فُرَاتٗا"))
    result.append(Verse(sura: 77, ayah: 28, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 29, text: "ٱنطَلِقُوٓاْ إِلَىٰ مَا كُنتُم بِهِۦ تُكَذِّبُونَ"))
    result.append(Verse(sura: 77, ayah: 30, text: "ٱنطَلِقُوٓاْ إِلَىٰ ظِلّٖ ذِي ثَلَٰثِ شُعَبٖ"))
    result.append(Verse(sura: 77, ayah: 31, text: "لَّا ظَلِيلٖ وَلَا يُغۡنِي مِنَ ٱللَّهَبِ"))
    result.append(Verse(sura: 77, ayah: 32, text: "إِنَّهَا تَرۡمِي بِشَرَرٖ كَٱلۡقَصۡرِ"))
    result.append(Verse(sura: 77, ayah: 33, text: "كَأَنَّهُۥ جِمَٰلَتٞ صُفۡرٞ"))
    result.append(Verse(sura: 77, ayah: 34, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 35, text: "هَٰذَا يَوۡمُ لَا يَنطِقُونَ"))
    result.append(Verse(sura: 77, ayah: 36, text: "وَلَا يُؤۡذَنُ لَهُمۡ فَيَعۡتَذِرُونَ"))
    result.append(Verse(sura: 77, ayah: 37, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 38, text: "هَٰذَا يَوۡمُ ٱلۡفَصۡلِۖ جَمَعۡنَٰكُمۡ وَٱلۡأَوَّلِينَ"))
    result.append(Verse(sura: 77, ayah: 39, text: "فَإِن كَانَ لَكُمۡ كَيۡدٞ فَكِيدُونِ"))
    result.append(Verse(sura: 77, ayah: 40, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 41, text: "إِنَّ ٱلۡمُتَّقِينَ فِي ظِلَٰلٖ وَعُيُونٖ"))
    result.append(Verse(sura: 77, ayah: 42, text: "وَفَوَٰكِهَ مِمَّا يَشۡتَهُونَ"))
    result.append(Verse(sura: 77, ayah: 43, text: "كُلُواْ وَٱشۡرَبُواْ هَنِيٓـَٔۢا بِمَا كُنتُمۡ تَعۡمَلُونَ"))
    result.append(Verse(sura: 77, ayah: 44, text: "إِنَّا كَذَٰلِكَ نَجۡزِي ٱلۡمُحۡسِنِينَ"))
    result.append(Verse(sura: 77, ayah: 45, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 46, text: "كُلُواْ وَتَمَتَّعُواْ قَلِيلًا إِنَّكُم مُّجۡرِمُونَ"))
    result.append(Verse(sura: 77, ayah: 47, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 48, text: "وَإِذَا قِيلَ لَهُمُ ٱرۡكَعُواْ لَا يَرۡكَعُونَ"))
    result.append(Verse(sura: 77, ayah: 49, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 77, ayah: 50, text: "فَبِأَيِّ حَدِيثِۭ بَعۡدَهُۥ يُؤۡمِنُونَ"))
    result.append(Verse(sura: 78, ayah: 1, text: "عَمَّ يَتَسَآءَلُونَ"))
    result.append(Verse(sura: 78, ayah: 2, text: "عَنِ ٱلنَّبَإِ ٱلۡعَظِيمِ"))
    result.append(Verse(sura: 78, ayah: 3, text: "ٱلَّذِي هُمۡ فِيهِ مُخۡتَلِفُونَ"))
    result.append(Verse(sura: 78, ayah: 4, text: "كَلَّا سَيَعۡلَمُونَ"))
    result.append(Verse(sura: 78, ayah: 5, text: "ثُمَّ كَلَّا سَيَعۡلَمُونَ"))
    result.append(Verse(sura: 78, ayah: 6, text: "أَلَمۡ نَجۡعَلِ ٱلۡأَرۡضَ مِهَٰدٗا"))
    result.append(Verse(sura: 78, ayah: 7, text: "وَٱلۡجِبَالَ أَوۡتَادٗا"))
    result.append(Verse(sura: 78, ayah: 8, text: "وَخَلَقۡنَٰكُمۡ أَزۡوَٰجٗا"))
    result.append(Verse(sura: 78, ayah: 9, text: "وَجَعَلۡنَا نَوۡمَكُمۡ سُبَاتٗا"))
    result.append(Verse(sura: 78, ayah: 10, text: "وَجَعَلۡنَا ٱلَّيۡلَ لِبَاسٗا"))
    result.append(Verse(sura: 78, ayah: 11, text: "وَجَعَلۡنَا ٱلنَّهَارَ مَعَاشٗا"))
    result.append(Verse(sura: 78, ayah: 12, text: "وَبَنَيۡنَا فَوۡقَكُمۡ سَبۡعٗا شِدَادٗا"))
    result.append(Verse(sura: 78, ayah: 13, text: "وَجَعَلۡنَا سِرَاجٗا وَهَّاجٗا"))
    result.append(Verse(sura: 78, ayah: 14, text: "وَأَنزَلۡنَا مِنَ ٱلۡمُعۡصِرَٰتِ مَآءٗ ثَجَّاجٗا"))
    result.append(Verse(sura: 78, ayah: 15, text: "لِّنُخۡرِجَ بِهِۦ حَبّٗا وَنَبَاتٗا"))
    result.append(Verse(sura: 78, ayah: 16, text: "وَجَنَّٰتٍ أَلۡفَافًا"))
    result.append(Verse(sura: 78, ayah: 17, text: "إِنَّ يَوۡمَ ٱلۡفَصۡلِ كَانَ مِيقَٰتٗا"))
    result.append(Verse(sura: 78, ayah: 18, text: "يَوۡمَ يُنفَخُ فِي ٱلصُّورِ فَتَأۡتُونَ أَفۡوَاجٗا"))
    result.append(Verse(sura: 78, ayah: 19, text: "وَفُتِحَتِ ٱلسَّمَآءُ فَكَانَتۡ أَبۡوَٰبٗا"))
    result.append(Verse(sura: 78, ayah: 20, text: "وَسُيِّرَتِ ٱلۡجِبَالُ فَكَانَتۡ سَرَابًا"))
    result.append(Verse(sura: 78, ayah: 21, text: "إِنَّ جَهَنَّمَ كَانَتۡ مِرۡصَادٗا"))
    result.append(Verse(sura: 78, ayah: 22, text: "لِّلطَّٰغِينَ مَـَٔابٗا"))
    result.append(Verse(sura: 78, ayah: 23, text: "لَّٰبِثِينَ فِيهَآ أَحۡقَابٗا"))
    result.append(Verse(sura: 78, ayah: 24, text: "لَّا يَذُوقُونَ فِيهَا بَرۡدٗا وَلَا شَرَابًا"))
    result.append(Verse(sura: 78, ayah: 25, text: "إِلَّا حَمِيمٗا وَغَسَّاقٗا"))
    result.append(Verse(sura: 78, ayah: 26, text: "جَزَآءٗ وِفَاقًا"))
    result.append(Verse(sura: 78, ayah: 27, text: "إِنَّهُمۡ كَانُواْ لَا يَرۡجُونَ حِسَابٗا"))
    result.append(Verse(sura: 78, ayah: 28, text: "وَكَذَّبُواْ بِـَٔايَٰتِنَا كِذَّابٗا"))
    result.append(Verse(sura: 78, ayah: 29, text: "وَكُلَّ شَيۡءٍ أَحۡصَيۡنَٰهُ كِتَٰبٗا"))
    result.append(Verse(sura: 78, ayah: 30, text: "فَذُوقُواْ فَلَن نَّزِيدَكُمۡ إِلَّا عَذَابًا"))
    result.append(Verse(sura: 78, ayah: 31, text: "إِنَّ لِلۡمُتَّقِينَ مَفَازًا"))
    result.append(Verse(sura: 78, ayah: 32, text: "حَدَآئِقَ وَأَعۡنَٰبٗا"))
    result.append(Verse(sura: 78, ayah: 33, text: "وَكَوَاعِبَ أَتۡرَابٗا"))
    result.append(Verse(sura: 78, ayah: 34, text: "وَكَأۡسٗا دِهَاقٗا"))
    result.append(Verse(sura: 78, ayah: 35, text: "لَّا يَسۡمَعُونَ فِيهَا لَغۡوٗا وَلَا كِذَّٰبٗا"))
    result.append(Verse(sura: 78, ayah: 36, text: "جَزَآءٗ مِّن رَّبِّكَ عَطَآءً حِسَابٗا"))
    result.append(Verse(sura: 78, ayah: 37, text: "رَّبِّ ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضِ وَمَا بَيۡنَهُمَا ٱلرَّحۡمَٰنِۖ لَا يَمۡلِكُونَ مِنۡهُ خِطَابٗا"))
    result.append(Verse(sura: 78, ayah: 38, text: "يَوۡمَ يَقُومُ ٱلرُّوحُ وَٱلۡمَلَٰٓئِكَةُ صَفّٗاۖ لَّا يَتَكَلَّمُونَ إِلَّا مَنۡ أَذِنَ لَهُ ٱلرَّحۡمَٰنُ وَقَالَ صَوَابٗا"))
    result.append(Verse(sura: 78, ayah: 39, text: "ذَٰلِكَ ٱلۡيَوۡمُ ٱلۡحَقُّۖ فَمَن شَآءَ ٱتَّخَذَ إِلَىٰ رَبِّهِۦ مَـَٔابًا"))
    result.append(Verse(sura: 78, ayah: 40, text: "إِنَّآ أَنذَرۡنَٰكُمۡ عَذَابٗا قَرِيبٗا يَوۡمَ يَنظُرُ ٱلۡمَرۡءُ مَا قَدَّمَتۡ يَدَاهُ وَيَقُولُ ٱلۡكَافِرُ يَٰلَيۡتَنِي كُنتُ تُرَٰبَۢا"))
    result.append(Verse(sura: 79, ayah: 1, text: "وَٱلنَّٰزِعَٰتِ غَرۡقٗا"))
    result.append(Verse(sura: 79, ayah: 2, text: "وَٱلنَّٰشِطَٰتِ نَشۡطٗا"))
    result.append(Verse(sura: 79, ayah: 3, text: "وَٱلسَّٰبِحَٰتِ سَبۡحٗا"))
    result.append(Verse(sura: 79, ayah: 4, text: "فَٱلسَّٰبِقَٰتِ سَبۡقٗا"))
    result.append(Verse(sura: 79, ayah: 5, text: "فَٱلۡمُدَبِّرَٰتِ أَمۡرٗا"))
    result.append(Verse(sura: 79, ayah: 6, text: "يَوۡمَ تَرۡجُفُ ٱلرَّاجِفَةُ"))
    result.append(Verse(sura: 79, ayah: 7, text: "تَتۡبَعُهَا ٱلرَّادِفَةُ"))
    result.append(Verse(sura: 79, ayah: 8, text: "قُلُوبٞ يَوۡمَئِذٖ وَاجِفَةٌ"))
    result.append(Verse(sura: 79, ayah: 9, text: "أَبۡصَٰرُهَا خَٰشِعَةٞ"))
    result.append(Verse(sura: 79, ayah: 10, text: "يَقُولُونَ أَءِنَّا لَمَرۡدُودُونَ فِي ٱلۡحَافِرَةِ"))
    result.append(Verse(sura: 79, ayah: 11, text: "أَءِذَا كُنَّا عِظَٰمٗا نَّخِرَةٗ"))
    result.append(Verse(sura: 79, ayah: 12, text: "قَالُواْ تِلۡكَ إِذٗا كَرَّةٌ خَاسِرَةٞ"))
    result.append(Verse(sura: 79, ayah: 13, text: "فَإِنَّمَا هِيَ زَجۡرَةٞ وَٰحِدَةٞ"))
    result.append(Verse(sura: 79, ayah: 14, text: "فَإِذَا هُم بِٱلسَّاهِرَةِ"))
    result.append(Verse(sura: 79, ayah: 15, text: "هَلۡ أَتَىٰكَ حَدِيثُ مُوسَىٰٓ"))
    result.append(Verse(sura: 79, ayah: 16, text: "إِذۡ نَادَىٰهُ رَبُّهُۥ بِٱلۡوَادِ ٱلۡمُقَدَّسِ طُوًى"))
    result.append(Verse(sura: 79, ayah: 17, text: "ٱذۡهَبۡ إِلَىٰ فِرۡعَوۡنَ إِنَّهُۥ طَغَىٰ"))
    result.append(Verse(sura: 79, ayah: 18, text: "فَقُلۡ هَل لَّكَ إِلَىٰٓ أَن تَزَكَّىٰ"))
    result.append(Verse(sura: 79, ayah: 19, text: "وَأَهۡدِيَكَ إِلَىٰ رَبِّكَ فَتَخۡشَىٰ"))
    result.append(Verse(sura: 79, ayah: 20, text: "فَأَرَىٰهُ ٱلۡأٓيَةَ ٱلۡكُبۡرَىٰ"))
    result.append(Verse(sura: 79, ayah: 21, text: "فَكَذَّبَ وَعَصَىٰ"))
    result.append(Verse(sura: 79, ayah: 22, text: "ثُمَّ أَدۡبَرَ يَسۡعَىٰ"))
    result.append(Verse(sura: 79, ayah: 23, text: "فَحَشَرَ فَنَادَىٰ"))
    result.append(Verse(sura: 79, ayah: 24, text: "فَقَالَ أَنَا۠ رَبُّكُمُ ٱلۡأَعۡلَىٰ"))
    result.append(Verse(sura: 79, ayah: 25, text: "فَأَخَذَهُ ٱللَّهُ نَكَالَ ٱلۡأٓخِرَةِ وَٱلۡأُولَىٰٓ"))
    result.append(Verse(sura: 79, ayah: 26, text: "إِنَّ فِي ذَٰلِكَ لَعِبۡرَةٗ لِّمَن يَخۡشَىٰٓ"))
    result.append(Verse(sura: 79, ayah: 27, text: "ءَأَنتُمۡ أَشَدُّ خَلۡقًا أَمِ ٱلسَّمَآءُۚ بَنَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 28, text: "رَفَعَ سَمۡكَهَا فَسَوَّىٰهَا"))
    result.append(Verse(sura: 79, ayah: 29, text: "وَأَغۡطَشَ لَيۡلَهَا وَأَخۡرَجَ ضُحَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 30, text: "وَٱلۡأَرۡضَ بَعۡدَ ذَٰلِكَ دَحَىٰهَآ"))
    result.append(Verse(sura: 79, ayah: 31, text: "أَخۡرَجَ مِنۡهَا مَآءَهَا وَمَرۡعَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 32, text: "وَٱلۡجِبَالَ أَرۡسَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 33, text: "مَتَٰعٗا لَّكُمۡ وَلِأَنۡعَٰمِكُمۡ"))
    result.append(Verse(sura: 79, ayah: 34, text: "فَإِذَا جَآءَتِ ٱلطَّآمَّةُ ٱلۡكُبۡرَىٰ"))
    result.append(Verse(sura: 79, ayah: 35, text: "يَوۡمَ يَتَذَكَّرُ ٱلۡإِنسَٰنُ مَا سَعَىٰ"))
    result.append(Verse(sura: 79, ayah: 36, text: "وَبُرِّزَتِ ٱلۡجَحِيمُ لِمَن يَرَىٰ"))
    result.append(Verse(sura: 79, ayah: 37, text: "فَأَمَّا مَن طَغَىٰ"))
    result.append(Verse(sura: 79, ayah: 38, text: "وَءَاثَرَ ٱلۡحَيَوٰةَ ٱلدُّنۡيَا"))
    result.append(Verse(sura: 79, ayah: 39, text: "فَإِنَّ ٱلۡجَحِيمَ هِيَ ٱلۡمَأۡوَىٰ"))
    result.append(Verse(sura: 79, ayah: 40, text: "وَأَمَّا مَنۡ خَافَ مَقَامَ رَبِّهِۦ وَنَهَى ٱلنَّفۡسَ عَنِ ٱلۡهَوَىٰ"))
    result.append(Verse(sura: 79, ayah: 41, text: "فَإِنَّ ٱلۡجَنَّةَ هِيَ ٱلۡمَأۡوَىٰ"))
    result.append(Verse(sura: 79, ayah: 42, text: "يَسۡـَٔلُونَكَ عَنِ ٱلسَّاعَةِ أَيَّانَ مُرۡسَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 43, text: "فِيمَ أَنتَ مِن ذِكۡرَىٰهَآ"))
    result.append(Verse(sura: 79, ayah: 44, text: "إِلَىٰ رَبِّكَ مُنتَهَىٰهَآ"))
    result.append(Verse(sura: 79, ayah: 45, text: "إِنَّمَآ أَنتَ مُنذِرُ مَن يَخۡشَىٰهَا"))
    result.append(Verse(sura: 79, ayah: 46, text: "كَأَنَّهُمۡ يَوۡمَ يَرَوۡنَهَا لَمۡ يَلۡبَثُوٓاْ إِلَّا عَشِيَّةً أَوۡ ضُحَىٰهَا"))
    result.append(Verse(sura: 80, ayah: 1, text: "عَبَسَ وَتَوَلَّىٰٓ"))
    result.append(Verse(sura: 80, ayah: 2, text: "أَن جَآءَهُ ٱلۡأَعۡمَىٰ"))
    result.append(Verse(sura: 80, ayah: 3, text: "وَمَا يُدۡرِيكَ لَعَلَّهُۥ يَزَّكَّىٰٓ"))
    result.append(Verse(sura: 80, ayah: 4, text: "أَوۡ يَذَّكَّرُ فَتَنفَعَهُ ٱلذِّكۡرَىٰٓ"))
    result.append(Verse(sura: 80, ayah: 5, text: "أَمَّا مَنِ ٱسۡتَغۡنَىٰ"))
    result.append(Verse(sura: 80, ayah: 6, text: "فَأَنتَ لَهُۥ تَصَدَّىٰ"))
    result.append(Verse(sura: 80, ayah: 7, text: "وَمَا عَلَيۡكَ أَلَّا يَزَّكَّىٰ"))
    result.append(Verse(sura: 80, ayah: 8, text: "وَأَمَّا مَن جَآءَكَ يَسۡعَىٰ"))
    result.append(Verse(sura: 80, ayah: 9, text: "وَهُوَ يَخۡشَىٰ"))
    result.append(Verse(sura: 80, ayah: 10, text: "فَأَنتَ عَنۡهُ تَلَهَّىٰ"))
    result.append(Verse(sura: 80, ayah: 11, text: "كَلَّآ إِنَّهَا تَذۡكِرَةٞ"))
    result.append(Verse(sura: 80, ayah: 12, text: "فَمَن شَآءَ ذَكَرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 13, text: "فِي صُحُفٖ مُّكَرَّمَةٖ"))
    result.append(Verse(sura: 80, ayah: 14, text: "مَّرۡفُوعَةٖ مُّطَهَّرَةِۭ"))
    result.append(Verse(sura: 80, ayah: 15, text: "بِأَيۡدِي سَفَرَةٖ"))
    result.append(Verse(sura: 80, ayah: 16, text: "كِرَامِۭ بَرَرَةٖ"))
    result.append(Verse(sura: 80, ayah: 17, text: "قُتِلَ ٱلۡإِنسَٰنُ مَآ أَكۡفَرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 18, text: "مِنۡ أَيِّ شَيۡءٍ خَلَقَهُۥ"))
    result.append(Verse(sura: 80, ayah: 19, text: "مِن نُّطۡفَةٍ خَلَقَهُۥ فَقَدَّرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 20, text: "ثُمَّ ٱلسَّبِيلَ يَسَّرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 21, text: "ثُمَّ أَمَاتَهُۥ فَأَقۡبَرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 22, text: "ثُمَّ إِذَا شَآءَ أَنشَرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 23, text: "كَلَّا لَمَّا يَقۡضِ مَآ أَمَرَهُۥ"))
    result.append(Verse(sura: 80, ayah: 24, text: "فَلۡيَنظُرِ ٱلۡإِنسَٰنُ إِلَىٰ طَعَامِهِۦٓ"))
    result.append(Verse(sura: 80, ayah: 25, text: "أَنَّا صَبَبۡنَا ٱلۡمَآءَ صَبّٗا"))
    result.append(Verse(sura: 80, ayah: 26, text: "ثُمَّ شَقَقۡنَا ٱلۡأَرۡضَ شَقّٗا"))
    result.append(Verse(sura: 80, ayah: 27, text: "فَأَنۢبَتۡنَا فِيهَا حَبّٗا"))
    result.append(Verse(sura: 80, ayah: 28, text: "وَعِنَبٗا وَقَضۡبٗا"))
    result.append(Verse(sura: 80, ayah: 29, text: "وَزَيۡتُونٗا وَنَخۡلٗا"))
    result.append(Verse(sura: 80, ayah: 30, text: "وَحَدَآئِقَ غُلۡبٗا"))
    result.append(Verse(sura: 80, ayah: 31, text: "وَفَٰكِهَةٗ وَأَبّٗا"))
    result.append(Verse(sura: 80, ayah: 32, text: "مَّتَٰعٗا لَّكُمۡ وَلِأَنۡعَٰمِكُمۡ"))
    result.append(Verse(sura: 80, ayah: 33, text: "فَإِذَا جَآءَتِ ٱلصَّآخَّةُ"))
    result.append(Verse(sura: 80, ayah: 34, text: "يَوۡمَ يَفِرُّ ٱلۡمَرۡءُ مِنۡ أَخِيهِ"))
    result.append(Verse(sura: 80, ayah: 35, text: "وَأُمِّهِۦ وَأَبِيهِ"))
    result.append(Verse(sura: 80, ayah: 36, text: "وَصَٰحِبَتِهِۦ وَبَنِيهِ"))
    result.append(Verse(sura: 80, ayah: 37, text: "لِكُلِّ ٱمۡرِيٕٖ مِّنۡهُمۡ يَوۡمَئِذٖ شَأۡنٞ يُغۡنِيهِ"))
    result.append(Verse(sura: 80, ayah: 38, text: "وُجُوهٞ يَوۡمَئِذٖ مُّسۡفِرَةٞ"))
    result.append(Verse(sura: 80, ayah: 39, text: "ضَاحِكَةٞ مُّسۡتَبۡشِرَةٞ"))
    result.append(Verse(sura: 80, ayah: 40, text: "وَوُجُوهٞ يَوۡمَئِذٍ عَلَيۡهَا غَبَرَةٞ"))
    result.append(Verse(sura: 80, ayah: 41, text: "تَرۡهَقُهَا قَتَرَةٌ"))
    result.append(Verse(sura: 80, ayah: 42, text: "أُوْلَٰٓئِكَ هُمُ ٱلۡكَفَرَةُ ٱلۡفَجَرَةُ"))
    result.append(Verse(sura: 81, ayah: 1, text: "إِذَا ٱلشَّمۡسُ كُوِّرَتۡ"))
    result.append(Verse(sura: 81, ayah: 2, text: "وَإِذَا ٱلنُّجُومُ ٱنكَدَرَتۡ"))
    result.append(Verse(sura: 81, ayah: 3, text: "وَإِذَا ٱلۡجِبَالُ سُيِّرَتۡ"))
    result.append(Verse(sura: 81, ayah: 4, text: "وَإِذَا ٱلۡعِشَارُ عُطِّلَتۡ"))
    result.append(Verse(sura: 81, ayah: 5, text: "وَإِذَا ٱلۡوُحُوشُ حُشِرَتۡ"))
    result.append(Verse(sura: 81, ayah: 6, text: "وَإِذَا ٱلۡبِحَارُ سُجِّرَتۡ"))
    result.append(Verse(sura: 81, ayah: 7, text: "وَإِذَا ٱلنُّفُوسُ زُوِّجَتۡ"))
    result.append(Verse(sura: 81, ayah: 8, text: "وَإِذَا ٱلۡمَوۡءُۥدَةُ سُئِلَتۡ"))
    result.append(Verse(sura: 81, ayah: 9, text: "بِأَيِّ ذَنۢبٖ قُتِلَتۡ"))
    result.append(Verse(sura: 81, ayah: 10, text: "وَإِذَا ٱلصُّحُفُ نُشِرَتۡ"))
    result.append(Verse(sura: 81, ayah: 11, text: "وَإِذَا ٱلسَّمَآءُ كُشِطَتۡ"))
    result.append(Verse(sura: 81, ayah: 12, text: "وَإِذَا ٱلۡجَحِيمُ سُعِّرَتۡ"))
    result.append(Verse(sura: 81, ayah: 13, text: "وَإِذَا ٱلۡجَنَّةُ أُزۡلِفَتۡ"))
    result.append(Verse(sura: 81, ayah: 14, text: "عَلِمَتۡ نَفۡسٞ مَّآ أَحۡضَرَتۡ"))
    result.append(Verse(sura: 81, ayah: 15, text: "فَلَآ أُقۡسِمُ بِٱلۡخُنَّسِ"))
    result.append(Verse(sura: 81, ayah: 16, text: "ٱلۡجَوَارِ ٱلۡكُنَّسِ"))
    result.append(Verse(sura: 81, ayah: 17, text: "وَٱلَّيۡلِ إِذَا عَسۡعَسَ"))
    result.append(Verse(sura: 81, ayah: 18, text: "وَٱلصُّبۡحِ إِذَا تَنَفَّسَ"))
    result.append(Verse(sura: 81, ayah: 19, text: "إِنَّهُۥ لَقَوۡلُ رَسُولٖ كَرِيمٖ"))
    result.append(Verse(sura: 81, ayah: 20, text: "ذِي قُوَّةٍ عِندَ ذِي ٱلۡعَرۡشِ مَكِينٖ"))
    result.append(Verse(sura: 81, ayah: 21, text: "مُّطَاعٖ ثَمَّ أَمِينٖ"))
    result.append(Verse(sura: 81, ayah: 22, text: "وَمَا صَاحِبُكُم بِمَجۡنُونٖ"))
    result.append(Verse(sura: 81, ayah: 23, text: "وَلَقَدۡ رَءَاهُ بِٱلۡأُفُقِ ٱلۡمُبِينِ"))
    result.append(Verse(sura: 81, ayah: 24, text: "وَمَا هُوَ عَلَى ٱلۡغَيۡبِ بِضَنِينٖ"))
    result.append(Verse(sura: 81, ayah: 25, text: "وَمَا هُوَ بِقَوۡلِ شَيۡطَٰنٖ رَّجِيمٖ"))
    result.append(Verse(sura: 81, ayah: 26, text: "فَأَيۡنَ تَذۡهَبُونَ"))
    result.append(Verse(sura: 81, ayah: 27, text: "إِنۡ هُوَ إِلَّا ذِكۡرٞ لِّلۡعَٰلَمِينَ"))
    result.append(Verse(sura: 81, ayah: 28, text: "لِمَن شَآءَ مِنكُمۡ أَن يَسۡتَقِيمَ"))
    result.append(Verse(sura: 81, ayah: 29, text: "وَمَا تَشَآءُونَ إِلَّآ أَن يَشَآءَ ٱللَّهُ رَبُّ ٱلۡعَٰلَمِينَ"))
    result.append(Verse(sura: 82, ayah: 1, text: "إِذَا ٱلسَّمَآءُ ٱنفَطَرَتۡ"))
    result.append(Verse(sura: 82, ayah: 2, text: "وَإِذَا ٱلۡكَوَاكِبُ ٱنتَثَرَتۡ"))
    result.append(Verse(sura: 82, ayah: 3, text: "وَإِذَا ٱلۡبِحَارُ فُجِّرَتۡ"))
    result.append(Verse(sura: 82, ayah: 4, text: "وَإِذَا ٱلۡقُبُورُ بُعۡثِرَتۡ"))
    result.append(Verse(sura: 82, ayah: 5, text: "عَلِمَتۡ نَفۡسٞ مَّا قَدَّمَتۡ وَأَخَّرَتۡ"))
    result.append(Verse(sura: 82, ayah: 6, text: "يَٰٓأَيُّهَا ٱلۡإِنسَٰنُ مَا غَرَّكَ بِرَبِّكَ ٱلۡكَرِيمِ"))
    result.append(Verse(sura: 82, ayah: 7, text: "ٱلَّذِي خَلَقَكَ فَسَوَّىٰكَ فَعَدَلَكَ"))
    result.append(Verse(sura: 82, ayah: 8, text: "فِيٓ أَيِّ صُورَةٖ مَّا شَآءَ رَكَّبَكَ"))
    result.append(Verse(sura: 82, ayah: 9, text: "كَلَّا بَلۡ تُكَذِّبُونَ بِٱلدِّينِ"))
    result.append(Verse(sura: 82, ayah: 10, text: "وَإِنَّ عَلَيۡكُمۡ لَحَٰفِظِينَ"))
    result.append(Verse(sura: 82, ayah: 11, text: "كِرَامٗا كَٰتِبِينَ"))
    result.append(Verse(sura: 82, ayah: 12, text: "يَعۡلَمُونَ مَا تَفۡعَلُونَ"))
    result.append(Verse(sura: 82, ayah: 13, text: "إِنَّ ٱلۡأَبۡرَارَ لَفِي نَعِيمٖ"))
    result.append(Verse(sura: 82, ayah: 14, text: "وَإِنَّ ٱلۡفُجَّارَ لَفِي جَحِيمٖ"))
    result.append(Verse(sura: 82, ayah: 15, text: "يَصۡلَوۡنَهَا يَوۡمَ ٱلدِّينِ"))
    result.append(Verse(sura: 82, ayah: 16, text: "وَمَا هُمۡ عَنۡهَا بِغَآئِبِينَ"))
    result.append(Verse(sura: 82, ayah: 17, text: "وَمَآ أَدۡرَىٰكَ مَا يَوۡمُ ٱلدِّينِ"))
    result.append(Verse(sura: 82, ayah: 18, text: "ثُمَّ مَآ أَدۡرَىٰكَ مَا يَوۡمُ ٱلدِّينِ"))
    result.append(Verse(sura: 82, ayah: 19, text: "يَوۡمَ لَا تَمۡلِكُ نَفۡسٞ لِّنَفۡسٖ شَيۡـٔٗاۖ وَٱلۡأَمۡرُ يَوۡمَئِذٖ لِّلَّهِ"))
    result.append(Verse(sura: 83, ayah: 1, text: "وَيۡلٞ لِّلۡمُطَفِّفِينَ"))
    result.append(Verse(sura: 83, ayah: 2, text: "ٱلَّذِينَ إِذَا ٱكۡتَالُواْ عَلَى ٱلنَّاسِ يَسۡتَوۡفُونَ"))
    result.append(Verse(sura: 83, ayah: 3, text: "وَإِذَا كَالُوهُمۡ أَو وَّزَنُوهُمۡ يُخۡسِرُونَ"))
    result.append(Verse(sura: 83, ayah: 4, text: "أَلَا يَظُنُّ أُوْلَٰٓئِكَ أَنَّهُم مَّبۡعُوثُونَ"))
    result.append(Verse(sura: 83, ayah: 5, text: "لِيَوۡمٍ عَظِيمٖ"))
    result.append(Verse(sura: 83, ayah: 6, text: "يَوۡمَ يَقُومُ ٱلنَّاسُ لِرَبِّ ٱلۡعَٰلَمِينَ"))
    result.append(Verse(sura: 83, ayah: 7, text: "كَلَّآ إِنَّ كِتَٰبَ ٱلۡفُجَّارِ لَفِي سِجِّينٖ"))
    result.append(Verse(sura: 83, ayah: 8, text: "وَمَآ أَدۡرَىٰكَ مَا سِجِّينٞ"))
    result.append(Verse(sura: 83, ayah: 9, text: "كِتَٰبٞ مَّرۡقُومٞ"))
    result.append(Verse(sura: 83, ayah: 10, text: "وَيۡلٞ يَوۡمَئِذٖ لِّلۡمُكَذِّبِينَ"))
    result.append(Verse(sura: 83, ayah: 11, text: "ٱلَّذِينَ يُكَذِّبُونَ بِيَوۡمِ ٱلدِّينِ"))
    result.append(Verse(sura: 83, ayah: 12, text: "وَمَا يُكَذِّبُ بِهِۦٓ إِلَّا كُلُّ مُعۡتَدٍ أَثِيمٍ"))
    result.append(Verse(sura: 83, ayah: 13, text: "إِذَا تُتۡلَىٰ عَلَيۡهِ ءَايَٰتُنَا قَالَ أَسَٰطِيرُ ٱلۡأَوَّلِينَ"))
    result.append(Verse(sura: 83, ayah: 14, text: "كَلَّاۖ بَلۡۜ رَانَ عَلَىٰ قُلُوبِهِم مَّا كَانُواْ يَكۡسِبُونَ"))
    result.append(Verse(sura: 83, ayah: 15, text: "كَلَّآ إِنَّهُمۡ عَن رَّبِّهِمۡ يَوۡمَئِذٖ لَّمَحۡجُوبُونَ"))
    result.append(Verse(sura: 83, ayah: 16, text: "ثُمَّ إِنَّهُمۡ لَصَالُواْ ٱلۡجَحِيمِ"))
    result.append(Verse(sura: 83, ayah: 17, text: "ثُمَّ يُقَالُ هَٰذَا ٱلَّذِي كُنتُم بِهِۦ تُكَذِّبُونَ"))
    result.append(Verse(sura: 83, ayah: 18, text: "كَلَّآ إِنَّ كِتَٰبَ ٱلۡأَبۡرَارِ لَفِي عِلِّيِّينَ"))
    result.append(Verse(sura: 83, ayah: 19, text: "وَمَآ أَدۡرَىٰكَ مَا عِلِّيُّونَ"))
    result.append(Verse(sura: 83, ayah: 20, text: "كِتَٰبٞ مَّرۡقُومٞ"))
    result.append(Verse(sura: 83, ayah: 21, text: "يَشۡهَدُهُ ٱلۡمُقَرَّبُونَ"))
    result.append(Verse(sura: 83, ayah: 22, text: "إِنَّ ٱلۡأَبۡرَارَ لَفِي نَعِيمٍ"))
    result.append(Verse(sura: 83, ayah: 23, text: "عَلَى ٱلۡأَرَآئِكِ يَنظُرُونَ"))
    result.append(Verse(sura: 83, ayah: 24, text: "تَعۡرِفُ فِي وُجُوهِهِمۡ نَضۡرَةَ ٱلنَّعِيمِ"))
    return result
  }
}