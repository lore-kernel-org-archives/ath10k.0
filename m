Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqtu-00021k-Uu
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 16:01:10 +0000
MIME-Version: 1.0
Subject: Re: [v5] ath10k: Fix broken NULL func data frame status for 10.4
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1472199140-8404-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <48c9092d7f6c468092ef093779624a36@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 18:00:33 +0200
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
Cc: mohammed@codeaurora.org, Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Older firmware with HTT delivers incorrect tx status for null func
> frames to driver, but this fixed in 10.2 and 10.4 firmware versions.
> Also this workaround results in reporting of incorrect null func status
> for 10.4. Fix this is by introducing a firmware feature flag for 10.4
> so that this workaround is skipped and proper tx status for null func
> frames are reported
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

2cdce425aa33 ath10k: Fix broken NULL func data frame status for 10.4

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9300961/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
