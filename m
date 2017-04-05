Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvfTj-00087I-Od
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:40:24 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix NAPI enable/disable symmetry for AHB interface
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1490023366-8176-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1490023366-8176-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <03b850bce8814651b5a0b021f4597ce2@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:34:07 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Move NAPI enable to 'ath10k_ahb_hif_start' from
> 'ath10k_ahb_hif_power_up'. This is to maintain the symmetry
> of calling napi_enable() from ath10k_ahb_hif_start() so that it
> matches with  napi_disable() being called from ath10k_pci_hif_stop().
> 
> This change is based on the crash fix from Kalle for PCI interface in
> commit 1427228d5869 ("ath10k: fix napi crash during rmmod when probe
> firmware fails").
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a7595a820b07 ath10k: fix NAPI enable/disable symmetry for AHB interface

-- 
https://patchwork.kernel.org/patch/9634379/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
