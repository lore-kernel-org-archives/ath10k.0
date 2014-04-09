Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXqSj-0006Z7-SE
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 11:14:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: WDS and adhoc support with ath10k
References: <603DB158-F608-47C8-AEE8-F0FCFD563699@gmail.com>
 <CAEFj984HyGGfWHNdpAkv4X0k=SBDu+ST9CyBdrfciXn8AZXgrw@mail.gmail.com>
Date: Wed, 9 Apr 2014 14:14:08 +0300
In-Reply-To: <CAEFj984HyGGfWHNdpAkv4X0k=SBDu+ST9CyBdrfciXn8AZXgrw@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Wed, 9 Apr 2014 10:47:33 +0800")
Message-ID: <874n22kb5r.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bruno Antunes <baantunes@gmail.com>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

>> Could someone confirm if WDS and adhoc mode currently don't have support with this driver?
>
> adhoc is working but not perfect, such as rate control not working, no
> HT/VHT rate, and etc. You need to use the firmware version
> 999.999.0.636.
>
> WDS should be working since 4 addresses has fixed by Michal:
> http://lists.infradead.org/pipermail/ath10k/2014-February/001191.html

But the version of ath10k in openwrt is starting to become old, I doubt
it has Michal's fix.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
