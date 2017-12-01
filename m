Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKnUs-0006uC-TY
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 15:45:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
Date: Fri, 1 Dec 2017 15:44:33 +0000
Message-ID: <87374uxxjy.fsf@kamboji.qca.qualcomm.com>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <1512125137.38490.70.camel@sakura.staff.proxad.net>
 <7792e2fb2c546d8745c65e48945f2535@codeaurora.org>
In-Reply-To: <7792e2fb2c546d8745c65e48945f2535@codeaurora.org>
 (akolli@codeaurora.org's message of "Fri, 01 Dec 2017 19:18:00 +0530")
Content-Language: en-US
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
To: "akolli@codeaurora.org" <akolli@codeaurora.org>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, "mbizon@freebox.fr" <mbizon@freebox.fr>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>

akolli@codeaurora.org writes:

>>> Parse peer stats from pktlog packets and update the tx rate
>>> information
>>> per STA. This way user space can query about transmit rate with iw:
>>
>> everything works ok, ath10k_update_per_peer_tx_stats() is called and
>> ath10k_sta fields are updated correctly
>>
>> but tx bitrate is still 6 MBit/s in station dump
>>
> Hope CONFIG_MAC80211_DEBUGFS is enabled in your build.
> Please Run ping traffic and see and 'station dump'

This feature should not depend on debugfs. Why is it needed? In patch 1
you already moved pktlog_filter to struct ath10k, does it need something
else as well?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
