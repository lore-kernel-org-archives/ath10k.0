Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze7pW-0006a3-4g
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 20:36:54 +0000
Subject: Re: Link can't get estabilished over RB911AC boards
References: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56006A50.4000608@candelatech.com>
Date: Mon, 21 Sep 2015 13:36:32 -0700
MIME-Version: 1.0
In-Reply-To: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Alessandro Bolletta <alessandro@mediaspot.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/21/2015 12:57 PM, Alessandro Bolletta wrote:
> Hi,
>
> I have two Mikrotik RB911AC boards (radio based on QCA9882) in which I injected OpenWRT 15.05 and ath10k.
>
> I managed to get them connected in AP/STA configuration in a very short (2 meters) distance, but when I try to connect them on 5 kilometers, even if I set the distance parameter on OpenWRT's UCI config files properly, it tries to connect but after 3 retries, it declares unauthenticated.
>
> No problem with the same firmware on ath9k, for example.
> Signal is stable at -62 dbm, I also tried to change channels and push tx power, but nothing helped to do the trick.
> Also tried with every firmware combination (10.2.4, CT firmware, 999.999.0.636, 10.1.467.2-1), without success.
>
> Is there anybody who can tell me why? Could it be due to the kernel version (i'm running on 3.18.21)?

You probably need to adjust ack timings.  I have some un-tested firmware
support for this in the CT firmware, but I haven't fully wired it up to
the driver.

Someone with a bit of time and skill could add this to the ath10k
driver if they wanted to.  This commit has some details.

http://dmz2.candelatech.com/?p=linux-4.0.dev.y/.git;a=commit;h=abd3ee5c4d297e56b854864624152f5704c5df20

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
