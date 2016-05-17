Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b2dVB-0003N6-BP
 for ath10k@lists.infradead.org; Tue, 17 May 2016 11:49:30 +0000
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
Date: Tue, 17 May 2016 13:43:39 +0200
MIME-Version: 1.0
In-Reply-To: <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
Content-Type: multipart/mixed; boundary="------------BB8CAFA845CE61CEDB86BCC9"
Subject: QCA9984 VHT160 support
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This is a multi-part message in MIME format.
--------------BB8CAFA845CE61CEDB86BCC9
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Attached you will find a testing patch for VHT160 support. i tested it=20
today on a QCA9984 device and it seems to work.
feel free to make any corrections


--=20
Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


--------------BB8CAFA845CE61CEDB86BCC9
Content-Type: text/plain; charset=UTF-8;
 name="vht160.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vht160.patch"

Index: drivers/net/wireless/ath/ath9k/gpio.c
===================================================================
Index: drivers/net/wireless/ath/ath10k/mac.c
===================================================================
--- drivers/net/wireless/ath/ath10k/mac.c	(revision 2910)
+++ drivers/net/wireless/ath/ath10k/mac.c	(working copy)
@@ -539,10 +539,14 @@
 		case NL80211_CHAN_WIDTH_80:
 			phymode = MODE_11AC_VHT80;
 			break;
+		case NL80211_CHAN_WIDTH_160:
+			phymode = MODE_11AC_VHT160;
+			break;
+		case NL80211_CHAN_WIDTH_80P80:
+			phymode = MODE_11AC_VHT80_80;
+			break;
 		case NL80211_CHAN_WIDTH_5:
 		case NL80211_CHAN_WIDTH_10:
-		case NL80211_CHAN_WIDTH_80P80:
-		case NL80211_CHAN_WIDTH_160:
 			phymode = MODE_UNKNOWN;
 			break;
 		}
@@ -2499,6 +2503,8 @@
 		    !ath10k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
 			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
 				phymode = MODE_11AC_VHT80;
+			else if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
+				phymode = MODE_11AC_VHT160;
 			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
 				phymode = MODE_11AC_VHT40;
 			else if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
@@ -4185,6 +4191,10 @@
 
 		vht_cap.cap |= val;
 	}
+	if (ar->vht_cap_info &  IEEE80211_VHT_CAP_SHORT_GI_160) {
+		vht_cap.cap |= IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ;
+		vht_cap.cap |= IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
+	}
 
 	mcs_map = 0;
 	for (i = 0; i < 8; i++) {
@@ -6798,6 +6808,9 @@
 			bw = WMI_PEER_CHWIDTH_80MHZ;
 			break;
 		case IEEE80211_STA_RX_BW_160:
+			bw = WMI_PEER_CHWIDTH_160MHZ;
+			break;
+		default:
 			ath10k_warn(ar, "Invalid bandwidth %d in rc update for %pM\n",
 				    sta->bandwidth, sta->addr);
 			bw = WMI_PEER_CHWIDTH_20MHZ;
Index: drivers/net/wireless/ath/ath10k/htt_rx.c
===================================================================
--- drivers/net/wireless/ath/ath10k/htt_rx.c	(revision 2910)
+++ drivers/net/wireless/ath/ath10k/htt_rx.c	(working copy)
@@ -707,6 +707,10 @@
 		/* 80MHZ */
 		case 2:
 			status->vht_flag |= RX_VHT_FLAG_80MHZ;
+			break;
+		case 3:
+			status->vht_flag |= RX_VHT_FLAG_160MHZ;
+			break;
 		}
 
 		status->flag |= RX_FLAG_VHT;
@@ -2193,6 +2197,8 @@
 	case MODE_11AC_VHT20:
 	case MODE_11AC_VHT40:
 	case MODE_11AC_VHT80:
+	case MODE_11AC_VHT160:
+	case MODE_11AC_VHT80_80:
 		band = NL80211_BAND_5GHZ;
 		break;
 	case MODE_11G:
Index: drivers/net/wireless/ath/ath10k/wmi.h
===================================================================
--- drivers/net/wireless/ath/ath10k/wmi.h	(revision 2910)
+++ drivers/net/wireless/ath/ath10k/wmi.h	(working copy)
@@ -1723,8 +1723,10 @@
 	MODE_11AC_VHT20_2G = 11,
 	MODE_11AC_VHT40_2G = 12,
 	MODE_11AC_VHT80_2G = 13,
-	MODE_UNKNOWN    = 14,
-	MODE_MAX        = 14
+	MODE_11AC_VHT80_80 = 14,
+	MODE_11AC_VHT160 = 15,
+	MODE_UNKNOWN    = 16,
+	MODE_MAX        = 16
 };
 
 static inline const char *ath10k_wmi_phymode_str(enum wmi_phy_mode mode)
@@ -1752,6 +1754,10 @@
 		return "11ac-vht40";
 	case MODE_11AC_VHT80:
 		return "11ac-vht80";
+	case MODE_11AC_VHT160:
+		return "11ac-vht160";
+	case MODE_11AC_VHT80_80:
+		return "11ac-vht80+80";
 	case MODE_11AC_VHT20_2G:
 		return "11ac-vht20-2g";
 	case MODE_11AC_VHT40_2G:
@@ -5748,6 +5754,7 @@
 	WMI_PEER_CHWIDTH_20MHZ = 0,
 	WMI_PEER_CHWIDTH_40MHZ = 1,
 	WMI_PEER_CHWIDTH_80MHZ = 2,
+	WMI_PEER_CHWIDTH_160MHZ = 3,
 };
 
 enum wmi_peer_param {
Index: compat/backport-4.5.c
===================================================================
\ No newline at end of file
Index: backport-include/backport/leds-disabled.h
===================================================================
Index: backport-include/linux/leds.h
===================================================================
Index: net/wireless/db.txt
===================================================================

--------------BB8CAFA845CE61CEDB86BCC9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--------------BB8CAFA845CE61CEDB86BCC9--
