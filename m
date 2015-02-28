Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRlZh-0006dq-B8
 for ath10k@lists.infradead.org; Sat, 28 Feb 2015 17:53:13 +0000
Received: from [50.34.201.20] (unknown [50.34.201.20])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id B7F6140A339
 for <ath10k@lists.infradead.org>; Sat, 28 Feb 2015 09:52:49 -0800 (PST)
Message-ID: <54F20070.6070905@candelatech.com>
Date: Sat, 28 Feb 2015 09:52:48 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Getting a 'no-ack' tx status?
References: <54F0FD17.2080603@candelatech.com>
In-Reply-To: <54F0FD17.2080603@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

I think I managed to hack the CT firmware to return the
tx-completion status (OK, XRETRY, DROP) when it is returning the
tx-rate info, and patched the driver to pay attention to it...

A brief test showed some failed-retry counters reported by
the mac80211 stack, so that looks promising.

Will do some more testing when I get a chance.

Thanks,
Ben

On 02/27/2015 03:26 PM, Ben Greear wrote:
> Someone reported to me that they never see the
> tx_done->no_ack flag set on their AP, even when stations are falling
> off the network due to not receiving ACKs.
>
> 	if (tx_done->no_ack)
> 		info->flags &= ~IEEE80211_TX_STAT_ACK;
>
>
> I am having no luck finding the corresponding code in the 10.1.467
> firmware that would cause this to work, but maybe I am just not looking
> in the right place.
>
> Has anyone done any testing to see if ath10k actually reports ACK failures
> properly back up the stack?
>
> Thanks,
> Ben
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
