Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfR1X-0002lf-3T
 for ath10k@lists.infradead.org; Wed, 18 Nov 2020 17:13:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/6] ath10k: make relay callbacks const
References: <20201118165320.26829-1-jani.nikula@intel.com>
 <20201118165320.26829-3-jani.nikula@intel.com>
Date: Wed, 18 Nov 2020 19:13:22 +0200
In-Reply-To: <20201118165320.26829-3-jani.nikula@intel.com> (Jani Nikula's
 message of "Wed, 18 Nov 2020 18:53:17 +0200")
Message-ID: <87ima2vb9p.fsf@codeaurora.org>
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Jani Nikula <jani.nikula@intel.com> writes:

> Now that relay_open() accepts const callbacks, make relay callbacks
> const.
>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: ath10k@lists.infradead.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I assume this goes via some other tree:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
