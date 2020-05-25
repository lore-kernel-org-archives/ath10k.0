Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdGbG-0008DD-24
 for ath10k@lists.infradead.org; Mon, 25 May 2020 17:09:19 +0000
Subject: Re: [RFC 1/2] devlink: add simple fw crash helpers
References: <20200519010530.GS11244@42.do-not-panic.com>
 <20200519211531.3702593-1-kuba@kernel.org>
 <20200522052046.GY11244@42.do-not-panic.com>
 <20200522101738.1495f4cc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2e5199edb433c217c7974ef7408ff8c7253145b6.camel@sipsolutions.net>
 <20200522215145.GC11244@42.do-not-panic.com>
 <CALLGbR+QPcECtJbYmzztV_Qysc5qtwujT_qc785zvhZMCH50fg@mail.gmail.com>
 <20200525090749.GJ1634618@smile.fi.intel.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <e453d720-bfe7-5f4f-e422-a7cfb9bce833@candelatech.com>
Date: Mon, 25 May 2020 10:08:58 -0700
MIME-Version: 1.0
In-Reply-To: <20200525090749.GJ1634618@smile.fi.intel.com>
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steve deRosier <derosier@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, aquini@redhat.com, peterz@infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, mchehab+samsung@kernel.org, will@kernel.org, bhe@redhat.com, briannorris@chromium.org, ath10k@lists.infradead.org, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com, Jakub Kicinski <kuba@kernel.org>, dyoung@redhat.com, pmladek@suse.com, jiri@resnulli.us, Kees Cook <keescook@chromium.org>, arnd@arndb.de, gpiccoli@canonical.com, rostedt@goodmis.org, cai@lca.pw, tglx@linutronix.de, akpm@linux-foundation.org, Kalle Valo <kvalo@codeaurora.org>, Network Development <netdev@vger.kernel.org>, schlad@suse.de, LKML <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, jeyu@kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>



On 05/25/2020 02:07 AM, Andy Shevchenko wrote:
> On Fri, May 22, 2020 at 04:23:55PM -0700, Steve deRosier wrote:
>> On Fri, May 22, 2020 at 2:51 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
>> I had to go RTFM re: kernel taints because it has been a very long
>> time since I looked at them. It had always seemed to me that most were
>> caused by "kernel-unfriendly" user actions.  The most famous of course
>> is loading proprietary modules, out-of-tree modules, forced module
>> loads, etc...  Honestly, I had forgotten the large variety of uses of
>> the taint flags. For anyone who hasn't looked at taints recently, I
>> recommend: https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html
>>
>> In light of this I don't object to setting a taint on this anymore.
>> I'm a little uneasy, but I've softened on it now, and now I feel it
>> depends on implementation.
>>
>> Specifically, I don't think we should set a taint flag when a driver
>> easily handles a routine firmware crash and is confident that things
>> have come up just fine again. In other words, triggering the taint in
>> every driver module where it spits out a log comment that it had a
>> firmware crash and had to recover seems too much. Sure, firmware
>> shouldn't crash, sure it should be open source so we can fix it,
>> whatever...
>
> While it may sound idealistic the firmware for the end-user, and even for mere
> kernel developer like me, is a complete blackbox which has more access than
> root user in the kernel. We have tons of firmwares and each of them potentially
> dangerous beast. As a user I really care about my data and privacy (hacker can
> oops a firmware in order to set a specific vector attack). So, tainting kernel
> is _a least_ we can do there, the strict rules would be to reboot immediately.
>
>> those sort of wishful comments simply ignore reality and
>> our ability to affect effective change.
>
> We can encourage users not to buy cheap crap for the starter.

There is no stable wifi firmware for any price.

There is also no obvious feedback from even name-brand NICs like ath10k or AX200
when you report a crash.

That said, at least in my experience with ath10k-ct, the OS normally recovers fine
from firmware crashes.  ath10k already reports full crash reports on udev, so
easy for user-space to notice and report bug reports upstream if it cares to.  Probably
other NICs do the same, and if not, they certainly could.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
