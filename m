Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WELIj-0005KQ-1w
 for ath10k@lists.infradead.org; Fri, 14 Feb 2014 16:07:41 +0000
Message-ID: <52FE3F35.4080308@candelatech.com>
Date: Fri, 14 Feb 2014 08:07:17 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] wmi: Handle failure to start scan.
References: <1392318594-32540-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQmDCrmkB3FErCN-XDX6M_Vzk3BuAK3AXcNK00qePje7XA@mail.gmail.com>
In-Reply-To: <CA+BoTQmDCrmkB3FErCN-XDX6M_Vzk3BuAK3AXcNK00qePje7XA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/13/2014 10:47 PM, Michal Kazior wrote:
> On 13 February 2014 20:09,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Properly clean up driver state in case firmware fails
>> to start scan for some reason.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/wmi.c | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 20f7c79..a5be0d3 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -770,7 +770,25 @@ static int ath10k_wmi_event_scan(struct ath10k *ar, struct sk_buff *skb)
>>                  ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_PREEMPTED\n");
>>                  break;
>>          case WMI_SCAN_EVENT_START_FAILED:
>> -               ath10k_dbg(ATH10K_DBG_WMI, "WMI_SCAN_EVENT_START_FAILED\n");
>> +               ath10k_warn("WMI_SCAN_EVENT_START_FAILED, reason: %i\n", reason);
>> +
>> +               ar->scan_channel = NULL;
>> +               if (!ar->scan.in_progress) {
>> +                       ath10k_warn("scan-start-failed: no scan requested, ignoring\n");
>> +                       break;
>> +               }
>> +
>> +               if (ar->scan.is_roc) {
>> +                       ath10k_offchan_tx_purge(ar);
>> +
>> +                       if (!ar->scan.aborting)
>> +                               ieee80211_remain_on_channel_expired(ar->hw);
>> +               } else {
>> +                       ieee80211_scan_completed(ar->hw, ar->scan.aborting);
>> +               }
>> +
>> +               del_timer(&ar->scan.timeout);
>> +               ar->scan.in_progress = false;
>>                  break;
>>          default:
>>                  break;
>
> We already wait for EVENT_STARTED in mac.c (see ath10k_start_scan) and
> clean up stuff (ath10k_abort_scan). Why not add the missing bits in
> there? Or is it possible to get EVENT_START_FAILED *after*
> EVENT_STARTED? Or am I missing something else here?

I think a lot of this would be firmware dependent, and might change between
various versions of the firmware.

It seems to me we should handle this case and do cleanup just to be safe,
but maybe cleanup is needed in failure case of ath10k_start_scan as well?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
