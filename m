Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwo9-0002Zb-59
 for ath10k@lists.infradead.org; Wed, 26 Aug 2020 14:54:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/4] ath10k: Add wmi command support for station specific
 TID config
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1593875614-5683-2-git-send-email-tamizhr@codeaurora.org>
References: <1593875614-5683-2-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20200826145335.8C49BC43395@smtp.codeaurora.org>
Date: Wed, 26 Aug 2020 14:53:35 +0000 (UTC)
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> This patch adds WMI interface to configure station specific
> TID configuration . Host needs to send station's MAC address
> along with TID number and its configuration to target through
> WMI_10_4_PER_PEER_PER_TID_CONFIG_CMDID.
> 
> WMI_SERVICE_PEER_TID_CONFIGS_SUPPORT flag is added to advertise
> this support.
> 
> Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00021
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

5d582be0bc66 ath10k: Add wmi command support for station specific TID config
1c0b3fbd6eb4 ath10k: Move rate mask validation function up in the file
7b2531d93bac ath10k: Add new api to support TID specific configuration
2ca6a1dd83e1 ath10k: Add new api to support reset TID config

-- 
https://patchwork.kernel.org/patch/11643791/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
