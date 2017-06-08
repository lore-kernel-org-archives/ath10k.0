Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ15B-0005KK-F3
 for ath10k@lists.infradead.org; Thu, 08 Jun 2017 17:18:55 +0000
Received: by mail-lf0-x242.google.com with SMTP id v20so3549380lfa.2
 for <ath10k@lists.infradead.org>; Thu, 08 Jun 2017 10:18:32 -0700 (PDT)
Subject: Re: [PATCH 1/1] mac80211: ieee80211_rx_napi: remove warning
References: <1496581915-4412-1-git-send-email-erik.stromdahl@gmail.com>
 <1496581915-4412-2-git-send-email-erik.stromdahl@gmail.com>
 <1496872642.3291.4.camel@sipsolutions.net>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <9a570231-00c2-e234-8ac8-fbee66bd07af@gmail.com>
Date: Thu, 8 Jun 2017 19:10:08 +0200
MIME-Version: 1.0
In-Reply-To: <1496872642.3291.4.camel@sipsolutions.net>
Content-Language: en-US
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
To: Johannes Berg <johannes@sipsolutions.net>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 2017-06-07 23:57, Johannes Berg wrote:
> On Sun, 2017-06-04 at 15:11 +0200, Erik Stromdahl wrote:
>> The softirq count is not always incremented during driver
>> operation. This is the case for usb and sdio network
>> drivers.
> 
> I'm pretty sure the warning is correct, and we do rely on having
> local_bh_disable(), otherwise we may end up taking a soft-IRQ and I
> believe there are some things that could get messed up in that case.
> 
Ok, I will make sure to increment the softirq counter before calling
ieee80211_rx then.

> So - I think the warning is there for a reason, and drivers should just
> local_bh_disable() before calling into that. What's wrong with that?
I guess there is nothing wrong with that, it's just that ath10k does not
call local_bh_disable anywhere in the code.
I guess it is relying on lower layers (pcie?) to do that.
When introducing sdio and usb support these calls will have to be added
explicitly in ath10k.

> 
> johannes
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
