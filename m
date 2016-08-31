Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf0Qd-0004am-9n
 for ath10k@lists.infradead.org; Wed, 31 Aug 2016 07:59:23 +0000
MIME-Version: 1.0
Subject: Re: [RESEND,
 v4] ath10k: Fix sending NULL/ Qos NULL data frames for QCA99X0 and
 later
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1469016659-1887-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <e8de2c3a1b534b4d9b6a9b60d0946111@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 Aug 2016 09:58:56 +0200
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
> For chipsets like QCA99X0, IPQ4019 and later we are not getting proper
> NULL func status (always acked/successs !!) when hostapd does a
> PROBE_CLIENT via nullfunc frames when the station is powered off
> abruptly (inactive timer probes client via null func after the inactive
> time reaches beyond the threshold). Fix this by disabling the workaround
> introduced by the change ("ath10k: fix beacon loss handling ") for
> QCA99X0 and later chipsets. The normal tx path provides the proper
> status for NULL data frames. As of now disable this workaround for
> chipsets QCA99X0 and later, once the 10.1 firmware is obselete we can
> completely get rid of this workaround for all the chipsets
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Superseded by:

[v5] ath10k: Fix broken NULL func data frame status for 10.4

https://patchwork.kernel.org/patch/9300961/

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9239481/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
