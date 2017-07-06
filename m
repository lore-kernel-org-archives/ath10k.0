Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT5le-0008Kx-Rk
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 12:20:24 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Increase buffer len to print all wmi services.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1499059956-30051-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1499059956-30051-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <58c15d01a59543be9123d77f3ac15417@eusanexr01a.eu.qualcomm.com>
Date: Thu, 6 Jul 2017 05:19:52 -0700
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_traja@qti.qualcomm.com wrote:

> All wmi_services are not printing when we give below command.
> 
> cat /sys/kernel/debug/ieee80211/phyX/ath10k/wmi_services
> 
> This patch increases the buffer_len to 8192 to print all the wmi_services.
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

75e0dde2abf6 ath10k: increase buffer len to print all wmi services

-- 
https://patchwork.kernel.org/patch/9821955/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
