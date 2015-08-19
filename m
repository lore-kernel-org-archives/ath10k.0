Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS0Ox-0005QS-M2
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 10:15:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: ensure pktlog disable cmd reaches fw before
 pdev suspend
References: <1436431783-10691-1-git-send-email-rmani@qti.qualcomm.com>
Date: Wed, 19 Aug 2015 13:14:56 +0300
In-Reply-To: <1436431783-10691-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Thu, 9 Jul 2015 14:19:42 +0530")
Message-ID: <87twrva8kf.fsf@kamboji.qca.qualcomm.com>
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

> Found incorrect sequence in ath10k_core_stop() where wmi pktlog
> disable cmd is passed from ath10k_debug_stop() to firmware
> immediately after wmi pdev suspend cmd. Firmware will not accept
> any wmi cmd after receiving wmi pdev suspend cmd.
>
> Fix this issue in ath10k_core_stop() by moving ath10k_debug_stop()
> just before sending pdev suspend cmd. So that pktlog disable cmd
> will get passed before pdev suspend cmd.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
