Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4VD-0001yT-LH
 for ath10k@lists.infradead.org; Wed, 11 Mar 2020 16:46:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix not registering airtime of 11a station with
 WMM disable
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1582171405-27236-1-git-send-email-yiboz@codeaurora.org>
References: <1582171405-27236-1-git-send-email-yiboz@codeaurora.org>
Message-Id: <20200311164636.82D46C433BA@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:46:36 +0000 (UTC)
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yibo Zhao <yiboz@codeaurora.org> wrote:

> The tid of 11a station with WMM disable reported by FW is 0x10 in
> tx completion. The tid 16 is mapped to a NULL txq since buffer
> MMPDU capbility is not supported. Then 11a station's airtime will
> not be registered due to NULL txq check. As a results, airtime of
> 11a station keeps unchanged in debugfs system.
> 
> Mask the tid along with IEEE80211_QOS_CTL_TID_MASK to make it in
> the valid range.
> 
> Hardwares tested : QCA9984
> Firmwares tested : 10.4-3.10-00047
> 
> Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f9680c75d187 ath10k: fix not registering airtime of 11a station with WMM disable

-- 
https://patchwork.kernel.org/patch/11393223/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
