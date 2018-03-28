Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1Cp4-0007ix-KZ
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 15:17:13 +0000
MIME-Version: 1.0
Subject: Re: [01/12] ath10k: Add qmi service for wlan qmi client
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522042736-25618-1-git-send-email-govinds@codeaurora.org>
References: <1522042736-25618-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20180328151659.6F14260ACA@smtp.codeaurora.org>
Date: Wed, 28 Mar 2018 15:16:59 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org

Govind Singh <govinds@codeaurora.org> wrote:

> WLAN qmi server running in Q6 dsp exposes host
> to target cold boot qmi handshake.
> Add WLAN QMI service helpers for WLAN serivice.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This introduced two new ath10k-check warnings:

drivers/net/wireless/ath/ath10k/qmi_svc_v01.h:304: line over 90 characters
drivers/net/wireless/ath/ath10k/qmi_svc_v01.h:464: line over 90 characters

-- 
https://patchwork.kernel.org/patch/10307161/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
