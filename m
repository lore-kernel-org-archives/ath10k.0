Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLpbC-0004E7-Mj
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 08:25:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v8 0/4] ath10k: firmware crash dump
References: <20140821124705.27159.67898.stgit@potku.adurom.net>
Date: Mon, 25 Aug 2014 11:25:33 +0300
In-Reply-To: <20140821124705.27159.67898.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 21 Aug 2014 15:48:50 +0300")
Message-ID: <877g1x6kn6.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> And yet another version of firmware crash dumps. Now I dropped all dumps except
> firmware registers and tested all the features myself.

[...]

> Ben Greear (1):
>       ath10k: provide firmware crash info via debugfs
>
> Kalle Valo (3):
>       ath10k: add ath10k_pci_diag_* helpers
>       ath10k: rename ath10k_pci_hif_dump_area() to ath10k_pci_fw_crashed_dump()
>       ath10k: print more driver info when firmware crashes

Finally applied :)

I also applied the small diff to patch 2 to remove the unneeded use of
mutex in ath10k_fw_crash_dump_open().

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
