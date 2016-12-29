Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMabT-0002FR-M6
 for ath10k@lists.infradead.org; Thu, 29 Dec 2016 13:18:44 +0000
MIME-Version: 1.0
Subject: Re: [1/5] ath10k: fix IRAM banks number for QCA9377
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
References: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
Message-ID: <ad2a4327484c42999daeb8e94ea3e525@euamsexm01a.eu.qualcomm.com>
Date: Thu, 29 Dec 2016 14:18:15 +0100
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> wrote:
> QCA9377 firmware shall alloc 4 IRAM banks
> 
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

5 patches applied to ath-next branch of ath.git, thanks.

77cf13ad5731 ath10k: fix IRAM banks number for QCA9377
b08b5b53a1ed ath10k: override CE5 config for QCA9377
35bac90abf5e ath10k: decrease num of peers support
7cfe0455ee12 ath10k: set CTS protection VDEV param only if VDEV is up
861769017404 ath10k: add debug trace to rts/cts set function

-- 
https://patchwork.kernel.org/patch/9464915/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
