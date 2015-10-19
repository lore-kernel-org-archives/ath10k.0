Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoBsj-0003DX-7K
 for ath10k@lists.infradead.org; Mon, 19 Oct 2015 14:57:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: only advertise mesh support in raw mode
References: <1443445192-30464-1-git-send-email-me@bobcopeland.com>
Date: Mon, 19 Oct 2015 17:57:12 +0300
In-Reply-To: <1443445192-30464-1-git-send-email-me@bobcopeland.com> (Bob
 Copeland's message of "Mon, 28 Sep 2015 08:59:52 -0400")
Message-ID: <87r3kqgb3r.fsf@kamboji.qca.qualcomm.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bob Copeland <me@bobcopeland.com> writes:

> Rather than always advertising mesh support and then generating
> an error when the user attempts to bring up the device without
> rawmode, only advertise it when available: that is, if the module
> is loaded with rawmode=1, the firmware supports it, and the
> device/firmware supports an AP virtual interface internally.
>
> Signed-off-by: Bob Copeland <me@bobcopeland.com>
> ---
> Actually, I think this is perhaps worse than just spitting out an
> error on interface up, but I'm sending anyway because it was requested
> a couple of times in review.
>
> The reason this is so ugly is that the structures in question are
> defined const in the API; when also declared const in the driver,
> they go into the .rodata section and the interface limit types
> cannot be changed without causing a fault.  So this patch removes
> const in a bunch of places and adds casts to const where required.
>
> Another approach might be changing cfg80211 to silently remove interface
> types from advertised combinations when the given mode is not also
> in interface_modes, instead of warning and failing registration as it
> does today.  But this would make errors here harder to spot.
>
> Or we can keep it the way it is with the driver failing and showing an
> error on add interface.  I'm okay with any of these approaches really.

Yeah, I'm with you. It would be nice to advertise the mesh feature on
when the firmware supports it, but I think this is just too complicated.
So I'm dropping this for now, but we can revisit later if there's a need
for that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
