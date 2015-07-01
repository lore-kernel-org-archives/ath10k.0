Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAGTt-00030r-SR
 for ath10k@lists.infradead.org; Wed, 01 Jul 2015 11:47:10 +0000
Message-ID: <5593D314.1080600@qti.qualcomm.com>
Date: Wed, 1 Jul 2015 17:16:28 +0530
From: rmani <rmani@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/8] ath10k: add 10.4 fw specific htt msg definitions
References: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
 <1434984747-24294-6-git-send-email-rmani@qti.qualcomm.com>
 <878ub0xiv1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878ub0xiv1.fsf@kamboji.qca.qualcomm.com>
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

On 07/01/2015 04:08 PM, Kalle Valo wrote:
> Raja Mani <rmani@qti.qualcomm.com> writes:
>
>> New htt event table is added for 10.4 firmware. Following new htt
>> events are available only 10.4. adding this to generic htt event
>> table,
>> 	HTT_T2H_MSG_TYPE_EN_STATS,
>> 	HTT_T2H_MSG_TYPE_TX_FETCH_IND,
>> 	HTT_T2H_MSG_TYPE_TX_FETCH_CONF,
>> 	HTT_T2H_MSG_TYPE_TX_LOW_LATENCY_IND
>>
>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>
> [...]
>
>> @@ -1146,6 +1147,8 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
>>   			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_TLV;
>>   			break;
>>   		case ATH10K_FW_WMI_OP_VERSION_10_4:
>> +			ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_10_4;
>> +			break;
>>   		case ATH10K_FW_WMI_OP_VERSION_UNSET:
>>   		case ATH10K_FW_WMI_OP_VERSION_MAX:
>>   			WARN_ON(1);
>
> So this switch block is only to support older firmware versions which do
> not have ATH10K_FW_IE_HTT_OP_VERSION yet. 10.4 firmware will always have
> it set so we don't need to have any backwards compatibility code for
> 10.4. I changed this part with the diff below. Please review.
>
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1147,8 +1147,6 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
>                          ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_TLV;
>                          break;
>                  case ATH10K_FW_WMI_OP_VERSION_10_4:
> -                       ar->htt.op_version = ATH10K_FW_HTT_OP_VERSION_10_4;
> -                       break;
>                  case ATH10K_FW_WMI_OP_VERSION_UNSET:
>                  case ATH10K_FW_WMI_OP_VERSION_MAX:
>                          WARN_ON(1);
>

As you suggested, we can ignore htt op version assignment here and use
what comes in firmware IE. I am fine with this change.

--
Raja

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
