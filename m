Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXiYS-0006du-14
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 02:48:01 +0000
Received: by mail-vc0-f180.google.com with SMTP id lf12so1526873vcb.39
 for <ath10k@lists.infradead.org>; Tue, 08 Apr 2014 19:47:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <603DB158-F608-47C8-AEE8-F0FCFD563699@gmail.com>
References: <603DB158-F608-47C8-AEE8-F0FCFD563699@gmail.com>
Date: Wed, 9 Apr 2014 10:47:33 +0800
Message-ID: <CAEFj984HyGGfWHNdpAkv4X0k=SBDu+ST9CyBdrfciXn8AZXgrw@mail.gmail.com>
Subject: Re: WDS and adhoc support with ath10k
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
To: Bruno Antunes <baantunes@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Could someone confirm if WDS and adhoc mode currently don't have support with this driver?

adhoc is working but not perfect, such as rate control not working, no
HT/VHT rate, and etc. You need to use the firmware version
999.999.0.636.

WDS should be working since 4 addresses has fixed by Michal:
http://lists.infradead.org/pipermail/ath10k/2014-February/001191.html

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
