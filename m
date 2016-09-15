Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkXSH-00011T-6J
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 14:16:02 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 15/21] ath10k: support CT firmware flag.
Date: Thu, 15 Sep 2016 14:15:31 +0000
Message-ID: <87bmzpb667.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-16-git-send-email-greearb@candelatech.com>
 <87bmzqeeox.fsf@kamboji.qca.qualcomm.com>	<57D96BC7.1080609@candelatech.com>
In-Reply-To: <57D96BC7.1080609@candelatech.com> (Ben Greear's message of "Wed, 
 14 Sep 2016 08:24:55 -0700")
Content-Language: en-US
Content-ID: <578460C4DF151F479CB8DA7074891A29@qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 09/14/2016 07:30 AM, Valo, Kalle wrote:
>> greearb@candelatech.com writes:
>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> Add placeholder so CT firmware can more easily co-exist with upstream
>>> kernel.  CT firmware should be backwards compatible with existing kernels,
>>> but it also has many new features.  Subsequent patches, if acceptable for
>>> upstream, can enable and further describe those features.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/core.c | 1 +
>>>   drivers/net/wireless/ath/ath10k/core.h | 3 +++
>>>   2 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>>> index fa71d57..49c85c3 100644
>>> --- a/drivers/net/wireless/ath/ath10k/core.c
>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>>> @@ -235,6 +235,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
>>>   	[ATH10K_FW_FEATURE_SUPPORTS_ADAPTIVE_CCA] = "adaptive-cca",
>>>   	[ATH10K_FW_FEATURE_MFP_SUPPORT] = "mfp",
>>>   	[ATH10K_FW_FEATURE_PEER_FLOW_CONTROL] = "peer-flow-ctrl",
>>> +	[ATH10K_FW_FEATURE_WMI_10X_CT] = "wmi-10.x-CT",
>>>   };
>>>
>>>   static unsigned int ath10k_core_get_fw_feature_str(char *buf,
>>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>>> index cb6aa8c..f9e3b20 100644
>>> --- a/drivers/net/wireless/ath/ath10k/core.h
>>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>>> @@ -566,6 +566,9 @@ enum ath10k_fw_features {
>>>   	 */
>>>   	ATH10K_FW_FEATURE_PEER_FLOW_CONTROL = 13,
>>>
>>> +	/* Firmware from Candela Technologies, enables more VIFs, etc */
>>> +	ATH10K_FW_FEATURE_WMI_10X_CT = 31,
>>
>> The idea of firmware feature flags to enable (or disable) one particular
>> feature, not a group of features. This way it's easy to enable certain
>> features on different firmware branches. It also makes the maintenance
>> easier as you don't need to remember all the different features one flag
>> enables.
>
> One potential use for this flag:  Bug reports could be automatically directed to me instead
> of QCA.
>
> I have actually re-written much of my earlier logic so that it uses specific
> feature flags now.  I still like the idea of having the driver (and user)
> know it is using CT firmware, but I can live without this flag if needed.

You can do with firmware version string, add something like "-CT" (maybe
you already have?) and it's clearly visible in boot logs and also when
firmware crashes.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
