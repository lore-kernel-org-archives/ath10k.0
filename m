Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0086.outbound.protection.outlook.com ([157.56.112.86]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuKkT-0003y3-HY
 for ath10k@lists.infradead.org; Thu, 05 Nov 2015 13:38:43 +0000
From: Tomi Saarnio <Tomi.Saarnio@ekahau.com>
Subject: Re: Question: ath10k and tcpdump antenna noise information missing
Date: Thu, 5 Nov 2015 13:38:17 +0000
Message-ID: <DB5PR02MB0631E7B41DB8DB60D381AD3EFE290@DB5PR02MB0631.eurprd02.prod.outlook.com>
References: <DB5PR02MB0631EFCD121C0F9F6BAC1C4EFE2C0@DB5PR02MB0631.eurprd02.prod.outlook.com>
 <DB5PR02MB063103DC3F0089F66D588415FE2C0@DB5PR02MB0631.eurprd02.prod.outlook.com>
 <DB5PR02MB06315E3384316A68FB184D81FE2B0@DB5PR02MB0631.eurprd02.prod.outlook.com>,
 <CABkMH_rPXXmhBmBiuZNGbD805TnLKv4R5FjYXfPiX_6jdBAkCQ@mail.gmail.com>,
 <DB5PR02MB063111D3446567B944A3B8FBFE2B0@DB5PR02MB0631.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB063111D3446567B944A3B8FBFE2B0@DB5PR02MB0631.eurprd02.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi All,

After some digging, I found  this piece of code in Linux kernel 4.1 file
net/mac80211/rx.c in function ieee80211_add_rx_radiotap_header:

...
	/* IEEE80211_RADIOTAP_DBM_ANTSIGNAL */
	if (local->hw.flags & IEEE80211_HW_SIGNAL_DBM &&
	    !(status->flag & RX_FLAG_NO_SIGNAL_VAL)) {
		*pos = status->signal;
		rthdr->it_present |=
			cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
		pos++;
	}

	/* IEEE80211_RADIOTAP_LOCK_QUALITY is missing */

	if (!status->chains) {
		/* IEEE80211_RADIOTAP_ANTENNA */
		*pos = status->antenna;
		pos++;
	}

	/* IEEE80211_RADIOTAP_DB_ANTNOISE is not used */

	/* IEEE80211_RADIOTAP_RX_FLAGS */
	/* ensure 2 byte alignment for the 2 byte field as required */
...

The comment 	/* IEEE80211_RADIOTAP_DB_ANTNOISE is not used */ tells quite
clearly why the antenna noise information is not be available in the radiotap and tcpdump.

Clearly this is not a driver issue any more, but a network layer issue. I will try to look
a solution elsewhere how to get the antenna noise information into userspace in a proper way.

Best regards,
Tomi Saarnio

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
