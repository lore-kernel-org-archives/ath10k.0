Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKdd-0004fM-Ra
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 12:10:44 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Remove unnecessary error code assignment
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1472746416-23869-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <29d813fd318d4481b55d361557da6d92@euamsexm01a.eu.qualcomm.com>
Date: Fri, 9 Sep 2016 14:10:06 +0200
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
> The error assigned does not seems to be used anywhere,
> fixes nothing just a small cleanup
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

fe79f6314a71 ath10k: remove unnecessary error code assignment

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9309397/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
