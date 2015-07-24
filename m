Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIXei-0006Ia-O8
 for ath10k@lists.infradead.org; Fri, 24 Jul 2015 07:44:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2] ath10k: Delay device access after cold reset
References: <1436518880-9638-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Fri, 24 Jul 2015 10:44:02 +0300
In-Reply-To: <1436518880-9638-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Fri, 10 Jul 2015 14:31:20
 +0530")
Message-ID: <87vbdaf1a5.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> It is observed that during cold reset pcie access right
> after a write operation to SOC_GLOBAL_RESET_ADDRESS causes
> Data Bus Error and system hard lockup. The reason
> for bus error is that pcie needs some time to get
> back to stable state for any transaction during cold reset. Add
> delay of 20 msecs after write of SOC_GLOBAL_RESET_ADDRESS
> to fix this issue. This patch is tested on QCA988X. This is
> also tested on QCA99X0 which is WIP.
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
