Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJv7m-0006cW-Nm
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 07:18:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
Date: Fri, 26 Apr 2019 10:18:16 +0300
In-Reply-To: <20190403195718.GA74723@google.com> (Brian Norris's message of
 "Wed, 3 Apr 2019 12:57:20 -0700")
Message-ID: <87o94tutdz.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>

Brian Norris <briannorris@chromium.org> writes:

> + Sriram, Pradeep, Claire
>
> On Sun, Mar 03, 2019 at 06:24:33PM +0100, Rafael J. Wysocki wrote:
>
> Ooh, exactly 1 month ago!
>
>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> 
>> ath10k_mac_vif_chan() always returns an error for the given vif
>> during system-wide resume which reliably triggers two WARN_ON()s
>> in ath10k_bss_info_changed() and they are not particularly
>> useful in that code path, so drop them.
>> 
>
> Particularly, when WOWLAN isn't enabled, we get called during resume via
> ieee80211_reconfig(), where we're not associated and don't have any
> channel contexts. AFAICT, we shouldn't need to communicate anything in
> particular to the firmware here, and so failing the 'if' is definitely
> not worth WARN-ing about.
>
> I'd love to see this get applied with:
>
> Fixes: cd93b83ad927 ("ath10k: support for multicast rate control")
> Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")
>
> and sent to stable. This has been bugging people since 4.19. Spurious
> WARN_ON()s can trigger reports to various crash trackers, and on some
> systems appear as user-visible warnings ("System problem detected").
>
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Brian Norris <briannorris@chromium.org>

I added these now to the commit log, thanks Brian.

Rafael, could you please provide the hardware and firmware versions you
tested this on? We have so many different firmware branches to support
that I prefer to have that documented in the commit log. Providing
ath10k startup messages in dmesg are enough, I can then add it to the
commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
