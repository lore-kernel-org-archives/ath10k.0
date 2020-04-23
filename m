Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRVQr-0000gi-OL
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 06:34:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw
 crash
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1555059170-11988-1-git-send-email-wgong@codeaurora.org>
References: <1555059170-11988-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20200423063353.208E9C433CB@smtp.codeaurora.org>
Date: Thu, 23 Apr 2020 06:33:53 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> When test simulate firmware crash, it is easy to trigger error.
> command:
> echo soft > /sys/kernel/debug/ieee80211/phyxx/ath10k/simulate_fw_crash.
> 
> If input more than two times continuously, then it will have error.
> Error message:
> ath10k_pci 0000:02:00.0: failed to set vdev 1 RX wake policy: -108
> ath10k_pci 0000:02:00.0: device is wedged, will not restart
> 
> It is because the state has not changed to ATH10K_STATE_ON immediately,
> then it will have more than two simulate crash process running meanwhile,
> and complete/wakeup some field twice, it destroy the normal recovery
> process.
> 
> add flag wait-ready for this command:
> echo soft wait-ready > /sys/kernel/debug/ieee80211/phyxx/ath10k/simulate_fw_crash
> 
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

I'm dropping this as I suspect the real bug is somewhere else and this
is just a workaround.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10897587/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
