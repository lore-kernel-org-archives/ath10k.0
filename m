Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwfO-0007EW-L3
 for ath10k@lists.infradead.org; Sat, 12 Dec 2020 04:37:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: add option for chip-id based BDF selection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid>
References: <20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid>
Message-Id: <20201212043756.73F85C433CA@smtp.codeaurora.org>
Date: Sat, 12 Dec 2020 04:37:56 +0000 (UTC)
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
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: netdev@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, pillair@codeaurora.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Abhishek Kumar <kuabhs@chromium.org> wrote:

> In some devices difference in chip-id should be enough to pick
> the right BDF. Add another support for chip-id based BDF selection.
> With this new option, ath10k supports 2 fallback options.
> 
> The board name with chip-id as option looks as follows
> board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Tested-on: QCA6174 HW3.2 WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2bc2b87bb35a ath10k: add option for chip-id based BDF selection

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201207231824.v3.1.Ia6b95087ca566f77423f3802a78b946f7b593ff5@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
