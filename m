Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0UFn-0008EB-1T
 for ath10k@lists.infradead.org; Tue, 18 Apr 2017 14:37:16 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/3] ath9k: Support channels in licensed bands
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20170323133048.30062-2-sw@simonwunderlich.de>
References: <20170323133048.30062-2-sw@simonwunderlich.de>
Message-Id: <20170418143654.49EA960F94@smtp.codeaurora.org>
Date: Tue, 18 Apr 2017 14:36:54 +0000 (UTC)
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Simon Wunderlich <sw@simonwunderlich.de> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Many chips support channels in licensed bands. Add support for those,
> along with a corresponding kernel config option to disable them by
> default. Note that these channels are not selectable even if the
> option has been compiled unless the user modifies the regulatory
> database to explicitly enable the corresponding channels.
> 
> NOTE:  These channels must not be used in most regulatory
> domains unless you have a license from the FCC or similar!
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> [Hide this support behind a Kconfig option]
> Signed-off-by: Julian Calaby <julian.calaby@gmail.com>
> [only use the 20 mhz channels, add 5 ghz, change to 4.9ghz to licensed bands, simplify]
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

I am not sure that we should support unlicensed bands in Linux and hence
hesitant to apply these. My view is that due to regulatory restrictions we
should not make it too easy to use unlicensed bands. But I'm open for
discussion, this is a challenging area and my knowledge here is limited.

-- 
https://patchwork.kernel.org/patch/9641105/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
