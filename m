Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jajMk-0003WV-Lh
 for ath10k@lists.infradead.org; Mon, 18 May 2020 17:15:52 +0000
Subject: Re: [PATCH v2 12/15] ath10k: use new module_firmware_crashed()
References: <20200515212846.1347-1-mcgrof@kernel.org>
 <20200515212846.1347-13-mcgrof@kernel.org>
 <2b74a35c726e451b2fab2b5d0d301e80d1f4cdc7.camel@sipsolutions.net>
 <20200518165154.GH11244@42.do-not-panic.com>
 <4ad0668d-2de9-11d7-c3a1-ad2aedd0c02d@candelatech.com>
 <20200518170934.GJ11244@42.do-not-panic.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <abf22ef3-93cb-61a4-0af2-43feac6d7930@candelatech.com>
Date: Mon, 18 May 2020 10:15:45 -0700
MIME-Version: 1.0
In-Reply-To: <20200518170934.GJ11244@42.do-not-panic.com>
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
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, peterz@infradead.org, daniel.vetter@ffwll.ch, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, ath10k@lists.infradead.org, tiwai@suse.de, mingo@redhat.com, dyoung@redhat.com, pmladek@suse.com, keescook@chromium.org, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, akpm@linux-foundation.org, kvalo@codeaurora.org, netdev@vger.kernel.org, schlad@suse.de, linux-kernel@vger.kernel.org, jeyu@kernel.org, Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net



On 05/18/2020 10:09 AM, Luis Chamberlain wrote:
> On Mon, May 18, 2020 at 09:58:53AM -0700, Ben Greear wrote:
>>
>>
>> On 05/18/2020 09:51 AM, Luis Chamberlain wrote:
>>> On Sat, May 16, 2020 at 03:24:01PM +0200, Johannes Berg wrote:
>>>> On Fri, 2020-05-15 at 21:28 +0000, Luis Chamberlain wrote:> module_firmware_crashed
>>>>
>>>> You didn't CC me or the wireless list on the rest of the patches, so I'm
>>>> replying to a random one, but ...
>>>>
>>>> What is the point here?
>>>>
>>>> This should in no way affect the integrity of the system/kernel, for
>>>> most devices anyway.
>>>
>>> Keyword you used here is "most device". And in the worst case, *who*
>>> knows what other odd things may happen afterwards.
>>>
>>>> So what if ath10k's firmware crashes? If there's a driver bug it will
>>>> not handle it right (and probably crash, WARN_ON, or something else),
>>>> but if the driver is working right then that will not affect the kernel
>>>> at all.
>>>
>>> Sometimes the device can go into a state which requires driver removal
>>> and addition to get things back up.
>>
>> It would be lovely to be able to detect this case in the driver/system
>> somehow!  I haven't seen any such cases recently,
>
> I assure you that I have run into it. Once it does again I'll report
> the crash, but the problem with some of this is that unless you scrape
> the log you won't know. Eventually, a uevent would indeed tell inform
> me.
>
>> but in case there is
>> some common case you see, maybe we can think of a way to detect it?
>
> ath10k is just one case, this patch series addresses a simple way to
> annotate this tree-wide.
>
>>>> So maybe I can understand that maybe you want an easy way to discover -
>>>> per device - that the firmware crashed, but that still doesn't warrant a
>>>> complete kernel taint.
>>>
>>> That is one reason, another is that a taint helps support cases *fast*
>>> easily detect if the issue was a firmware crash, instead of scraping
>>> logs for driver specific ways to say the firmware has crashed.
>>
>> You can listen for udev events (I think that is the right term),
>> and find crashes that way.  You get the actual crash info as well.
>
> My follow up to this was to add uevent to add_taint() as well, this way
> these could generically be processed by userspace.

I'm not opposed to the taint, though I have not thought much on it.

But, if you can already get the crash info from uevent, and it automatically
comes without polling or scraping logs, then what benefit beyond that does
the taint give you?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
