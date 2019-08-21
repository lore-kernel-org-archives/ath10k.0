Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Xwv-0008Fv-Qb
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 21:15:23 +0000
Message-ID: <5D5DB467.4000007@candelatech.com>
Date: Wed, 21 Aug 2019 14:15:19 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Regression with commit "ath10k: fill the channel survey results
 for WCN3990 correctly"
References: <5D5DAFE4.6080706@candelatech.com>
 <5D5DB246.7040402@candelatech.com>
 <c77c271a3d77d990b8de67cdbd8ea8c7@codeaurora.org>
In-Reply-To: <c77c271a3d77d990b8de67cdbd8ea8c7@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

Looks like it should work.

Why is this rotting in patchwork?

Thanks
Ben

On 08/21/2019 02:12 PM, Rakesh Pillai wrote:
> Hi Ben,
> Can you please check https://patchwork.kernel.org/patch/10844513/ ?
> This change fixes the below mentioned regression. A different structure is made for tlv specific event handling.
>
> Thanks,
> Rakesh Pillai.
>
>
> On 2019-08-21 14:06, Ben Greear wrote:
>> On 08/21/2019 01:56 PM, Ben Greear wrote:
>>> Hello,
>>>
>>> I just noticed in 5.2.7+ kernel than this commit below appears to break WMI
>>> message for my 10.1 firmware, and based on code inspection, 10.2 will be broken
>>> as well.
>>>
>>> 10.1 struct ends with cycle_count, and 10.2 ends with one 32-bit number
>>> after that, but which is not chan_tx_pwr_range.
>>>
>>> I guess you need to create your own wmi msg for the WCN3990.
>>>
>>> The change to 10.4 chan_info event is also wrong for my relatively
>>> new version of 10.4 code, so likely breaks firmware in use.  last member
>>> in that struct in my 10.4 fw src is 'A_UINT32 rx_11b_mode_data_duration;'
>>
>> Sorry, I mis-read this 10.4 part of the patch, it was not changing the wmi event
>> itself, so probably that part is fine.
>>
>> Thanks,
>> Ben
>>
>>>
>>>
>>> commit 13104929d2ec32aec0552007d55b9e15bc07176b
>>> Author: Rakesh Pillai <pillair@codeaurora.org>
>>> Date:   Wed Oct 17 16:50:03 2018 +0530
>>>
>>>      ath10k: fill the channel survey results for WCN3990 correctly
>>>
>>>
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
>>> index 4971d61..58e33ab 100644
>>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>>> @@ -6442,6 +6442,14 @@ struct wmi_chan_info_event {
>>>          __le32 noise_floor;
>>>          __le32 rx_clear_count;
>>>          __le32 cycle_count;
>>> +       __le32 chan_tx_pwr_range;
>>> +       __le32 chan_tx_pwr_tp;
>>> +       __le32 rx_frame_count;
>>> +       __le32 my_bss_rx_cycle_count;
>>> +       __le32 rx_11b_mode_data_duration;
>>> +       __le32 tx_frame_cnt;
>>> +       __le32 mac_clk_mhz;
>>> +
>>>   } __packed;
>>>
>>>
>>>
>>> Thanks,
>>> Ben
>>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
