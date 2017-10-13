Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2ym9-0005hl-9z
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 12:09:19 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Store coverage-class in case firmware is not booted.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1507068707-14050-1-git-send-email-greearb@candelatech.com>
References: <1507068707-14050-1-git-send-email-greearb@candelatech.com>
Message-ID: <3bbdd65d31c7406a95a40c85ed03a144@euamsexm01e.eu.qualcomm.com>
Date: Fri, 13 Oct 2017 14:08:46 +0200
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> This way, we can apply the values when the NIC does come up.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

0a590a38778d ath10k: store coverage-class in case firmware is not booted

-- 
https://patchwork.kernel.org/patch/9983585/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
