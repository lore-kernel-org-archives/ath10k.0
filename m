Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cotXq-0003b8-9k
 for ath10k@lists.infradead.org; Fri, 17 Mar 2017 15:12:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4.11] ath10k: fix incorrect wlan_mac_base in qca6174_regs
Date: Fri, 17 Mar 2017 15:10:45 +0000
Message-ID: <87mvckq6q3.fsf@kamboji.qca.qualcomm.com>
References: <1489445343-8719-1-git-send-email-ryanhsu@qca.qualcomm.com>
In-Reply-To: <1489445343-8719-1-git-send-email-ryanhsu@qca.qualcomm.com>
 (ryanhsu@qca.qualcomm.com's message of "Mon, 13 Mar 2017 15:49:03	-0700")
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<ryanhsu@qca.qualcomm.com> writes:

> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
>
> In the 'commit ebee76f7fa46 ("ath10k: allow setting coverage class")',
> it inherits the design and the address offset from ath9k, but the address
> is not applicable to QCA6174, which leads to a random crash while doing the
> resume() operation, since the set_coverage_class.ops will be called from
> ieee80211_reconfig() when resume() (if the wow is not configured).
>
> Fix the incorrect address offset here to avoid the random crash.
>
> Verified on QCA6174/hw3.0 with firmware WLAN.RM.4.4-00022-QCARMSWPZ-2.

This also seems to fix a regression related to firmware restart. I was
testing simulate_fw_crash on qca6174 with current ath.git master branch
and noticed firmware crash recovery fails every time:

[   90.402204] ath10k_pci 0000:02:00.0: device is wedged, will not restart

With this patch the recovery works every time I tested this. But I'm not
100% sure yet about this, need to test more.

> Cc: stable@vger.kernel.org

I'll add '# v4.10' because that should be first release which had
ebee76f7fa46, no need to backport to older releases.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
