Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1bv-0001fj-Rw
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 08:58:53 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix reading sram contents for QCA4019
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1485887811-23313-1-git-send-email-arnagara@qti.qualcomm.com>
References: <1485887811-23313-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <263756ea946749a08c85691739345bee@eusanexr01a.eu.qualcomm.com>
Date: Tue, 7 Feb 2017 00:58:27 -0800
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> With QCA4019 platform, SRAM address can be accessed directly from host but
> currently, we are assuming sram addresses cannot be accessed directly and
> hence we convert the addresses.
> 
> While there, clean up growing hw checks during conversion of target CPU
> address to CE address. Now we have function pointer pertaining to different
> chips.
> 
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

7f622593cc5a ath10k: fix reading sram contents for QCA4019

-- 
https://patchwork.kernel.org/patch/9548043/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
