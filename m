Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXsG-0001Rw-RO
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:47:37 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix rx_channel during hw reconfigure
Date: Tue, 19 Apr 2016 15:47:12 +0000
Message-ID: <87zispiosq.fsf@kamboji.qca.qualcomm.com>
References: <1460011314-15978-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1460011314-15978-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 7 Apr 2016 12:11:54 +0530")
Content-Language: en-US
Content-ID: <BA6E516EE728284BA6D3595F7472175F@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Upon firmware assert, restart work will be triggered so that mac80211
> will reconfigure the driver. An issue is reported that after restart
> work, survey dump data do not contain in-use (SURVEY_INFO_IN_USE) info
> for operating channel. During reconfigure, since mac80211 already has
> valid channel context for given radio, channel context iteration return
> num_chanctx > 0. Hence rx_channel is always NULL. Fix this by assigning
> channel context to rx_channel when driver restart is in progress.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
