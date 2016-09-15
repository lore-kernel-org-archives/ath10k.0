Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkXPe-0007MI-9i
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 14:13:19 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 10/21] ath10k: support logging ath10k_info as KERN_DEBUG
Date: Thu, 15 Sep 2016 14:12:48 +0000
Message-ID: <87fup1b6ao.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-11-git-send-email-greearb@candelatech.com>
 <87k2eeef79.fsf@kamboji.qca.qualcomm.com>	<57D9696B.10103@candelatech.com>
In-Reply-To: <57D9696B.10103@candelatech.com> (Ben Greear's message of "Wed,
 14 Sep 2016 08:14:51 -0700")
Content-Language: en-US
Content-ID: <686E2C3AFD0FC044BBE193766892E29A@qualcomm.com>
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

> On 09/14/2016 07:19 AM, Valo, Kalle wrote:
>> greearb@candelatech.com writes:
>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> Helps keep messages off of (serial) console when
>>> that is desired.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>
>> Isn't /proc/sys/kernel/print exactly for this purpose? At least I recall
>> using it.
>
> I just wanted to hide some ath10k logs from the console, not all
> system logs. I don't think that /proc/sys/kernel/print has any
> granularity?

It should be based on KERN_ log levels. I don't know what your kernel
does, but ath10k should be printing only very few messages with level
KERN_INFO or above, all of of the debug messages. So you should be
easily able to filter out all ath10k debug messages as they are sent
with KERN_DEBUG.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
