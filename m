Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKy0-0000LB-JZ
 for ath10k@lists.infradead.org; Wed, 30 Sep 2015 17:14:57 +0000
Message-ID: <1443633267.1859.11.camel@sipsolutions.net>
Subject: Re: Can we ignore frames with invalid BSSID in IBSS mode?
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 30 Sep 2015 19:14:27 +0200
In-Reply-To: <560C036C.7000401@candelatech.com>
References: <5605D228.7050609@candelatech.com>
 (sfid-20150926_010105_789618_F93D668E)
 <1443595615.1859.2.camel@sipsolutions.net>
 <560BFABC.8090504@candelatech.com>
 <1443626224.1859.9.camel@sipsolutions.net>
 <560C036C.7000401@candelatech.com>
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

On Wed, 2015-09-30 at 08:44 -0700, Ben Greear wrote:
> 
> Any idea how this could be done in the stack instead of the driver?

I don't see why it should be?

> The problem is that this is a receiver-side issue, so even if I manage
> to hack the ath10k firmware or driver rx logic, it would not fix any other
> IBSS peer connected to ath10k peer.
> 

You mean it's a transmitter-side issue? In that case you should
probably simply disable aggregation on the broken transmitter ...

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
