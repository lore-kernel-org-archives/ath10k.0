Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8ayD-00072h-M6
 for ath10k@lists.infradead.org; Tue, 06 Jan 2015 20:43:18 +0000
Message-ID: <54AC48D0.9010501@candelatech.com>
Date: Tue, 06 Jan 2015 12:42:56 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debug messages stopped sometime after 3.18 (bisected)
References: <54A5F18C.2050007@candelatech.com>
 <54AB39BD.2050804@candelatech.com> <54AC40C2.9020703@candelatech.com>
In-Reply-To: <54AC40C2.9020703@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>, rmanohar@qti.qualcomm.com

On 01/06/2015 12:08 PM, Ben Greear wrote:
> I think I found another problem with this patch.
> 
> When user enables ATH10K_PKTLOG_DBG_PRINT pktlog filter, then the firmware can send
> pkts to the CE1 pipe, which has only 512 byte message length.  firmware debuglog messages
> can be larger than that, and so (10.1.467, at least) firmware will crash.
> 
> If anyone with QCA firmware source rights wants the nasty details,
> contact me offline.
> 
> I will try to hack around this in my firmware, but I think this patch
> needs some more thought and/or fixes.

So, root cause of not getting dbglog over wmi after this patch
is bug in 10.1.467 (and maybe other) firmware in it's dbglog code.

I have fixed that in CT firmware, and disabled pktlog ability to
send dbglog messages to work around that crash scenario, and now
things are working better again.

Upstream firmware is still going to have issues with this patch, however.

Thanks,
Ben

> 
> Thanks,
> Ben
> 
> On 01/05/2015 05:26 PM, Ben Greear wrote:
>> On 01/01/2015 05:17 PM, Ben Greear wrote:
>>> While trying to reproduce some bugs on ath10k in 3.19.0-rc2, I could not
>>> get any debuglog messages from the firmware.  For instance, in stock kernel
>>> it should print out something like this:
>>>
>>>  wmi event debug mesg len 28
>>>
>>> I got other wmi debug messages, so the debug level appeared correct.
>>>
>>> The message shows up as expected in stock 3.18 kernel.
>>>
>>> Was this done on purpose?
>>>
>>> I've started a bisect...should track it down directly.
>>
>> Took a while, but bisect points to this.  If you are doing bisect
>> yourself, or playing with changes near here, you must manually apply
>> the patch below to allow scan to work.  I'll try to figure out why
>> the patch below disables firmware debuglog messages next.  I assume
>> that was not the intention?
>>
>> 90174455ae058a1dcf1f3d344a9752385803c1d8 is the first bad commit
>> commit 90174455ae058a1dcf1f3d344a9752385803c1d8
>> Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>> Date:   Fri Oct 3 08:02:33 2014 +0300
>>
>>     ath10k: add support to configure pktlog filter
>>
>>     Add support to configure packet log filters (tx, rx, rate control)
>>     via debugfs. To disable htt pktlog events set the filters to 0.
>>
>>     ex:
>>
>>     To enable pktlog for all filters
>>
>>        echo 0x1f > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
>>
>>     To disable pktlog
>>
>>        echo 0 > /sys/kernel/debug/ieee80211/phy*/ath10k/pktlog_filter
>>
>>     Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>>     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>
>> :040000 040000 1ff3b609db06d718fb22a7d8444a70e38a60ebcd 6504c0828edb532f19826167eab9ba0634b3f044 M	drivers
>>
>>
>> Patch to allow scan to work (this patch made it upstream a bit later):
>>
>> [greearb@ben-dt2 linux-bisect]$ git diff
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>> index f65032f..d878fbe 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -3506,10 +3506,10 @@ int ath10k_wmi_start_scan(struct ath10k *ar,
>>                 return ret;
>>
>>         if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>> -               len = sizeof(struct wmi_start_scan_cmd) +
>> +               len = sizeof(struct wmi_10x_start_scan_cmd) +
>>                       ath10k_wmi_start_scan_tlvs_len(arg);
>>         else
>> -               len = sizeof(struct wmi_10x_start_scan_cmd) +
>> +               len = sizeof(struct wmi_start_scan_cmd) +
>>                       ath10k_wmi_start_scan_tlvs_len(arg);
>>
>>         skb = ath10k_wmi_alloc_skb(ar, len);
>> [greearb@ben-dt2 linux-bisect]$
>>
>>
>> Thanks,
>> Ben
>>
>>>
>>> Thanks,
>>> Ben
>>>
>>
>>
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
