Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guBEP-0003Z0-9h
 for ath10k@lists.infradead.org; Thu, 14 Feb 2019 07:14:50 +0000
MIME-Version: 1.0
Date: Thu, 14 Feb 2019 12:44:45 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
In-Reply-To: <a7d97b692da245a8b85769d7766ceba7@aphydexm01f.ap.qualcomm.com>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <20190213190135.lp3sg3u3b4mmve7l@bars>
 <a7d97b692da245a8b85769d7766ceba7@aphydexm01f.ap.qualcomm.com>
Message-ID: <cb188f3a7f7250e3b7bc9ec6f68d603e@codeaurora.org>
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
To: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Sergey,

> Hello Tamizh,
> 
>> Add infrastructure for per TID aggregation/retry count configurations
>> such as retry count and AMPDU aggregation control(disable/enable).
>> In some scenario reducing the number of retry count for a specific
>> data traffic can reduce the latency by proceeding with the next packet
>> instead of retrying the same packet more time. This will be useful
>> where the next packet can resume the operation without an issue.
>> Here added NL80211_CMD_SET_TID_CONFIG to support this operation by
>> accepting retry count and AMPDU aggregation control.
>> This command can accept STA mac addreess to make the configuration
>> station specific rather than applying to all the connected stations to
>> the netdev.
>> 
>> Tamizh chelvam (3):
>>   nl80211: Add netlink attribute for AMPDU aggregation enable/disable
>>   tid conf 3
>>   ath10k: Add support to configure TID specific configuration
>> 
>> Vasanthakumar Thiagarajan (1):
>>   New netlink command for TID specific configuration
> 
> Could you please share your further plans regarding this patch series ?
> Do you plan to send next revision in the forseable future ?
> Or have you decided to abandon this approach ?
> 
I'm working on new patchsets. I will send it in a week.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
