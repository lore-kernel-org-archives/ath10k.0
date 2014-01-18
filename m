Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4RVm-0001ns-LS
 for ath10k@lists.infradead.org; Sat, 18 Jan 2014 08:44:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: bitrate_mask add force_sgi support
References: <1389985454-3997-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Sat, 18 Jan 2014 10:43:48 +0200
In-Reply-To: <1389985454-3997-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 17 Jan 2014 20:04:14 +0100")
Message-ID: <87r485ptmj.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Add force SGI support.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Thanks, the patch looks good.

> depends on, nl80211: add Guard Interval support for set_bitrate_mask

But I can only apply this only once the dependency patch goes to
wireless-next, so I'll keep this in my pending queue until that happens.
Most likely we need to wait for the merge window to close.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
