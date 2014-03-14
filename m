Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOPWu-0007aL-5J
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 10:39:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
Date: Fri, 14 Mar 2014 12:39:26 +0200
In-Reply-To: <20140313082431.10798.10888.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 13 Mar 2014 10:24:31 +0200")
Message-ID: <87bnx983oh.fsf@kamboji.qca.qualcomm.com>
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
To: marek.puzyniak@tieto.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Marek,

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> Command WMI_FORCE_FW_HANG_CMDID is not supported in firmware 10.1.
> In order to have firmware crash simulation functionality also
> in firmware 10.1 driver can force firmware crash by performing not allowed
> operation. Driver can deliberately crash firmware when setting vdev param for
> vdev id out of range.  This patch introduces two keywords to simulate_fw_crash:
>
> 'soft' which will cause firmware crash that is recoverable
>        by warm firmware reset but supported only in main firmware.
> 'hard' which will cause firmware crash recoverable by cold
>        firmware reset, this option works for both firmwares.
>
> Commands to trigger firmware soft/hard crash:
>
> echo 'soft' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
> echo 'hard' > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash
>
> kvalo: use strncmp(), remove '\n' before checking the command and
> document how buf is null terminated
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

can you please review my changes and check if they are ok?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
