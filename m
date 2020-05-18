Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaj6P-00056F-7h
 for ath10k@lists.infradead.org; Mon, 18 May 2020 16:58:58 +0000
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <20200518165154.GH11244@42.do-not-panic.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <4ad0668d-2de9-11d7-c3a1-ad2aedd0c02d@candelatech.com>
Date: Mon, 18 May 2020 09:58:53 -0700
MIME-Version: 1.0
In-Reply-To: <20200518165154.GH11244@42.do-not-panic.com>
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
To: Luis Chamberlain <mcgrof@kernel.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, ath10k@lists.infradead.org, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, akpm@linux-foundation.org, davem@davemloft.net



On 05/18/2020 09:51 AM, Luis Chamberlain wrote:
> On Sat, May 16, 2020 at 03:24:01PM +0200, Johannes Berg wrote:
>> On Fri, 2020-05-15 at 21:28 +0000, Luis Chamberlain wrote:> module_firmware_crashed
>>
>> You didn't CC me or the wireless list on the rest of the patches, so I'm
>> replying to a random one, but ...
>>
>> What is the point here?
>>
>> This should in no way affect the integrity of the system/kernel, for
>> most devices anyway.
>
> Keyword you used here is "most device". And in the worst case, *who*
> knows what other odd things may happen afterwards.
>
>> So what if ath10k's firmware crashes? If there's a driver bug it will
>> not handle it right (and probably crash, WARN_ON, or something else),
>> but if the driver is working right then that will not affect the kernel
>> at all.
>
> Sometimes the device can go into a state which requires driver removal
> and addition to get things back up.

It would be lovely to be able to detect this case in the driver/system
somehow!  I haven't seen any such cases recently, but in case there is
some common case you see, maybe we can think of a way to detect it?

>
>> So maybe I can understand that maybe you want an easy way to discover -
>> per device - that the firmware crashed, but that still doesn't warrant a
>> complete kernel taint.
>
> That is one reason, another is that a taint helps support cases *fast*
> easily detect if the issue was a firmware crash, instead of scraping
> logs for driver specific ways to say the firmware has crashed.

You can listen for udev events (I think that is the right term),
and find crashes that way.  You get the actual crash info as well.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
