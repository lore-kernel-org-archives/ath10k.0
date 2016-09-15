Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkZDV-0003US-P6
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 16:08:50 +0000
Subject: Re: [PATCH v2 10/21] ath10k: support logging ath10k_info as KERN_DEBUG
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-11-git-send-email-greearb@candelatech.com>
 <87k2eeef79.fsf@kamboji.qca.qualcomm.com> <57D9696B.10103@candelatech.com>
 <87fup1b6ao.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <da354a6f-83f5-9529-7405-e992ec8b62e4@candelatech.com>
Date: Thu, 15 Sep 2016 08:11:33 -0700
MIME-Version: 1.0
In-Reply-To: <87fup1b6ao.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/15/2016 07:12 AM, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 09/14/2016 07:19 AM, Valo, Kalle wrote:
>>> greearb@candelatech.com writes:
>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>> Helps keep messages off of (serial) console when
>>>> that is desired.
>>>>
>>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>>
>>> Isn't /proc/sys/kernel/print exactly for this purpose? At least I recall
>>> using it.
>>
>> I just wanted to hide some ath10k logs from the console, not all
>> system logs. I don't think that /proc/sys/kernel/print has any
>> granularity?
>
> It should be based on KERN_ log levels. I don't know what your kernel
> does, but ath10k should be printing only very few messages with level
> KERN_INFO or above, all of of the debug messages. So you should be
> easily able to filter out all ath10k debug messages as they are sent
> with KERN_DEBUG.

I originally added this when I was testing .11r associating timing.  Just
having a few lines of ath10k printk on the serial console added several 10s
of milliseconds to the time it took to associate, and that was throwing off my
results.  I still wanted to see the messges in 'dmesg', just not on the console.

I did not want to hide other WARN level logs from the console, just the ath10k
ones.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
