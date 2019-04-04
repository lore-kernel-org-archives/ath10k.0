Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBteR-0003DU-Ml
 for ath10k@lists.infradead.org; Thu, 04 Apr 2019 04:06:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Drop WARN_ON()s that always trigger during system
 resume
References: <2884043.Jv1Mn93hE8@aspire.rjw.lan>
 <20190403195718.GA74723@google.com>
 <1645947.WPhbVaNX0l@aspire.rjw.lan>
 <CA+ASDXPoB94o0pbY0TQGS7Dtp2RNz=3goH38gpLtBoJ15i7eoQ@mail.gmail.com>
Date: Thu, 04 Apr 2019 07:06:46 +0300
In-Reply-To: <CA+ASDXPoB94o0pbY0TQGS7Dtp2RNz=3goH38gpLtBoJ15i7eoQ@mail.gmail.com>
 (Brian Norris's message of "Wed, 3 Apr 2019 14:54:19 -0700")
Message-ID: <87k1gatnvt.fsf@kamboji.qca.qualcomm.com>
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
Cc: Claire Chang <tientzu@google.com>, Sriram R <srirrama@codeaurora.org>, Linux PM <linux-pm@vger.kernel.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Todd Brandt <todd.e.brandt@intel.com>

Brian Norris <briannorris@chromium.org> writes:

> On Wed, Apr 3, 2019 at 2:47 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>> I have been wondering whether or not I need to resend this patch or something ...
>
> I think the linux-wireless Patchwork instance is the source of truth
> -- Kalle and Johannes use it for tracking status, IIUC. So this says
> your patch is still "New":
>
> https://patchwork.kernel.org/patch/10837139/

Yeah, that's right:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#checking_state_of_patches_from_patchwork

So no need to resend, it's in my queue.

I was travelling and then busy with something else so I haven't had a
chance to process patches, I'll try to catch up now but I'm sure it will
take a while as there are so many patches. Sorry for the delay.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
