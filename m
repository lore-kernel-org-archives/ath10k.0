Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIVB-0006py-3w
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:32:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add SURVEY_INFO_IN_USE for current channel on
 survey
References: <1413996362-44397-1-git-send-email-nbd@openwrt.org>
 <87k33rqmwq.fsf@kamboji.qca.qualcomm.com>
 <5448DF0B.2090906@openwrt.org>
Date: Thu, 23 Oct 2014 16:31:59 +0300
In-Reply-To: <5448DF0B.2090906@openwrt.org> (Felix Fietkau's message of "Thu, 
 23 Oct 2014 12:57:15 +0200")
Message-ID: <87siieq5dc.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

> On 2014-10-23 09:13, Kalle Valo wrote:
>> Felix Fietkau <nbd@openwrt.org> writes:
>> 
>>> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/mac.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>>> index 4670930..bc440dc 100644
>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -3975,6 +3975,9 @@ static int ath10k_get_survey(struct ieee80211_hw *hw, int idx,
>>>  
>>>  	survey->channel = &sband->channels[idx];
>>>  
>>> +	if (ar->rx_channel == survey->channel)
>>> +		survey->filled |= SURVEY_INFO_IN_USE;
>>> +
>> 
>> Why? Does this fix a visible bug? What changes from user space point of
>> view? I'm asking because I want to add something to the commit log.
>
> When user space requests survey info, it is useful to know which of the
> survey data refers to the channel that is currently actively being used.
> One of the use cases is getting the current channel noise for status output.
> Without this flag you would have to look up the channel separately and
> then compare it against the frequency in the survey output in user space.

Perfect, thanks. I added this to the commit log in ath-next-test:

commit f7528c6fca1b2ee1899069f1066012f47586a0c8
Author: Felix Fietkau <nbd@openwrt.org>
Date:   Wed Oct 22 18:46:02 2014 +0200

    ath10k: add SURVEY_INFO_IN_USE for current channel on survey
    
    When user space requests survey info, it is useful to know which of the survey
    data refers to the channel that is currently actively being used.  One of the
    use cases is getting the current channel noise for status output.  Without this
    flag you would have to look up the channel separately and then compare it
    against the frequency in the survey output in user space.
    
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
