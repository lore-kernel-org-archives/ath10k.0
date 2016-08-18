Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baSnp-00062N-QF
 for ath10k@lists.infradead.org; Thu, 18 Aug 2016 19:16:34 +0000
Date: Thu, 18 Aug 2016 21:16:08 +0200
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 0/2] wireless: Use complete() instead complete_all()
Message-ID: <20160818191608.GM3296@wotan.suse.de>
References: <1471525926-20384-1-git-send-email-wagi@monom.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1471525926-20384-1-git-send-email-wagi@monom.org>
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
To: Daniel Wagner <wagi@monom.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Daniel Wagner <daniel.wagner@bmw-carit.de>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>

On Thu, Aug 18, 2016 at 03:12:04PM +0200, Daniel Wagner wrote:
> This series ignores all complete_all() usages in the firmware loading
> path. They will be hopefully address by Luis' sysdata patches [0].
> That leaves a couple of complete_all() calls.

I had not considered this as a gain, but glad to know the sysdata series
could help with RT as well, thanks for the clarification.

 Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
