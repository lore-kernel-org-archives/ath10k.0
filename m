Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB6SX-0006by-SF
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 23:03:07 +0000
Received: by mail-pg1-x541.google.com with SMTP id g2-v6so6474942pgu.11
 for <ath10k@lists.infradead.org>; Fri, 12 Oct 2018 16:02:54 -0700 (PDT)
Date: Fri, 12 Oct 2018 16:02:50 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Message-ID: <20181012230249.GA189259@rodete-desktop-imager.corp.google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org

On Wed, Oct 10, 2018 at 05:22:53PM +0530, Govind Singh wrote:
> This series enables ath10k wifi driver support for WCN3990 target
> on sdm845 SOC. This series also updates the missing dt binding documentation
> and adds optional iommu property.

For the series:

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
