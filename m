Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgj7I-00042m-90
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 05:08:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: pci: remove unnecessary casts
References: <1561661250-30528-1-git-send-email-kvalo@codeaurora.org>
 <1561661250-30528-2-git-send-email-kvalo@codeaurora.org>
 <58e8952b87c8aa533c15fe5650f3f71288377f36.camel@sipsolutions.net>
 <a6c87741bc3e992bf61d2706834e069917018745.camel@sipsolutions.net>
Date: Fri, 28 Jun 2019 08:08:04 +0300
In-Reply-To: <a6c87741bc3e992bf61d2706834e069917018745.camel@sipsolutions.net>
 (Johannes Berg's message of "Thu, 27 Jun 2019 21:15:48 +0200")
Message-ID: <87r27eqouj.fsf@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2019-06-27 at 21:12 +0200, Johannes Berg wrote:
>> On Thu, 2019-06-27 at 21:47 +0300, Kalle Valo wrote:
>> > Fixes checkpatch warnings:
>> > 
>> > drivers/net/wireless/ath/ath10k/pci.c:926: unnecessary cast may
>> > hide bugs, see http://c-faq.com/malloc/ma
>> > drivers/net/wireless/ath/ath10k/pci.c:1072: unnecessary cast may
>> > hide bugs, see http://c-faq.com/malloc/m
>> 
>> I think you cut off the link there, did you mean
>> http://c-faq.com/malloc/mallocnocast.html perhaps?

Yes, thanks. Fixed now in the pending branch.

> Which I should've read before replying ... WHAT? We consider calling
> undeclared functions an *error* in the kernel, this is quite pointless.

Yeah, the link checkpatch provides is pointless. TBH I didn't even read
it until you commented on it :) But the patch is still good to have as
there's no point of use casting on void pointers, it's just extra cruft.
Right?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
