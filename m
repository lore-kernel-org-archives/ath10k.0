Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRKkx-00053U-88
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 13:47:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Fix invalid survey reporting for QCA99X0
References: <1439376845-17245-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Mon, 17 Aug 2015 16:46:53 +0300
In-Reply-To: <1439376845-17245-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Wed, 12 Aug 2015 16:24:04
 +0530")
Message-ID: <87twrydo36.fsf@kamboji.qca.qualcomm.com>
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

> There are three WMI_CHAN_INFO events reported per channel
> in QCA99X0 firmware. First one is a notification at the begining
> of the channel dwell time with cmd_flag as CHAN_INFO_START(cmd_flag = 0),
> second one is a notification at the end of the dwell time with cmd_flag
> CHAN_INFO_PRE_COMPLETE (cmd_flag = 2) and the third is the indication
> with CHAN_INFO_COMPLETE (cmd_flag = 1) which is the last indication for
> the channel. Since there is a new state before the completion, the handler
> is to fixed so that the counts are deducted from the ones reported with
> CHAN_INFO_START rather than the ones reported with CHAN_INFO_PRE_COMPLETE.
> Without this fix there will be lots of 0 msecs reported as active
> and busy time.
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, both applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
