Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eU8Yy-0001fj-Sf
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 10:03:56 +0000
MIME-Version: 1.0
Subject: Re: [next] ath10k: wmi: remove redundant integer fc
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20171218150245.9073-1-colin.king@canonical.com>
References: <20171218150245.9073-1-colin.king@canonical.com>
Message-ID: <9a6c9d36025e46fd9b22e985d3662d93@euamsexm01a.eu.qualcomm.com>
Date: Wed, 27 Dec 2017 11:03:31 +0100
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
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:

> Variable fc is being assigned but never used, so remove it. Cleans
> up the clang warning:
> 
> warning: Value stored to 'fc' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a0709dfd7ff8 ath10k: wmi: remove redundant integer fc

-- 
https://patchwork.kernel.org/patch/10119831/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
