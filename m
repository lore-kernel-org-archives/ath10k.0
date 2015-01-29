Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGm7r-0006XM-M2
 for ath10k@lists.infradead.org; Thu, 29 Jan 2015 10:15:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: move wmm param storage to vif
References: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 29 Jan 2015 12:14:12 +0200
In-Reply-To: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 19 Jan 2015 09:53:41 +0100")
Message-ID: <87zj913nd7.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> mac80211 already requests WMM per vif but firmware
> wasn't able to handle this until now. However new
> wmi-tlv firmware for qca6174 is capable of this.
>
> This prepares per-vif WMM param setup.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, all three patches applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
