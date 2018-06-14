Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTOED-0007UR-Di
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 09:07:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Update the phymode along with bandwidth change
 request
References: <1528482759-12604-1-git-send-email-ryanhsu@codeaurora.org>
Date: Thu, 14 Jun 2018 12:07:22 +0300
In-Reply-To: <1528482759-12604-1-git-send-email-ryanhsu@codeaurora.org> (Ryan
 Hsu's message of "Fri, 8 Jun 2018 11:32:39 -0700")
Message-ID: <87h8m5ag8l.fsf@kamboji.qca.qualcomm.com>
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
To: Ryan Hsu <ryanhsu@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, timur.kristof@gmail.com

Ryan Hsu <ryanhsu@codeaurora.org> writes:

> In the case of Station connects to AP with narrower bandwidth at beginning.
> And later the AP changes the bandwidth to winder bandwidth, the AP will
> beacon with wider bandwidth IE, eg VHT20->VHT40->VHT80 or VHT40->VHT80.
>
> Since the supported BANDWIDTH will be limited by the PHYMODE, so while
> Station receives the bandwidth change request, it will also need to
> reconfigure the PHYMODE setting to firmware instead of just configuring
> the BANDWIDTH info, otherwise it'll trigger a firmware crash with
> non-support bandwidth.
>
> The issue was observed in WLAN.RM.4.4.1-00051-QCARMSWP-1, QCA6174 with
> below scenario.
> ---

BTW, I don't recommend using "---" or similar delimeters in the actual
commit log. Git uses that string as a separator between the commit log
and actual patch and that broke my patchwork script. I fixed the commit
log manually in the pending branch, and added Timur's Tested-by, please
check (I hope I got UTF-8 correct!):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=5aee6aeda5dae74e1c79256fc1df2e7599038fa7

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
