Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNO3-0000GZ-SH
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:34:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 6/7] ath10k: use rx descriptor for ppdu status extraction
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
 <1415110931-10945-7-git-send-email-michal.kazior@tieto.com>
Date: Mon, 17 Nov 2014 16:33:54 +0200
In-Reply-To: <1415110931-10945-7-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 4 Nov 2014 15:22:10 +0100")
Message-ID: <87lhn9q4kt.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This makes it more in line with the new Rx path.
> It also makes the code more reusable because Rx
> descriptor is more accessible.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This patch also had a checkpatch warning. Full patch here:

https://github.com/kvalo/ath/commit/d01090f45a5891f811bfaadb9a15c7e47ef0ef26

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 41dce044e3e8..bf82cb756548 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -815,9 +815,8 @@ static void ath10k_htt_rx_h_ppdu(struct ath10k *ar,
 		ath10k_htt_rx_h_rates(ar, status, rxd);
 	}
 
-	if (is_last_ppdu) {
+	if (is_last_ppdu)
 		ath10k_htt_rx_h_mactime(ar, status, rxd);
-	}
 }
 
 static const char * const tid_to_ac[] = {


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
