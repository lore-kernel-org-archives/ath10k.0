Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPUwR-0000yK-HG
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 13:20:12 +0000
MIME-Version: 1.0
Subject: Re: ath10k: disable wake_tx_queue for older devices
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
Message-ID: <fddd6abaa3394cf5ae8133f627ffd47d@euamsexm01a.eu.qualcomm.com>
Date: Tue, 19 Jul 2016 15:19:39 +0200
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

Michal Kazior <michal.kazior@tieto.com> wrote:
> Ideally wake_tx_queue should be used regardless as
> it is a requirement for reducing bufferbloat and
> implementing airtime fairness in the future.
> 
> However some setups (typically low-end platforms
> hosting QCA988X) suffer performance regressions
> with the current wake_tx_queue implementation.
> Therefore disable it unless it is really
> beneficial with current codebase (which is when
> firmware supports smart pull-push tx scheduling).
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

4ca1807815aa ath10k: disable wake_tx_queue for older devices

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9204997/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
