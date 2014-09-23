Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWRYO-0003c6-PX
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 14:58:57 +0000
Message-ID: <54218A9A.7090305@candelatech.com>
Date: Tue, 23 Sep 2014 07:58:34 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath10k: support 32+ stations.
References: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
 <1411149890-12618-3-git-send-email-greearb@candelatech.com>
 <874mvyebmt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874mvyebmt.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 09/23/2014 05:59 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Support up to 32 stations when using CT firmware.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> [...]
>
>> -	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
>> +		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS_CT) - 1;
>> +	else if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>>   		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS) - 1;
>>   	else
>>   		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
>
> [...]
>
>> +/* Over-rides for Candela Technologies firmware */
>> +#define TARGET_10X_NUM_VDEVS_CT			32
>> +#define TARGET_10X_NUM_PEERS_CT			(32 + (TARGET_10X_NUM_VDEVS_CT))
>> +#define TARGET_10X_AST_SKID_LIMIT_CT		(TARGET_10X_NUM_PEERS_CT * TARGET_10X_NUM_PEER_AST)
>
> [...]
>
>> +		if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
>> +			max_num_peers = TARGET_10X_NUM_PEERS_CT - 1;
>
> Like I said before, this hardcoding of values using feature bits is not
> going to work in the long run. It's better that these values come
> directly from FW IEs as integers, that gives us a lot more flexibility
> between firmware versions.
>
> That's why I'll drop patches 2 and 3.

Please suggest the name and definition of the IE(s) that you want for
this feature so I don't have to guess.

I also have a pending patch that supports tx status when using CT
firmware.  How would you prefer this feature be communicated to
the driver?  IE flag?

Please also understand, it will be a bad idea to force the number of
stations based on IE, but we could note upper limits and let module
parameters tune the actual stations?

Note that my patch above, for instance, decreases number of peers, but
increases vdevs.  That works well for my purposes, but others may
want more peers and less vdevs.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
