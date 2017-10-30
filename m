Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e95ci-0003QN-4I
 for ath10k@lists.infradead.org; Mon, 30 Oct 2017 08:40:46 +0000
MIME-Version: 1.0
Subject: Re: Revert "ath10k: fix napi_poll budget overflow"
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1509262876-10944-1-git-send-email-kvalo@qca.qualcomm.com>
References: <1509262876-10944-1-git-send-email-kvalo@qca.qualcomm.com>
Message-ID: <84b6d93b325741f7a6d24d1252f93149@euamsexm01a.eu.qualcomm.com>
Date: Mon, 30 Oct 2017 09:40:16 +0100
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:

> Thorsten reported on <fa6e3ee2-91b5-a54b-afe3-87f30aac7a48@leemhuis.info> that
> commit c9353bf483d3 made ath10k unstable with QCA6174 on his Dell XPS13 (9360)
> with an error message:
> 
> ath10k_pci 0000:3a:00.0: failed to extract amsdu: -11
> 
> It only seemed to happen with certain APs, not all, but when it happened the
> only way to get ath10k working was to switch the wifi off and on with a hotkey.
> 
> As this commit made things even worse (a warning vs breaking the whole
> connection) let's revert the commit for now and while the issue is being fixed.
> 
> Link: http://lists.infradead.org/pipermail/ath10k/2017-October/010227.html
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-current branch of ath.git, thanks.

e48e9c429a95 Revert "ath10k: fix napi_poll budget overflow"

-- 
https://patchwork.kernel.org/patch/10031233/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
