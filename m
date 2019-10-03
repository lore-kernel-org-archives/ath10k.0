Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG0lg-0000JN-Ig
 for ath10k@lists.infradead.org; Thu, 03 Oct 2019 13:03:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Report low ack rssi based on the reason code
References: <1554276181-7879-1-git-send-email-pillair@codeaurora.org>
 <5f25f471-5753-7d4a-91f8-9a3986117580@bowerswilkins.com>
Date: Thu, 03 Oct 2019 16:03:33 +0300
In-Reply-To: <5f25f471-5753-7d4a-91f8-9a3986117580@bowerswilkins.com> (Peter
 Oh's message of "Wed, 3 Apr 2019 16:58:51 +0000")
Message-ID: <878sq20ymy.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Peter Oh <peter.oh@bowerswilkins.com> writes:

> On 04/03/2019 12:23 AM, Rakesh Pillai wrote:
>> Firmware sends peer sta kickout event to the driver
>> along with the reason code for a particular peer.
>>
>> Currently the sta kickout event is delivered to the
>> upper layer without checking if the reason code is
>> valid or not. This causes frequent disconnection of
>> the STA.
>>
>> Report low ack rssi event to mac80211 only if the reason
>> code is valid.
>>
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>>
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

[...]

>> @@ -3440,6 +3437,12 @@ void ath10k_wmi_event_peer_sta_kickout(struct ath10k *ar, struct sk_buff *skb)
>>   		goto exit;
>>   	}
>>   
>> +	if (arg.reason_code_valid &&
>> +	    arg.reason == WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED)
>> +		goto exit;
>> +
>
> Why do we want this event not to be delivered to user space?

Yeah, I'm curious about that as well. If I'm guessing right,
WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED is supposed to mean that the
firmware does not support providing the reason code. Usually, but not
always, in the firmware interface value zero means unsupported. So why
would we want to ignore a kickout event which has a valid mac address
for the peer?

In what kind of cases is the firmware emitting these events? Is this
really the correct thing to do?

>> +	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi event peer sta kickout %pM reason code %d\n",
>> +		   arg.mac_addr, arg.reason);
>>   	ieee80211_report_low_ack(sta, 10);
>>   
>>   exit:
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
>> index e1c40bb..3ccd79e 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -6797,6 +6797,8 @@ struct wmi_vdev_start_ev_arg {
>>   
>>   struct wmi_peer_kick_ev_arg {
>>   	const u8 *mac_addr;
>> +	u32 reason;
>> +	bool reason_code_valid;
>>   };
>
> Adding extra members to this structure breaks structure consistency 
> between FW and host driver since FW doesn't have such members.

Yeah, this reason_code_valid boolean is set if WMI-TLV is used, but it
does not still mean that the reason code is valid. (There might be
WMI-TLV firmwares which do not provide the reason code.)

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
