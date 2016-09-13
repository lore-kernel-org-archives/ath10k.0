Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjmcu-0004Ee-KQ
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:15:52 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 5/5] ath10k: Allow setting coverage class
Date: Tue, 13 Sep 2016 12:14:43 +0000
Message-ID: <8760q0j8st.fsf@kamboji.qca.qualcomm.com>
References: <20160829144557.11678-1-benjamin@sipsolutions.net>
 <20160829144557.11678-6-benjamin@sipsolutions.net>
In-Reply-To: <20160829144557.11678-6-benjamin@sipsolutions.net> (Benjamin
 Berg's message of "Mon, 29 Aug 2016 16:45:57 +0200")
Content-Language: en-US
Content-ID: <FDF0274923FEE445BA98C0AFBDA64CEA@qualcomm.com>
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
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, "Thiagarajan,
 Vasanthakumar" <vthiagar@qti.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Benjamin Berg <benjamin@sipsolutions.net> writes:

> Unfortunately ath10k does not generally allow modifying the coverage class
> with the stock firmware and Qualcomm has so far refused to implement this
> feature so that it can be properly supported in ath10k. If we however know
> the registers that need to be modified for proper operation with a higher
> coverage class, then we can do these modifications from the driver.
>
> This patch implements this hack for first generation cards which are based
> on a core that is similar to ath9k. The registers are modified in place and
> need to be re-written every time the firmware sets them. To achieve this
> the register status is verified after certain WMI events from the firmware.
>
> The coverage class may not be modified temporarily right after the card
> re-initializes the registers. This is for example the case during scanning.
>
> Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
> working on a userspace support for this. This patch wouldn't have been
> possible without this documentation.
>
> Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> Signed-off-by: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

To be honest this is an ugly hack and very fragile. But at the same time
this is a quite requested feature, and the firmware doesn't support it,
so I guess this is better than nothing. And it shouldn't affect in
anyway if coverage class is not set from user space so hopefully it's
also safe for others.

I need to review this patch more, but I noticed that it crashes on my
setup with latest master-pending:

[   89.768265] BUG: sleeping function called from invalid context at drivers/net/wireless/ath/ath10k/wmi.c:1802
[   89.768324] in_atomic(): 1, irqs_disabled(): 0, pid: 1809, name: iw
[   89.768374] 5 locks held by iw/1809:
[   89.768422]  #0:  (cb_lock){++++++}, at: [<cc7d5465>] genl_rcv+0x15/0x30
[   89.768727]  #1:  (genl_mutex){+.+.+.}, at: [<cc7d5964>] genl_lock+0x14/0x20
[   89.769041]  #2:  (rtnl_mutex){+.+.+.}, at: [<cc7b0744>] rtnl_lock+0x14/0x20
[   89.769363]  #3:  (&ar->conf_mutex){+.+.+.}, at: [<f8e0d214>] ath10k_hw_qca988x_set_coverage_class+0x24/0x3c0 [ath10k_core]
[   89.769882]  #4:  (&(&ar->data_lock)->rlock){+.-...}, at: [<f8e0d222>] ath10k_hw_qca988x_set_coverage_class+0x32/0x3c0 [ath10k_core]
[   89.770188] CPU: 0 PID: 1809 Comm: iw Tainted: G            E   4.8.0-rc6-wt-ath+ #1468

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
