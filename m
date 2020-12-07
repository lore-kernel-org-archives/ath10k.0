Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmIso-0004iM-MS
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 15:57:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ath10k_pci_wait_for_target_init() should relax cpu for
 other task instead of calling medelay() so that cpu can run other tasks.
 Signed-off-by: lzhou <lzhou@sonicwall.com> ---
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201203033729.382088-2-zhouliangya@126.com>
References: <20201203033729.382088-2-zhouliangya@126.com>
Message-Id: <20201207155657.2F69BC43461@smtp.codeaurora.org>
Date: Mon,  7 Dec 2020 15:56:57 +0000 (UTC)
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
To: zhouliangya@126.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

zhouliangya@126.com wrote:

> From: lzhou <zhouliangya@126.com>

The subject and commit log is badly formatted, see patchwork link below.
But how is schedule_timeout_interruptible() better than msleep()?

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201203033729.382088-2-zhouliangya@126.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
