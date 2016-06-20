Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF8UK-0002yP-Cj
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 23:20:16 +0000
Subject: Re: Stand-alone ath10k-ct driver.
References: <57686587.9050607@candelatech.com>
 <1c702fd0-677c-82e3-ddbe-ab4335a4a1a6@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57687A05.3080400@candelatech.com>
Date: Mon, 20 Jun 2016 16:19:33 -0700
MIME-Version: 1.0
In-Reply-To: <1c702fd0-677c-82e3-ddbe-ab4335a4a1a6@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org

On 06/20/2016 04:11 PM, Sebastian Gottschall wrote:
> Am 20.06.2016 um 23:52 schrieb Ben Greear:
>> Hello!
>>
>> I have made an attempt to provide a stand-alone ath10k driver that should compile
>> and work against stock 4.7 kernels.  This should provide better support for CT ath10k
>> firmware without having to apply large numbers of patches.  My 4.7 kernel has only been very lightly tested
>> to date, and the stand-alone driver is only compile tested.  I will update the
>> ath-ct repo often as testing progresses on 4.7.
>>
>> If there are brave souls that want to try it out, I'd appreciate any feedback.
>>
>> https://github.com/greearb/ath-ct
>>
>> See the README.txt for some details.  This will require at least some familiarity
>> with building kernels since I do not have any nice automation to compile against
>> the current running kernel yet, for instance.
>>
> why dont you use compat-wireless / backports as base?
> so you can use your driver in any kernel version

Just no time to deal with backports, and if I have just a stand-alone driver,
then it is easier for folks to use it in whatever kernel they already happen
to be using.  Hopefully some project that is already using a 4.7-ish backport
can compile my driver against that and have it just work, for instance.

Since I'm finding so many regressions when I rebase, and rebasing makes it almost
impossible to bisect between kernels, then maybe it would just be better if
I maintained a parallel drivers/net/wireless/ath/ath10k-ct/, and just applied
patches from ../ath10k/ manually on top of my own stuff.  At least that way
I could bisect regressions....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
