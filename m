Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2QvU-0003lF-Nj
 for ath10k@lists.infradead.org; Fri, 14 Feb 2020 02:41:58 +0000
MIME-Version: 1.0
Date: Fri, 14 Feb 2020 10:41:52 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add retry mechanism for ath10k_start
In-Reply-To: <87mu9mwwhs.fsf@kamboji.qca.qualcomm.com>
References: <20200120025609.6060-1-wgong@codeaurora.org>
 <87mu9mwwhs.fsf@kamboji.qca.qualcomm.com>
Message-ID: <576c72fed4a15a13989dde163d77ed8c@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-02-13 19:35, Kalle Valo wrote:
> 
> I'm not convinved about this. ath10k assumes that SDIO bus works
> reliably and there's no data loss. In my opinion if the SDIO is not
> working reliably we should fail immediately with a clear error message
> for the user, instead of having an unstable connection. And I 
> understand
> from the logs that ath10k fails cleanly in this simulated failure.
> 
> So what you do here is ignore the assumption that the SDIO bus should
> always work reliably and add a workaround by trying to restart the
> firmware multiple times, and hope that by luck it works during one of 
> 10
> retry attempts. But then what? Isn't the WLAN connection flaky as SDIO
> bus is not reliable? So if we were to follow that design logic,
> shouldn't we add retries for _all_ ath10k SDIO transactions? But that
> would make ath10k even more complex as it is.
for other SDIO transfer, like data tx/rx, if it fail, the upper stack 
has
error mechanism to handle the fail.
but for ath10k_start, if it fails, especailly for recovery, then it can
not recovery again, because cfg80211_shutdown_all_interfaces, and it 
need
to reboot system to recovery wlan by test.
> 
> Because I think this patch makes things worse for the user, so I would
> like to understand the real life use case this patch is trying to fix
> and how it would help the user.
sometimes it has recovery/suspend/resume test case, it need to make sure
ath10k_start success, otherwise wlan will can not recovery unless reboot
system.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
