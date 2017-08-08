Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df2LS-0006dB-VZ
 for ath10k@lists.infradead.org; Tue, 08 Aug 2017 11:06:46 +0000
MIME-Version: 1.0
Subject: Re: [v3] ath10k: ath10k_htt_rx_amsdu_allowed() use ath10k_dbg()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170719191955.11518-1-nix.or.die@gmail.com>
References: <20170719191955.11518-1-nix.or.die@gmail.com>
Message-ID: <b458726452224508b342d1ab932e1fa2@euamsexm01a.eu.qualcomm.com>
Date: Tue, 8 Aug 2017 13:06:11 +0200
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
To: Gabriel C <nix.or.die@gmail.com>
Cc: ryanhsu@qti.qualcomm.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, joe@perches.com

Gabriel C <nix.or.die@gmail.com> wrote:

> Each time we get disconnected from AP we get flooded with messages like:
> 
> ...
> ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
> <until ratelimit kicks in>
> ath10k_warn: 155 callbacks suppressed
> ...
> 
> Use ath10k_dbg() here too.
> 
> Signed-off-by: Gabriel Craciunescu <nix.or.die@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

984eb9053280 ath10k: ath10k_htt_rx_amsdu_allowed() use ath10k_dbg()

-- 
https://patchwork.kernel.org/patch/9853129/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
