Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5GWD-0004dG-Sd
 for ath10k@lists.infradead.org; Tue, 24 May 2016 17:53:26 +0000
MIME-Version: 1.0
Subject: Re: ath10k: improve tx scheduling
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1462796708-13880-1-git-send-email-michal.kazior@tieto.com>
Message-ID: <58d94fea017e4e04aa287f9cc45d7a6c@euamsexm01a.eu.qualcomm.com>
Date: Tue, 24 May 2016 19:52:55 +0200
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
> Recent changes revolving around implementing
> wake_tx_queue support introduced a significant
> performance regressions on some (slower, uni-proc)
> systems.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, 1 patch applied to ath.git:

7a0adc83f34d ath10k: improve tx scheduling

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9045961/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
