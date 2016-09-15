Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkXFw-0002uQ-TU
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 14:03:20 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 08/21] ath10k: make firmware text debug messages more
 verbose.
Date: Thu, 15 Sep 2016 14:02:47 +0000
Message-ID: <87oa3pb6rd.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-9-git-send-email-greearb@candelatech.com>
 <87sht2efiu.fsf@kamboji.qca.qualcomm.com>	<57D9677E.5030704@candelatech.com>
In-Reply-To: <57D9677E.5030704@candelatech.com> (Ben Greear's message of "Wed, 
 14 Sep 2016 08:06:38 -0700")
Content-Language: en-US
Content-ID: <7870A67FD34F8440A98121D71E141011@qualcomm.com>
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

> On 09/14/2016 07:12 AM, Valo, Kalle wrote:
>> greearb@candelatech.com writes:
>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> There are not many of these messages producted by the
>>> firmware, but they are generally fairly useful, so print
>>> them at info level.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>>> index 1758b4a..d9e4b77 100644
>>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>>> @@ -4050,7 +4050,7 @@ void ath10k_wmi_event_debug_print(struct ath10k *ar, struct sk_buff *skb)
>>>   	/* the last byte is always reserved for the null character */
>>>   	buf[i] = '\0';
>>>
>>> -	ath10k_dbg(ar, ATH10K_DBG_WMI_PRINT, "wmi print '%s'\n", buf);
>>> +	ath10k_info(ar, "wmi print '%s'\n", buf);
>>
>> Useful to whom and how? I understand that for firmware developers this
>> is very valuable information and that's why we have a special debug
>> level for it. But I suspect that for normal users these are just
>> confusing and unnecessarily spam the log.
>
> CT firmare will print out some memory usage info on firmware boot, and that can
> allow a discerning individual to tune their vdev, peer, rate-ctrl, and other
> object usage in order to make best use of resources in the firmware.
>
> These few lines can greatly aid debugging certain types of crashes and performance
> loss in the firmware, so having them readily available in 'dmesg' or similar
> for bug reports from the field helps me.
>
> Stock firmware will also print out some resource usage info.  It is just
> a few lines on firmware boot, but it is quite useful in my experience.

I'm sure it's useful for you, but we have quite a few firmware versions
to support. We do not know what kind of messages they print.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
