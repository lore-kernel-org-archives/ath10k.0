Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUxDW-0000aQ-Ro
 for ath10k@lists.infradead.org; Wed, 03 Aug 2016 14:32:20 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: report channel state information (CSI) at ath10k
Date: Wed, 3 Aug 2016 14:31:49 +0000
Message-ID: <874m716i0d.fsf@qca.qualcomm.com>
References: <CAFuUQkj6AK7y55sg0z+XfQtjFeDDyMZ9AtoKAaip2P+x_mBNVg@mail.gmail.com>
In-Reply-To: <CAFuUQkj6AK7y55sg0z+XfQtjFeDDyMZ9AtoKAaip2P+x_mBNVg@mail.gmail.com>	(YanBo's
 message of "Sun, 24 Jul 2016 00:22:11 +0800")
Content-Language: en-US
Content-ID: <001103B44B407B4E801986DB0AFA1587@qualcomm.com>
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
To: YanBo <dreamfly281@gmail.com>
Cc: "Malinen, Jouni" <jouni@qca.qualcomm.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

YanBo <dreamfly281@gmail.com> writes:

> Wonder whether currently ath10k could get the CSI (channel state information)
> from the FW for each valid RX packet?  I notice the ath9k already has some
> patch (not be upstreamed)used to get such information which could be used for
> upper layer channel evaluation for research purpose,  I remember we haven't
> implemented such feature at ath10k as the FW never report such information, but
> still need get your confirmation.

This is the first time I'm even hearing about CSI so I can't really help
much, sorry.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
