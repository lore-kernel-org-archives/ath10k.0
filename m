Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1bgu-0003rV-HC
 for ath10k@lists.infradead.org; Fri, 31 Jul 2020 20:31:45 +0000
Date: Fri, 31 Jul 2020 13:31:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 0/3]
Message-ID: <20200731133141.68d7ad81@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, kvalo@codeaurora.org

On Fri, 31 Jul 2020 23:57:19 +0530 Rakesh Pillai wrote:
> The history recording will be compiled only if
> ATH10K_DEBUG is enabled, and also enabled via
> the module parameter. Once the history recording
> is enabled via module parameter, it can be enabled
> or disabled runtime via debugfs.

Have you seen the trace_devlink_hwmsg() interface?
Could it be used here?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
