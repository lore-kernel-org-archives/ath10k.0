Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jygUX-000317-KW
 for ath10k@lists.infradead.org; Thu, 23 Jul 2020 19:02:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id r2so1079642wrs.8
 for <ath10k@lists.infradead.org>; Thu, 23 Jul 2020 12:02:53 -0700 (PDT)
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch>
 <f6d93d76-9e59-c257-9318-31c71df28018@gmail.com>
 <002e01d6611e$0d8ac640$28a052c0$@codeaurora.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fdedf787-1bb0-601c-0959-6f1bfb38e5d7@gmail.com>
Date: Thu, 23 Jul 2020 12:02:40 -0700
MIME-Version: 1.0
In-Reply-To: <002e01d6611e$0d8ac640$28a052c0$@codeaurora.org>
Content-Language: en-US
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
To: Rakesh Pillai <pillair@codeaurora.org>, 'Andrew Lunn' <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

On 7/23/20 11:21 AM, Rakesh Pillai wrote:
> 
> 
>> -----Original Message-----
>> From: Florian Fainelli <f.fainelli@gmail.com>
>> Sent: Tuesday, July 21, 2020 11:35 PM
>> To: Andrew Lunn <andrew@lunn.ch>; Rakesh Pillai <pillair@codeaurora.org>
>> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
>> kernel@vger.kernel.org; kvalo@codeaurora.org; johannes@sipsolutions.net;
>> davem@davemloft.net; kuba@kernel.org; netdev@vger.kernel.org;
>> dianders@chromium.org; evgreen@chromium.org
>> Subject: Re: [RFC 0/7] Add support to process rx packets in thread
>>
>> On 7/21/20 10:25 AM, Andrew Lunn wrote:
>>> On Tue, Jul 21, 2020 at 10:44:19PM +0530, Rakesh Pillai wrote:
>>>> NAPI gets scheduled on the CPU core which got the
>>>> interrupt. The linux scheduler cannot move it to a
>>>> different core, even if the CPU on which NAPI is running
>>>> is heavily loaded. This can lead to degraded wifi
>>>> performance when running traffic at peak data rates.
>>>>
>>>> A thread on the other hand can be moved to different
>>>> CPU cores, if the one on which its running is heavily
>>>> loaded. During high incoming data traffic, this gives
>>>> better performance, since the thread can be moved to a
>>>> less loaded or sometimes even a more powerful CPU core
>>>> to account for the required CPU performance in order
>>>> to process the incoming packets.
>>>>
>>>> This patch series adds the support to use a high priority
>>>> thread to process the incoming packets, as opposed to
>>>> everything being done in NAPI context.
>>>
>>> I don't see why this problem is limited to the ath10k driver. I expect
>>> it applies to all drivers using NAPI. So shouldn't you be solving this
>>> in the NAPI core? Allow a driver to request the NAPI core uses a
>>> thread?
>>
>> What's more, you should be able to configure interrupt affinity to steer
>> RX processing onto a desired CPU core, is not that working for you
>> somehow?
> 
> Hi Florian,
> Yes, the affinity of IRQ does work for me.
> But the affinity of IRQ does not happen runtime based on load.

It can if you also run irqbalance.
-- 
Florian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
