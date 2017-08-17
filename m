Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diEd4-000899-R5
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 06:50:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [2/6] ath10k: refactor firmware crashdump code to coredump.c
Date: Thu, 17 Aug 2017 06:49:40 +0000
Message-ID: <87378q664c.fsf@kamboji.qca.qualcomm.com>
References: <150278538298.22482.10986802411848917689.stgit@potku.adurom.net>
 <ec54c0ff3af546d2a52d75428c38d06b@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <ec54c0ff3af546d2a52d75428c38d06b@euamsexm01a.eu.qualcomm.com>
 (Kalle Valo's message of "Thu, 17 Aug 2017 06:20:02 +0200")
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> In preparation to add RAM dump support. No functional changes, only moving code
>> and renaming function names.
>> 
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> With only this patch applied, and CONFIG_DEV_COREDUMP disabled, there's a build error:
>
> drivers/net/wireless/ath/ath10k/coredump.c:24:30: error: redefinition
> of 'ath10k_coredump_new'
> drivers/net/wireless/ath/ath10k/coredump.c:130:5: error: redefinition
> of 'ath10k_coredump_submit'

Fixed in pending branch like this:

--- a/drivers/net/wireless/ath/ath10k/Makefile
+++ b/drivers/net/wireless/ath/ath10k/Makefile
@@ -20,7 +20,7 @@ ath10k_core-$(CONFIG_ATH10K_TRACING) += trace.o
 ath10k_core-$(CONFIG_THERMAL) += thermal.o
 ath10k_core-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
 ath10k_core-$(CONFIG_PM) += wow.o
-ath10k_core-$(CONFIG_ATH10K_DEBUGFS) += coredump.o
+ath10k_core-$(CONFIG_DEV_COREDUMP) += coredump.o

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
