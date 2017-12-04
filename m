Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLrf4-0007Ir-JX
 for ath10k@lists.infradead.org; Mon, 04 Dec 2017 14:24:00 +0000
Message-ID: <1512397413.14552.67.camel@sakura.staff.proxad.net>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
From: Maxime Bizon <mbizon@freebox.fr>
Date: Mon, 04 Dec 2017 15:23:33 +0100
In-Reply-To: <45d5ada8ea658e49af85582b4f3f71f7@codeaurora.org>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <1512125137.38490.70.camel@sakura.staff.proxad.net>
 <7792e2fb2c546d8745c65e48945f2535@codeaurora.org>
 <1512140710.38490.81.camel@sakura.staff.proxad.net>
 <45d5ada8ea658e49af85582b4f3f71f7@codeaurora.org>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: mbizon@freebox.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: akolli@codeaurora.org
Cc: linux-wireless-owner@vger.kernel.org, akolli@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On Mon, 2017-12-04 at 18:54 +0530, akolli@codeaurora.org wrote:

> Hope 10.2.4-1.0-00029 Firmware binary works for you.

it does

> I will check this warning.

fixed by applying patch:
 "[PATCH] ath10k: fix recent bandwidth conversion bug"

as suggested by Christian Lamparter

only remaining oddity is the CONFIG_MAC80211_DEBUGFS dependency

-- 
Maxime



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
