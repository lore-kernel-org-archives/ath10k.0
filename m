Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqN2-0002JK-5T
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:27:08 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Add WMI_SERVICE_PERIODIC_CHAN_STAT_SUPPORT wmi service
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1470134594-10427-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <96fda91cfde14b79ae56ed649237a7a6@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:26:33 +0200
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
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> WMI_SERVICE_PERIODIC_CHAN_STAT_SUPPORT service has missed in
> the commit 7e247a9e88dc ("ath10k: add dynamic tx mode switch
> config support for qca4019"). This patch adds the service to
> avoid mismatch between host and target.
> 
> Fixes:7e247a9e88dc ("ath10k: add dynamic tx mode switch config support for qca4019")
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

64ed5771aca2 ath10k: Add WMI_SERVICE_PERIODIC_CHAN_STAT_SUPPORT wmi service

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9255437/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
