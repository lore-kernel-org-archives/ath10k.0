Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaoXZ-0007nN-Do
 for ath10k@lists.infradead.org; Tue, 01 Mar 2016 17:56:57 +0000
Message-ID: <56D5D763.5070709@codeaurora.org>
Date: Tue, 01 Mar 2016 09:54:43 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5] ath10k: set MAC timestamp in management Rx frame
References: <5bc6ba3b4d5743dc641b85c2c4233631f5b3319a.1456513260.git.poh@qca.qualcomm.com>
 <CA+BoTQkCwSkARQKWcjkJri9xS6GGiHq4NwjOoewqtHOetjevGw@mail.gmail.com>
In-Reply-To: <CA+BoTQkCwSkARQKWcjkJri9xS6GGiHq4NwjOoewqtHOetjevGw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org


On 02/29/2016 10:33 AM, Michal Kazior wrote:
> On 26 February 2016 at 20:03, Peter Oh <poh@qca.qualcomm.com> wrote:
>> Check and set Rx MAC timestamp when firmware indicates it.
>> Firmware adds it in Rx beacon frame only at this moment.
>> Driver and mac80211 may utilize it to detect such clockdrift
>> or beacon collision and use the result for beacon collision
>> avoidance.
>>
>> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
>> ---
> [...]
>> +       if (rx_status & WMI_RX_STATUS_EXT_INFO) {
>> +               status->mactime =
>> +                       __le32_to_cpu(arg.ext_info.rx_mac_timestamp_l32) |
>> +
>> (u64)__le32_to_cpu(arg.ext_info.rx_mac_timestamp_u32)
>> +                       << 32;
>> +               status->flag |= RX_FLAG_MACTIME_END;
>> +       }
>>          /* Hardware can Rx CCK rates on 5GHz. In that case phy_mode is set
>> to
>>           * MODE_11B. This means phy_mode is not a reliable source for the
>> band
>>           * of mgmt rx.
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h
>> b/drivers/net/wireless/ath/ath10k/wmi.h
>> index 4d3cbc4..f209d51 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -3037,11 +3037,18 @@ struct wmi_10_4_mgmt_rx_event {
>>          u8 buf[0];
>>   } __packed;
>>
>> +struct wmi_mgmt_rx_ext_info {
>> +       __le32 rx_mac_timestamp_l32;
>> +       __le32 rx_mac_timestamp_u32;
> Oh.. I feel bad for noticing this so late.
review is always appreciated.
>   I think this can be
> represented with a mere __le64 and then accessed via le64_to_cpu().
sent new patch based on your comment.

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
