Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1borK8-0006Ae-2n
 for ath10k@lists.infradead.org; Tue, 27 Sep 2016 12:17:25 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix rfc1042 header retrieval in QCA4019 with eth decap
 mode
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1469623085-13942-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1469623085-13942-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <b725ab111d4f49d094d887a6555e9d81@euamsexm01a.eu.qualcomm.com>
Date: Tue, 27 Sep 2016 14:16:57 +0200
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> wrote:
> Chipset from QCA99X0 onwards (QCA99X0, QCA9984, QCA4019 & future)
> rx_hdr_status is not padded to align in 4-byte boundary. Define a
> new hw_params field to handle different alignment behaviour between
> different hw. This patch fixes improper retrieval of rfc1042 header
> with QCA4019. This patch along with "ath10k: Properly remove padding
> from the start of rx payload" will fix traffic failure in ethernet
> decap mode for QCA4019.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

2f38c3c01de9 ath10k: fix rfc1042 header retrieval in QCA4019 with eth decap mode

-- 
https://patchwork.kernel.org/patch/9249751/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
