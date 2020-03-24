Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGici-0001vg-Mf
 for ath10k@lists.infradead.org; Tue, 24 Mar 2020 12:25:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add retry mechanism for ath10k_start
References: <20200120025609.6060-1-wgong@codeaurora.org>
 <87mu9mwwhs.fsf@kamboji.qca.qualcomm.com>
 <576c72fed4a15a13989dde163d77ed8c@codeaurora.org>
Date: Tue, 24 Mar 2020 14:25:30 +0200
In-Reply-To: <576c72fed4a15a13989dde163d77ed8c@codeaurora.org> (Wen Gong's
 message of "Fri, 14 Feb 2020 10:41:52 +0800")
Message-ID: <877dza7xdx.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-02-13 19:35, Kalle Valo wrote:
>>
>> I'm not convinved about this. ath10k assumes that SDIO bus works
>> reliably and there's no data loss. In my opinion if the SDIO is not
>> working reliably we should fail immediately with a clear error message
>> for the user, instead of having an unstable connection. And I
>> understand
>> from the logs that ath10k fails cleanly in this simulated failure.
>>
>> So what you do here is ignore the assumption that the SDIO bus should
>> always work reliably and add a workaround by trying to restart the
>> firmware multiple times, and hope that by luck it works during one
>> of 10
>> retry attempts. But then what? Isn't the WLAN connection flaky as SDIO
>> bus is not reliable? So if we were to follow that design logic,
>> shouldn't we add retries for _all_ ath10k SDIO transactions? But that
>> would make ath10k even more complex as it is.
>
> for other SDIO transfer, like data tx/rx, if it fail, the upper stack
> has error mechanism to handle the fail.

Handle the fail is different from retrying. I'm all that all error cases
need to be gracefully handled and bailed out with a clear error, but I
have not seen any logic that mac80211 or driver should retry
transmissions to firmware because of hardware errors. Just as an
example, if there is data loss on the PCI/SDIO bus I don't think the
ath10k credit handling will work for long.

> but for ath10k_start, if it fails, especailly for recovery, then it can
> not recovery again, because cfg80211_shutdown_all_interfaces, and it
> need
> to reboot system to recovery wlan by test.
>>
>> Because I think this patch makes things worse for the user, so I would
>> like to understand the real life use case this patch is trying to fix
>> and how it would help the user.
>
> sometimes it has recovery/suspend/resume test case, it need to make sure
> ath10k_start success, otherwise wlan will can not recovery unless reboot
> system.

If this works 99% of the time and 1% is failing then you should find the
root cause for that 1% case and fix that. The bug might be in ath10k, in
SDIO controller driver or maybe even somewhere else.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
