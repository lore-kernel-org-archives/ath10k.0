Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC1D8-0007Sz-DH
 for ath10k@lists.infradead.org; Thu, 04 Apr 2019 12:11:15 +0000
MIME-Version: 1.0
Date: Thu, 04 Apr 2019 17:41:12 +0530
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: FW: [PATCH v2] ath10k: Report low ack rssi based on the reason
 code
In-Reply-To: <8c3110f20aec4c4a90bb679c4551b1fc@aphydexm01b.ap.qualcomm.com>
References: <1554276181-7879-1-git-send-email-pillair@codeaurora.org>
 <5f25f471-5753-7d4a-91f8-9a3986117580@bowerswilkins.com>
 <8c3110f20aec4c4a90bb679c4551b1fc@aphydexm01b.ap.qualcomm.com>
Message-ID: <73e869e8f82a3395cfefaf1272d07906@codeaurora.org>
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
To: peter.oh@bowerswilkins.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h 
>> b/drivers/net/wireless/ath/ath10k/wmi.h
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
>> 
> Adding extra members to this structure breaks structure consistency
> between FW and host driver since FW doesn't have such members.
> 
> Peter
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

struct wmi_peer_sta_kickout_event is used for parsing event from non-tlv 
firmwares and
struct wmi_tlv_peer_sta_kickout_event  is used for parsing event from 
tlv firmwares.
Both of the above structures maintain consistency with the respective 
FW.

struct wmi_peer_kick_ev_arg is used only for internal ath10k operations 
only.

Thanks,
Rakesh Pillai.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
