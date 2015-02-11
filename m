Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLfiq-0008JN-A2
 for ath10k@lists.infradead.org; Wed, 11 Feb 2015 22:25:29 +0000
Message-ID: <54DBD6C0.5000106@candelatech.com>
Date: Wed, 11 Feb 2015 14:25:04 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT] ath10k: restart fw on tx-credit timeout
References: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
 <54D4E89A.7040602@candelatech.com>
 <CA+BoTQ=HqyGKOBdOmpWOn_VjH1UTWF9nN_PE0uanaGsdeJmB6Q@mail.gmail.com>
 <54D8DA6F.7040805@candelatech.com>
 <CA+BoTQk9C_7efUs6VTZrEz5ECxsvCgfA8ObrAXKjqMpTL8pggA@mail.gmail.com>
 <54DA3957.10402@candelatech.com>
In-Reply-To: <54DA3957.10402@candelatech.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

On 02/10/2015 09:01 AM, Ben Greear wrote:

> I've hacked CT firmware to do a flush of all vdevs itself when it detects WMI hang.
> I don't have a good test bed to reproduce the problem reliably, but I should know
> after a few days if the flush works at all.  If not, then it's a moot point anyway.

So, this appears to at least partially work.

But, what we notice is that when using multiple station vdevs, the system pretty much
becomes useless if we get any significant number of stuck or slow-to-transmit management
buffers over WMI.  Part of this is because WMI messages are sent when holding rtnl
much of the time, I think.

I would guess that an AP with lots of peers associated might have similar problems
if peers are not ACKing packets reliably.

Probably the only useful way to fix this is to make the firmware and driver able to
send management frames over the normal transport like every other data packet?

Any idea what it wasn't written like that to begin with?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
