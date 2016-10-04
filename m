Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brRGv-0008D2-Mj
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 15:04:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv3,5/5] ath10k: Allow setting coverage class
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160829144557.11678-6-benjamin@sipsolutions.net>
References: <20160829144557.11678-6-benjamin@sipsolutions.net>
Message-ID: <677867cb33294558b78135cfb11d5c4a@euamsexm01a.eu.qualcomm.com>
Date: Tue, 4 Oct 2016 17:04:17 +0200
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
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Benjamin Berg <benjamin@sipsolutions.net> wrote:
> Unfortunately ath10k does not generally allow modifying the coverage class
> with the stock firmware and Qualcomm has so far refused to implement this
> feature so that it can be properly supported in ath10k. If we however know
> the registers that need to be modified for proper operation with a higher
> coverage class, then we can do these modifications from the driver.
> 
> This patch implements this hack for first generation cards which are based
> on a core that is similar to ath9k. The registers are modified in place and
> need to be re-written every time the firmware sets them. To achieve this
> the register status is verified after certain WMI events from the firmware.
> 
> The coverage class may not be modified temporarily right after the card
> re-initializes the registers. This is for example the case during scanning.
> 
> Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
> working on a userspace support for this. This patch wouldn't have been
> possible without this documentation.
> 
> Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Patch applied to ath-next branch of ath.git, thanks.

ebee76f7fa46 ath10k: allow setting coverage class

-- 
https://patchwork.kernel.org/patch/9304067/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
