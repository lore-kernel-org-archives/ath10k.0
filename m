Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22d.google.com ([2607:f8b0:400c:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGJgF-00084z-Ue
 for ath10k@lists.infradead.org; Thu, 20 Feb 2014 02:48:08 +0000
Received: by mail-ve0-f173.google.com with SMTP id jw12so1296720veb.18
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 18:47:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <877g8rxgyf.fsf@kamboji.qca.qualcomm.com>
References: <1392197866-1261-1-git-send-email-yeohchunyeow@gmail.com>
 <877g8rxgyf.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 20 Feb 2014 10:47:45 +0800
Message-ID: <CAEFj9870+z+2yxjO7F69bGv3XzKNmi+ddyF41WSnv2aR98kjrw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: set the mactime of ieee80211_rx_status
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Why? Where do you need tsf exactly? And what bug are you actually fixing
> here?

There are two type of configuration modes that require local TSF, IBSS
and mesh for operation and also monitor mode.

For IBSS, it is use for merging of BSSID (mac address) with same SSID
name, but currently this is taking care by the following "ugly" patch.
http://lists.infradead.org/pipermail/ath10k/2014-February/001159.html

Mesh mode needs this for more accurate synchronization purpose.

Besides, the monitor mode requires this to add extra piece of
information in radiotap header for local TSF.

> Do we get some regressions because of proving only a 32 bit TSF? Which
> one is better, provide a 32-bit TSF or not at all?
32-bit is not good. It could cause problem when inter-operate with
other non-ath10k drivers with 64-bit local TSF. The better is that we
can get the 64-bit local TSF. providing high TSF and low TSF as found
in "struct wmi_comb_phyerr_rx_hd". Is this possible with current FW?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
