Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.neratec.com ([46.140.151.2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zo6Sm-00020i-CI
 for ath10k@lists.infradead.org; Mon, 19 Oct 2015 09:10:41 +0000
Subject: Re: FCC DFS support
References: <CAJ+vNU2q1kLBs8wXRN++62bn24ohthFr=0htDMBh7qxsqmeodg@mail.gmail.com>
From: Zefir Kurtisi <zefir.kurtisi@neratec.com>
Message-ID: <5624B374.5080209@neratec.com>
Date: Mon, 19 Oct 2015 11:10:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU2q1kLBs8wXRN++62bn24ohthFr=0htDMBh7qxsqmeodg@mail.gmail.com>
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
To: Tim Harvey <tharvey@gateworks.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, linux-wireless@vger.kernel.org

On 10/16/2015 06:53 PM, Tim Harvey wrote:
> Greetings,
> 
> Is FCC DFS support (from the updated rules released in Aug 2014) fully
> supported in ath10k by the driver/firmware/cards?
> 
> The linux-wireless DFS page [1] has some great info but doesn't really
> list what is currently in place and working and doesn't mention ath10k
> specifically and I didn't see anything on the ath10k page either [2].
> 
> Thanks for any info!
> 
> Regards,
> 
> Tim
> 
> [1] - https://wireless.wiki.kernel.org/en/developers/dfs
> [2] - https://wireless.wiki.kernel.org/en/users/drivers/ath10k
> --
> 

Hi Tim,

you're right, unfortunately the DFS documentation in [1] is quite outdated -
basically in its initial state from 2011 when ath10k was unknown. It took around
four years to get the work done, and since numerous parties contributed at
different times and different modules (driver, mac/cfg, hostapd), the
documentation has not always been updated accordingly.

But the more important fact is: yes, ath10 and ath9k today fully support FCC.

We certified one of our ath9k based products for FCC and ETSI some months ago, and
I got confirmations that ath10k also passed certification testing for FCC.

It is relevant to note that both drivers use the same radar pattern detector (and
all upper layers anyway), so that if ath9k passed, ath10k most probably will also
do (and vice versa).


Hth,
Zefir



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
