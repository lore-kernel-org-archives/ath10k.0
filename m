Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQZ0a-0001g8-Aq
 for ath10k@lists.infradead.org; Tue, 02 Feb 2016 11:20:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 00/12] add ahb (qca4019) support
References: <1453888473-2879-1-git-send-email-rmani@qti.qualcomm.com>
Date: Tue, 2 Feb 2016 13:19:58 +0200
In-Reply-To: <1453888473-2879-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Wed, 27 Jan 2016 15:24:21 +0530")
Message-ID: <87mvrjgy01.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> This patch series attempts to add ahb support (qca4019) in ath10k.
> All ahb related ops are grouped and kept in new file called ahb.c/ahb.h 
> and will get compiled/linked to ath10k_pci.ko based on kernel config flag
> CONFIG_ATH10K_AHB flag. Most of function in pci.c file are reusable and
> called as it's without changing function name (ath10k_pci_*) in ahb.c.
>
> Still, some more work needs to be done in ath10k driver to make ahb
> functional (qca4019). Hence, i disabled device probing in ahb module
> for the time being. I'll post follow patch soon to enable it along
> with missing patches.
>
> The patch to update device tree bindings document with list of DT node
> attributes referred in this patch series is already committed in ath.git,
>
>       https://patchwork.kernel.org/patch/8022221/
>
> Raja Mani (12):
>   ath10k: make some of ath10k_pci_* func reusable
>   ath10k: make ath10k_pci_read32/write32() ops more generic
>   ath10k: pull reusable code from pci probe and remove for ahb
>   ath10k: add basic skeleton to support ahb
>   ath10k: include qca4019 register map table
>   ath10k: add helper functions in ahb.c for reg rd/wr
>   ath10k: add clock ctrl related functions in ahb
>   ath10k: add reset ctrl related functions in ahb
>   ath10k: add chip and bus halt logic in ahb
>   ath10k: include irq related functions in ahb
>   ath10k: add resource init and deinit in ahb
>   ath10k: expose hif ops for ahb

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
