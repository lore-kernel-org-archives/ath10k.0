Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhM9X-0008FI-SL
 for ath10k@lists.infradead.org; Wed, 30 Sep 2015 18:30:56 +0000
Message-ID: <1443637830.1859.17.camel@sipsolutions.net>
Subject: Re: Can we ignore frames with invalid BSSID in IBSS mode?
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 30 Sep 2015 20:30:30 +0200
In-Reply-To: <560C19F3.6070903@candelatech.com>
References: <5605D228.7050609@candelatech.com>
 (sfid-20150926_010105_789618_F93D668E)
 <1443595615.1859.2.camel@sipsolutions.net>
 <560BFABC.8090504@candelatech.com>
 <1443626224.1859.9.camel@sipsolutions.net>
 <560C036C.7000401@candelatech.com>
 <1443633267.1859.11.camel@sipsolutions.net>
 <560C19F3.6070903@candelatech.com>
Mime-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Wed, 2015-09-30 at 10:20 -0700, Ben Greear wrote:
> 
> Yes, it is a transmitter side problem, and A-MSDU on IBSS
> is disabled by default in all ath10k firmware versions that I am aware of.

Right.

> I was hoping there might be a way to allow A-MSDU + IBSS + ath10k
> to work in future kernels without applying out-of-tree
> kernel hacks.  This would let people with appropriate firmware
> enable IBSS + A-MSDU for added performance in cases where they
> knew the peer could support the needed work-around.
> 
> I don't think it is worth a lot of effort, but if it were relatively
> simple to fix, then maybe it is worth it.
> 

Had it been a receiver-side issue, then it'd seem reasonable to work
around it. But it being a transmitter-side issue it doesn't really seem
so - *every* possible peer would have to be adjusted, and some might
not even be able to get adjusted (e.g. devices that have A-MSDU
deaggregation in hardware/firmware) ...

So to do that properly you'd have to advertise some sort of quirk
vendor IE, and all that, which seems excessive given the limited use.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
