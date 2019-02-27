Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyyYc-000119-N8
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 12:43:32 +0000
MIME-Version: 1.0
Date: Wed, 27 Feb 2019 18:13:29 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv2 8/9] ath10k: Add new api to support TID specific
 configuration
In-Reply-To: <20190226123058.yu5brtbu4euwbzxx@bars>
References: <1550813554-11581-1-git-send-email-tamizhr@codeaurora.org>
 <1550813554-11581-9-git-send-email-tamizhr@codeaurora.org>
 <20190226123058.yu5brtbu4euwbzxx@bars>
Message-ID: <eab54b79f171e76e1e1fe7784e98d8ce@codeaurora.org>
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

>> This patch add ops for set_tid_config to support TID
>> specific configuration. STA information along with the
>> TID config change mask to notify driver that which configuration
>> needs to be applied for this current command.
>> If the STA info not available in the command then the
>> configuration will be applied for all connected stations
>> in the vif. TID specific noack configuration requires
>> aggregation disabled and rate for the data TID packets
>> should be basic rates. So, if the TID already configured
>> with noack policy then driver will ignore the aggregation
>> or TX rate related configuration for the same data TID.
>> In TX rate configuration should be applied with highest
>> preamble configuration(HT rates should not be applied
>> for the station which supports vht rates).
>> 
>> Vif specific TID configuration will be applied for all
>> the connected stations except for the station which
>> already applied with the same configuration for the TID
>> through station specific command. Newly connecting stations
>> will be applied with vif TID configuration which will be stored
>> in ieee80211_vif.
>> 
>> Testing:
>>         * Tested HW: QCA9888
>>         * Tested FW: 10.4-3.5.1-00052
>> 
>> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/core.h |   7 +
>>  drivers/net/wireless/ath/ath10k/mac.c  | 602 
>> ++++++++++++++++++++++++++++-----
>>  2 files changed, 529 insertions(+), 80 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h 
>> b/drivers/net/wireless/ath/ath10k/core.h
>> index 27ec555..c25c426 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -82,6 +82,9 @@
>>  /* Default Airtime weight multipler (Tuned for multiclient 
>> performance) */
>>  #define ATH10K_AIRTIME_WEIGHT_MULTIPLIER  4
>> 
>> +#define ATH10K_MAX_RETRY_COUNT 30
>> +#define ATH10K_MAX_TIDS        8
> 
> Is there any reason why you don't use IEEE80211_TID_MAX here ?
> 
Thanks for pointing this one. Somehow I missed it. I will reuse this 
instead ATH10K_MAX_TIDS in the next patchset.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
