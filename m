Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTVpa-0003Xl-Bl
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 12:24:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/8] ath10k: small cleanups to pci.c
References: <20140328073040.30438.17966.stgit@potku.adurom.net>
Date: Fri, 28 Mar 2014 14:23:51 +0200
In-Reply-To: <20140328073040.30438.17966.stgit@potku.adurom.net> (Kalle Valo's
 message of "Fri, 28 Mar 2014 09:32:14 +0200")
Message-ID: <87a9cawlyg.fsf@kamboji.qca.qualcomm.com>
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

> While looking at the cold reset problem I did some cleanup
> to pci.c.
>
> v2: In patch 1 fix how to check FW_IND_INITIALIZED and also check for 0xffffffff.
>
> ---
>
> Kalle Valo (8):
>       ath10k: cleanup ath10k_pci_wait_for_target_init()
>       ath10k: add module parameter to disable cold reset
>       ath10k: fix name of target_ps module parameter
>       ath10k: advertise only firmware API 2 files
>       ath10k: delete ar_pci->fw_indicator_address
>       ath10k: improve pci debug messages
>       ath10k: add module parameter values to the pci info print
>       ath10k: print chip id during boot

All eight patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
