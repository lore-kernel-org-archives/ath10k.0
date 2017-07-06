Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT5jw-000814-E9
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 12:18:38 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: Make CE layer bus agnostic
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1498625306-21900-1-git-send-email-govinds@qti.qualcomm.com>
References: <1498625306-21900-1-git-send-email-govinds@qti.qualcomm.com>
Message-ID: <63060d6b10074d43ac9877099a61e6a2@eusanexr01a.eu.qualcomm.com>
Date: Thu, 6 Jul 2017 05:18:05 -0700
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
To: Govind Singh <govinds@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@qti.qualcomm.com> wrote:

> Remove bus specific dependencies from CE layer
> to have common CE layer across multiple targets.
> This is required for adding support for WCN3990
> chipset support as WCN3990 chipset uses SNOC
> bus interface with Copy Engine endpoint.
> 
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

641fe28ad305 ath10k: make CE layer bus agnostic
f9e18304544e ath10k: add copy engine register MAP for wcn3990 target

-- 
https://patchwork.kernel.org/patch/9813463/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
