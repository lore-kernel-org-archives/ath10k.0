Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1XYz-000219-Jo
 for ath10k@lists.infradead.org; Tue, 23 Jul 2013 08:03:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4] ath10k: create debugfs interface to trigger fw crash
References: <878v1122id.fsf@kamboji.qca.qualcomm.com>
 <1374494931-18913-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 23 Jul 2013 11:02:25 +0300
In-Reply-To: <1374494931-18913-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 22 Jul 2013 14:08:51 +0200")
Message-ID: <87vc41wvou.fsf@kamboji.qca.qualcomm.com>
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

> This can be useful for testing. To perform a
> forced firmware crash write 'crash' to
> 'simulate_fw_crash' debugfs file. E.g.
>
>   echo crash > /sys/kernel/debug/ieee80211/phy1/ath10k/simulate_fw_crash
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> v3: return an appropriate errno instead of using ath10k_warn()

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
