Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGmrX-0006h1-0i
 for ath10k@lists.infradead.org; Tue, 13 Dec 2016 13:11:20 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 11/11] ath10k: Added sdio support
Date: Tue, 13 Dec 2016 13:10:53 +0000
Message-ID: <87pokwynxf.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-12-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-12-git-send-email-erik.stromdahl@gmail.com>
 (Erik Stromdahl's message of "Fri, 18 Nov 2016 20:22:51 +0100")
Content-Language: en-US
Content-ID: <3F7A0717A225E54AA8CCCAFA3CA44FBA@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Initial HIF sdio/mailbox implementation.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

While testing this I noticed few new warnings:

drivers/net/wireless/ath/ath10k/sdio.c: In function ath10k_sdio_probe:
drivers/net/wireless/ath/ath10k/sdio.c:1723:6: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]
drivers/net/wireless/ath/ath10k/sdio.c:375:5: warning: symbol 'ath10k_sdio_mbox_rxmsg_pending_handler' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/sdio.c:1018:5: warning: symbol 'ath10k_sdio_hif_tx_sg' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/sdio.c:1415:5: warning: symbol 'ath10k_sdio_hif_exchange_bmi_msg' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/sdio.c:1555:5: warning: symbol 'ath10k_sdio_hif_map_service_to_pipe' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/sdio.c:1635:6: warning: symbol 'ath10k_sdio_hif_get_default_pipe' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/htc.c:265: line over 90 characters
drivers/net/wireless/ath/ath10k/htc.c:355: line over 90 characters

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
