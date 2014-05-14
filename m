Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkfXJ-0008QQ-6s
 for ath10k@lists.infradead.org; Wed, 14 May 2014 20:12:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: openwrt ath10k / MacBook Pro Retina 802.11ac not connecting
References: <CAMWKU3eT9=ri7P1X69DNw9QshqDR8TUFm3RVuo8=GWuDcCn5oA@mail.gmail.com>
Date: Wed, 14 May 2014 23:11:51 +0300
In-Reply-To: <CAMWKU3eT9=ri7P1X69DNw9QshqDR8TUFm3RVuo8=GWuDcCn5oA@mail.gmail.com>
 (while oneq's message of "Mon, 12 May 2014 22:36:15 -0400")
Message-ID: <874n0sce7s.fsf@kamboji.qca.qualcomm.com>
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
To: while oneq <while1eq1@gmail.com>
Cc: ath10k@lists.infradead.org

Hi,

while oneq <while1eq1@gmail.com> writes:

> Im currently using lib/firmware/ath10k/QCA988X/hw2.0/  on a TP-Link
> Archer C7 v2.0 / OpenWRT [BARRIER BREAKER (Bleeding Edge, r40749)]
>
> Package: kmod-ath10k
> Version: 3.10.36+2014-03-31-1
> Depends: kernel (= 3.10.36-1-6548302841f6df0132fbc6960fa209fb), kmod-ath
> Status: install user installed
> Architecture: ar71xx
>

[...]

>  and am connecting via
>
> a MacBook Pro Retina:
>   Model Name: MacBook Pro
>   Model Identifier: MacBookPro11,3


[...]

> And am unable to get connected to the access point at all, All
> wireless security settings are disabled at the moment.
>
> Any assistance on this issue would be greatly appreciated.

With the information you provided it's difficult to say what's the
problem. Here are some tips to get forward:

* Try disabling all possible features. Setup AP to use simple 11a mode
  with 20 MHz channels without aggregation etc and try to narrow down
  what is causing the problem.

* Try with static IPs.

* Try different channels.

* If you have a wireless sniffer, take 802.11 airlog with that and post
  it somewhere.

* Provide logs from AP, especially dmesg and hostapd debug logs are
  useful.

Please let me know if you need more help with the above.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
