Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2FNG-0005OS-RH
 for ath10k@lists.infradead.org; Thu, 13 Feb 2020 14:21:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix unsupported chip reset debugs file write
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580887644-21061-1-git-send-email-yintang@codeaurora.org>
References: <1580887644-21061-1-git-send-email-yintang@codeaurora.org>
Message-Id: <20200213142146.1FC37C4479C@smtp.codeaurora.org>
Date: Thu, 13 Feb 2020 14:21:46 +0000 (UTC)
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
To: Yingying Tang <yintang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yingying Tang <yintang@codeaurora.org> wrote:

> Before this change, after writing "warm_hw_reset" debugfs file, host
> will send chip reset command to FW even though FW do not support this
> service getting a warning print.
> 
> Though there is no FW impact before this change, this patch restricts
> chip reset command sent to FW only if FW advertises the support via WMI
> service bit.
> 
> Removed the redundant check and ath10k_warn() print as well.
> 
> New version FW will report chip reset service bit to host. Host allow user
> to trigger WLAN chip reset only when fw report this service bit.
> 
> For older NON-TLV FW, since it do not report chip reset service bit, host
> will not send chip reset command. For older TLV FW, since it report chip
> reset service bit, host will send chip reset command.
> 
> Tested HW:  QCA9984, WCN3990
> 
> QCA9984 FW version: WLAN.BL.3.9.0.2-00042-S-1
> 
> Signed-off-by: Yingying Tang <yintang@codeaurora.org>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:367
error: drivers/net/wireless/ath/ath10k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11365857/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
