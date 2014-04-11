Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYTYt-0006YQ-42
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 04:59:39 +0000
Message-ID: <5347769F.2020808@candelatech.com>
Date: Thu, 10 Apr 2014 21:59:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFTv2 3/5] ath10k: rework peer accounting
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 04/09/2014 03:48 AM, Michal Kazior wrote:
> It was troublesome to iterate over peers and
> perform sleepable calls. This will be necessary
> for some upcomming changes to tx flushing.

Just FYI, I tried all yesterday to get my system stable with all
of your RFT patches applied, but it just has all sorts of issues.
I think much of it relates to the management flush logic, perhaps
all the time it spends under lock (including RTNL lock I think)
just makes my system fall apart.

Possibly related to my peculiar environment & firmware, for sure.

I backed out your last two, leaving this one and the two previous,
and it runs better.  I still see the tx-credits hang (this time,
when I tried resetting all 32 stations while transmitting packets),
but at least the stations come up and can transmit packets most of
the time.

Even in the 'mostly working' state, resetting interfaces while
they and other vifs are under heavy packet load can effectively
lock up my user-space app, and things like 'ifconfig -a'
can take 10s of seconds to complete.  So, I probably need
to mitigate more of the sleeps related to flushing somehow.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
