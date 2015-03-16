Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXWZA-0000VM-QW
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 15:04:29 +0000
Message-ID: <5506F0E5.2000205@candelatech.com>
Date: Mon, 16 Mar 2015 08:04:05 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k tx99-like test mode?
References: <1934267.DCC3TFggkK@prime>
In-Reply-To: <1934267.DCC3TFggkK@prime>
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
To: Simon Wunderlich <sw@simonwunderlich.de>, ath10k@lists.infradead.org

On 03/16/2015 05:21 AM, Simon Wunderlich wrote:
> Hi,
>
> is there a test mode for ath10k where one can set different legacy/MCS rates to
> test output power levels in a lab? We used tx99 on ath9k for that purpose, is
> there an equivalent feature in ath10k as well?

My firmware and driver changes have recently given the ability to set
fixed rates for all types of traffic.

Only caveat so far as that mgt frames (beacons and such) cannot be set
to HT or VHT rates.

Stock firmware should be able to set all but mgt rates (bcast, ucast, mcast) with a firmware
update, but stock firmware does not support setting mgt rate from what I can tell.

Maybe not quite as good as what you can do with ath9k, but perhaps good enough?

Thanks,
Ben

>
> Thanks!
>      Simon
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
