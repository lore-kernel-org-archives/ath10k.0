Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIZi5-0002ub-Jf
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 11:00:42 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Enable beacon loss detection support for 10.4
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1466081684-8074-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <f1028a60ba004c749ae647ad38c7382a@euamsexm01a.eu.qualcomm.com>
Date: Thu, 30 Jun 2016 13:00:05 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Enable beacon loss detection support for 10.4 by handling
> roam event. With this change QCA99X0 station is able to
> detect beacon loss when the AP is powered off
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

343bf960f03c ath10k: enable beacon loss detection support for 10.4

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9180777/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
