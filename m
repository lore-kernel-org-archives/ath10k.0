Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJcKH-00017x-St
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 05:51:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
Date: Tue, 19 Aug 2014 08:50:50 +0300
In-Reply-To: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 (Avery Pennarun's message of "Mon, 18 Aug 2014 22:26:42 -0400")
Message-ID: <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> In the ath9k and several other drivers, commands like the following
> work while in AP mode:
>
>   iw wlan0 scan -u ap-force passive
> and
>   iw wlan0 offchannel 2452  100
>
> On ath10k (using a driver from v3.15-rc1 as of April 13th), these tell
> me the operation is not supported.

Yeah, mac80211 only supports this with sw_scan but ath10k uses hw_scan.
From ieee80211_alloc_hw():

	if (!ops->hw_scan)
		wiphy->features |= NL80211_FEATURE_LOW_PRIORITY_SCAN |
				   NL80211_FEATURE_AP_SCAN;

> Are there any plans to implement this feature?  It's important in
> order to implement automatic channel change in case of changes in the
> interference environment.

No plans at the moment. Does anyone know how much work would it be to
change mac80211 to support this with hw_scan?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
