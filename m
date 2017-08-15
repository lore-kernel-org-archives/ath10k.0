Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dha70-0003yV-FA
 for ath10k@lists.infradead.org; Tue, 15 Aug 2017 11:34:20 +0000
MIME-Version: 1.0
Subject: Re: [5/6] ath10k: add memory dump support for QCA6174/QCA9377
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
References: <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
Message-ID: <e8f8ba72414c48dea427357170975b66@euamsexm01a.eu.qualcomm.com>
Date: Tue, 15 Aug 2017 13:33:51 +0200
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:

> Add memory dump to the firmware crash data file which is provided to user space
> via devcoredump interface. This makes it easier for firmware engineers to debug
> firmware crashes.
> 
> Due to increased memory consumption the memory dump is disabled by default. To
> enable it make sure that bit 3 is set in coredump_mask module parameter:
> 
> modprobe ath10k_core coredump_mask=0xffffffff
> 
> When RAMDUMP is enabled a buffer for the dump is allocated with vmalloc during
> device probe. The actual memory layout is different in hardware versions and
> the layouts are defined in coredump.c. The memory is split to regions and, to
> get even finegrained control of what to copy, the region can split to smaller
> sections as not all registers are readable (which could cause the whole system
> to stall).
> 
> Signed-off-by: Alan Liu <alanliu@qca.qualcomm.com>
> [kvalo@qca.qualcomm.com: refactoring and cleanup]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

kbuild bot reported:

coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/pci.c:1561:2-3: Unneeded semicolon
--
>> drivers/net/wireless/ath/ath10k/pci.c:1522:6-15: WARNING: Unsigned expression compared with zero: skip_size < 0

-- 
https://patchwork.kernel.org/patch/9901255/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
