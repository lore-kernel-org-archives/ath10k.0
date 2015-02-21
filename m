Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPEcR-0005u0-Pi
 for ath10k@lists.infradead.org; Sat, 21 Feb 2015 18:17:36 +0000
Message-ID: <54E8CBA9.9040202@candelatech.com>
Date: Sat, 21 Feb 2015 10:17:13 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: CT firmware 10.1.467-13 is released.
References: <54E8C102.4090201@candelatech.com>
 <CAA93jw6kO7yqLFj3+EyC8HjjrkBqr3Mi_wjC+8K5vHaXBo-r9Q@mail.gmail.com>
In-Reply-To: <CAA93jw6kO7yqLFj3+EyC8HjjrkBqr3Mi_wjC+8K5vHaXBo-r9Q@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 02/21/2015 09:50 AM, Dave Taht wrote:
> On Sat, Feb 21, 2015 at 9:31 AM, Ben Greear <greearb@candelatech.com> wrote:
>> Here are the highlights:
>>
>> Add IBSS/AHDOC support.
>
> Awesome. Does this require the candela kernel patchset?

I think upstream has support, but if you want any decent throughput (HT, VHT)
you have to be running bleeding edge kernels and hostapd
(not sure all patches are even upstream yet..see appropriate mailing
lists).

I have backported a few patches into my kernel, but I'm not sure
how correct or complete they are.

I plan to try a little harder to get HT/VHT working in my 3.19 kernel
sometime soon.  My 3.19 kernel patchset is also much cleaner than my
3.17 tree, so if you want to try to cherry-pick patches, that is the
one to use.  (It also has a lot less testing, so maybe there are issues
yet.)

> (am thinking of trying this version of the firmware on openwrt chaos
> calmer on the tp-link archer C7 v2)

That would be welcome.  If you see any firmware splats, please send logs
my way and I should be able to decode them.

Thanks,
Ben

>
>> Work-around tx-credits hang due to WMI/CE lockup in firmware (requires
>> ath10k driver patches)
>> Attempt to fix a few asserts reported by users (scan code, rate-ctrl,
>> resource-mgr, etc)
>>
>> Known bugs:
>> CE transport failure assert (Only seen on IMX6 hardware at this time)
>> WMI keepalive failure, probably due to inability to send mgt frames in bad
>> RF environment.
>>
>>
>> Downloads and more info is here:
>>
>> http://www.candelatech.com/ath10k.php
>>
>> As always, I am interested to hear of users having success or otherwise with
>> this firmware.
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
