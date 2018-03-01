Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erL71-0005qh-Td
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 10:06:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 01/13] ath10k: platform driver for WCN3990 SNOC WLAN module
References: <1518684458-5338-1-git-send-email-govinds@codeaurora.org>
Date: Thu, 01 Mar 2018 12:06:41 +0200
In-Reply-To: <1518684458-5338-1-git-send-email-govinds@codeaurora.org> (Govind
 Singh's message of "Thu, 15 Feb 2018 14:17:38 +0530")
Message-ID: <87371kqfda.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> writes:

> WCN3990 is integrated 802.11ac chipset with SNOC
> bus interface. Add snoc layer driver registration
> and associated ops.
>
> WCN3990 support is not yet complete as cold-boot
> handshake is done using qmi(Qualcomm-MSM-Interface)
> and qmi client support will be added once qmi framework
> is available.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

Kbuild bot found an odd problem with this patch:

 include/linux/dynamic_debug.h:77:14: error: 'KBUILD_MODNAME'
 undeclared (first use in this function); did you mean
 'KBUILD_BASENAME'?

Full report:

http://lists.infradead.org/pipermail/ath10k/2018-February/010907.html

Any ideas? Is this is some unrelated issue or what? This patch is not
even touching hif.h or ce.c.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
