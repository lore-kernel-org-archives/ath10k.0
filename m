Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIY5P-0000tD-0X
 for ath10k@lists.infradead.org; Fri, 24 Jul 2015 08:12:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Extend struct htt_mgmt_tx_dec for qca99x0
References: <1437456121-7800-1-git-send-email-rmani@qti.qualcomm.com>
Date: Fri, 24 Jul 2015 11:11:20 +0300
In-Reply-To: <1437456121-7800-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Tue, 21 Jul 2015 10:52:00 +0530")
Message-ID: <871tfyf00n.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> HTT_H2T_MSG_TYPE_MGMT_TX msg in 10.4 firmware carries additional
> 4 byte in htt_mgmt_tx_desc where it tells to firmware that at what
> rate mgmt frame has to go out in the air. It's an optional parameter,
> setting this field to zero will force firmware to choose auto rate
> and send the frame out.
>
> Those 4 byte info is missed out in the current code and 10.4 firmware
> ended up reading some junk in those 4 byte and sometime malfunctioning.
>
> Fix it by adding 4 byte in struct htt_mgmt_tx_desc. Non 10.4 firmware
> will not process those four byte. So, adding 4 byte at the end of
> struct htt_mgmt_tx_desc will not create any impact on other chipset.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
