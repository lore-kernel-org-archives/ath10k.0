Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgD5G-0000lf-2g
 for ath10k@lists.infradead.org; Thu, 19 Jul 2018 17:51:23 +0000
Received: by mail-lf1-x141.google.com with SMTP id j8-v6so114682lfb.4
 for <ath10k@lists.infradead.org>; Thu, 19 Jul 2018 10:51:10 -0700 (PDT)
Date: Thu, 19 Jul 2018 19:51:05 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 0/6] *** Add support for wifi QMI client handshakes ***
Message-ID: <20180719175105.GA2633@centauri.lan>
References: <20180706085622.27945-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180706085622.27945-1-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

On Fri, Jul 06, 2018 at 02:26:17PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.

(cut)

Hello Govind,

I ran make W=1, sparse, and checkpatch on your new iteration of patches.
(I didn't do a full manual review this time, since I did that last time.)

Building with warnings and checkpatch looks good,
but sparse reports the two following warnings:

  CHECK   drivers/net/wireless/ath/ath10k//qmi.c
drivers/net/wireless/ath/ath10k//qmi.c:935:29: warning: incorrect type in assignment (different address spaces)
drivers/net/wireless/ath/ath10k//qmi.c:935:29:    expected void *msa_va
drivers/net/wireless/ath/ath10k//qmi.c:935:29:    got void [noderef] <asn:2>*

and

drivers/net/wireless/ath/ath10k//snoc.c:76:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:76:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:76:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:77:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:77:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:77:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:77:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:77:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:77:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:78:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:78:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:78:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:78:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:78:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:78:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:79:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:79:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:79:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:79:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:79:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:79:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:80:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:80:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:80:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:80:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:80:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:80:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:81:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:81:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:81:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:81:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:81:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:81:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:82:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:82:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:82:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:82:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:82:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:82:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:83:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:83:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:83:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:83:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:83:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:83:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:84:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:84:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:84:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:84:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:84:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:84:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:85:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:85:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:85:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:85:22: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:85:22:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:85:22:    got int
drivers/net/wireless/ath/ath10k//snoc.c:86:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:86:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:86:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:86:23: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:86:23:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:86:23:    got int
drivers/net/wireless/ath/ath10k//snoc.c:87:19: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:87:19:    expected restricted __le16 [usertype] ce_id
drivers/net/wireless/ath/ath10k//snoc.c:87:19:    got int
drivers/net/wireless/ath/ath10k//snoc.c:87:23: warning: incorrect type in initializer (different base types)
drivers/net/wireless/ath/ath10k//snoc.c:87:23:    expected restricted __le16 [usertype] reg_offset
drivers/net/wireless/ath/ath10k//snoc.c:87:23:    got int


Kind regards,
Niklas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
