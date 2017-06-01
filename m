Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPkH-0005Eq-FT
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 13:02:38 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix the logic of limiting tdls peer counts
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1496177909-5579-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1496177909-5579-1-git-send-email-ryanhsu@qca.qualcomm.com>
Message-ID: <022043783bb54759888017d9acd62c47@eusanexr01a.eu.qualcomm.com>
Date: Thu, 1 Jun 2017 06:02:00 -0700
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
To: ryanhsu@qti.qualcomm.com
Cc: yintang@qti.qualcomm.com, linux-wireless@vger.kernel.org, kaliu@qti.qualcomm.com, ath10k@lists.infradead.org

ryanhsu@qti.qualcomm.com wrote:

> The original idea is to limit the maximum TDLS peer link, but the logic
> is always false, and never be able to restrict the number of TDLS peer
> creation.
> 
> Fix the logic here and also move the checking earlier, so that it could
> avoid to handle the failure case, e.g disable the tdls peer, delete the
> peer and also vdev count cleanup.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

9a993cc1ea95 ath10k: fix the logic of limiting tdls peer counts

-- 
https://patchwork.kernel.org/patch/9755235/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
